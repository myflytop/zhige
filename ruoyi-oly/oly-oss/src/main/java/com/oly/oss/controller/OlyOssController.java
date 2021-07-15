package com.oly.oss.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;
import com.oly.oss.domain.OlyOss;
import com.oly.oss.enums.OssDirEnum;
import com.oly.oss.enums.OssEnum;
import com.oly.oss.factory.OssFactory;
import com.oly.oss.model.OssResult;
import com.oly.oss.service.OssHandler;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.enums.OlyStageRoot;
import com.ruoyi.common.exception.file.FileSizeLimitExceededException;
import com.ruoyi.common.exception.file.InvalidExtensionException;
import com.ruoyi.system.domain.SysConfig;
import com.ruoyi.system.service.impl.SysConfigServiceImpl;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.tika.Tika;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/oly/oss")
public class OlyOssController extends BaseController {

    private static final Logger log = LoggerFactory.getLogger(OlyOssController.class);
    @Autowired
    private OssFactory ossHandler;
    @Autowired
    private SysConfigServiceImpl configService;
    private final String preifx = "oly/oss";

    // 文件管理首页
    @GetMapping
    @RequiresPermissions("oly:oss:view")
    public String oss() {
        return preifx + "/oss";
    }

    // 弹窗选择页
    @RequiresPermissions("oly:oss:view")
    @GetMapping("/alert")
    public String ossAlert() {
        return preifx + "/alert";
    }

    // 文件存储配置页
    @RequiresPermissions("oly:oss:config")
    @GetMapping("/config")
    public String ossConfig(ModelMap mmp) {
        SysConfig sysConfig = new SysConfig();
        sysConfig.setConfigKey(OssEnum.OSS_PREFIX.getValue());
        Map<String, String> configMap = configService.selectConfigValueMap(sysConfig);
        mmp.put("ossConfig", configMap);
        return preifx + "/config";
    }

    /**
     * 文件上传
     * 
     * @param file
     * @return
     * @throws IOException
     * @throws InvalidExtensionException
     * @throws FileSizeLimitExceededException
     */
    @RequiresPermissions("oly:oss:upload")
    @Log(title = "文件管理", businessType = BusinessType.INSERT)
    @PostMapping("/upload")
    @ResponseBody
    public OssResult upload(MultipartFile file)
            throws IOException, FileSizeLimitExceededException, InvalidExtensionException {
        return ossHandler.get().ossUpload(file);
    }

    @GetMapping("/list")
    @RequiresPermissions("oly:oss:view")
    @ResponseBody
    public TableDataInfo list(OlyOss olyOss) {
        OssHandler ossService = ossHandler.get();
        startPage();
        List<OlyOss> list = ossService.ossList(olyOss);
        TableDataInfo tableDataInfo = getDataTable(list);
        List<OlyOss> olyOsses = new ArrayList<>();
        for (OlyOss o : list) {
            if (o.getFileType().equals(OssDirEnum.IMAGE.getDir())) {
                o.setThumbKey(ossHandler.get().getThumbKey(o.getFk()));
            }
            olyOsses.add(o);
        }
        tableDataInfo.setRows(olyOsses);
        return tableDataInfo;
    }

    /**
     * {y}/{m}/{file:.+} 相当于文件key 形如/2020/2/xxx.png
     * 
     * @param y
     * @param m
     * @param filename
     * @return
     */
    @Log(title = "文件管理", businessType = BusinessType.DELETE)
    @GetMapping("/delete/{f}/{y}/{m}/{d}/{file:.+}")
    @ResponseBody
    public OssResult delete(@PathVariable("f") String f, @PathVariable("y") String y, @PathVariable("m") String m,
            @PathVariable("d") String d, @PathVariable("file") String filename) {
        return ossHandler.get().ossDelete(Paths.get(f, y, m, d, filename).toString());
    }

    /**
     * 
     * @param f        文件夹
     * @param y        年
     * @param m        月
     * @param d        日
     * @param filename 文件名
     * @param response
     */
    @GetMapping("/download/{f}/{y}/{m}/{d}/{file:.+}")
    public void download(@PathVariable("f") String f, @PathVariable("y") String y, @PathVariable("m") String m,
            @PathVariable("d") String d, @PathVariable("file") String filename, HttpServletResponse response) {

        outputFile(Paths.get(RuoYiConfig.getProfile(), f, y, m, d, filename).toString(), response);
    }

    /**
     * 头像地址
     */
    @GetMapping("/download/avatar/{key:.+}")
    public void download(@PathVariable("key") String key, HttpServletResponse response) {
        outputFile(Paths.get(RuoYiConfig.getWorkPath(), OlyStageRoot.HEARD_DIR.getDir(), key).toString(), response);
    }

    // 输出文件流
    private void outputFile(String fileDir, HttpServletResponse response) {
        // 判断文件是否存在
        File inFile = new File(fileDir);
        if (!inFile.exists()) {
            PrintWriter writer = null;
            try {
                response.setContentType("text/html;charset=UTF-8");
                writer = response.getWriter();
                writer.write(
                        "<!doctype html><title>404 Not Found</title><h1 style=\"text-align: center\">404 Not Found</h1><hr/><p style=\"text-align: center\">Easy File Server</p>");
                writer.flush();
            } catch (IOException e) {
                log.debug("文件不存在:" + fileDir + ",e" + e.getMessage());
            }
            return;
        }
        // 获取文件类型
        String contentType = null;
        try {
            contentType = new Tika().detect(inFile);
        } catch (IOException e) {
            log.debug("获取文件头异常:" + fileDir + ",e" + e.getMessage());
        }
        if (contentType != null) {
            response.setContentType(contentType);
        } else {
            response.setContentType("application/force-download");
            String newName;
            try {
                newName = URLEncoder.encode(inFile.getName(), "utf-8");
            } catch (UnsupportedEncodingException e) {
                log.debug("不支持的编码:" + fileDir + ",e" + e.getMessage());
                newName = inFile.getName();
            }
            response.setHeader("Content-Disposition", "attachment;fileName=" + newName);
        }
        // 输出文件流
        OutputStream os = null;
        FileInputStream is = null;
        try {
            is = new FileInputStream(inFile);
            os = response.getOutputStream();
            byte[] bytes = new byte[1024];
            int len;
            while ((len = is.read(bytes)) != -1) {
                os.write(bytes, 0, len);
            }
            os.flush();
        } catch (FileNotFoundException e) {
            log.debug("文件不存在:" + fileDir + ",e" + e.getMessage());
        } catch (IOException e) {
            log.debug("io异常:" + fileDir + ",e" + e.getMessage());
        } finally {
            try {
                is.close();
                os.close();
            } catch (IOException e) {
                log.debug("异常:" + fileDir + ",e" + e.getMessage());
            }
        }
    }

}
