package com.ruoyi.oss.web.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.oss.api.OssResult;
import com.ruoyi.oss.api.enums.OssEnum;
import com.ruoyi.oss.factory.OssFactory;
import com.ruoyi.system.domain.SysConfig;
import com.ruoyi.system.service.impl.SysConfigServiceImpl;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.tika.Tika;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/oss")
public class OssHanderController extends BaseController {

    @Autowired
    private OssFactory ossHandler;

    @Autowired
    private SysConfigServiceImpl configService;

    private  final String preifx="oss";


    @GetMapping
    public String oss(){
       return preifx+"/oss";
    }

    /**
     * 弹窗选择
     * @return
     */
    @RequiresPermissions("oss:memory:view")
    @GetMapping("/alert")
    public String ossAlert(){
        return preifx+"/alert";
    }

    /**
     * 储存配置
     * @param mmp
     * @return
     */
    @RequiresPermissions("oss:memory:config")
    @GetMapping("/config")
    public String ossConfig(ModelMap mmp){
        SysConfig sysConfig=new SysConfig();
        sysConfig.setConfigKey(OssEnum.OSS_PREIFX.getValue());
        List<SysConfig> sysConfigs= configService.selectConfigList(sysConfig);
        Map<String, String> configMap = sysConfigs.stream().collect(Collectors.toMap(SysConfig::getConfigKey, SysConfig::getConfigValue));
        mmp.put("ossConfig",configMap);
        return preifx+"/config";
    }

    /**
     * oss文件上传
     * @param file
     * @return
     * @throws IOException
     */
    @RequiresPermissions("oss:memory:upload")
    @Log(title = "文件内容管理", businessType = BusinessType.INSERT)
    @PostMapping("/upload")
    @ResponseBody
    public OssResult upload(MultipartFile file) throws IOException {
        return ossHandler.get().ossUpload(file,null);
    }

    /**
     * 获取文件列表
     * @param path
     * @return
     */
    @GetMapping("/list")
    @RequiresPermissions("oss:memory:view")
    @ResponseBody
    public OssResult list(String path/*, String accept, int startNum, int maxNum*/){

        return ossHandler.get().ossList(path, "accept",  0, 0);
    }
    @Log(title = "内容文章管理", businessType = BusinessType.DELETE)
    @GetMapping("/delete")
    @ResponseBody
    public OssResult delete(String path){

        return ossHandler.get().ossDelete(path);
    }

    /**
     * 查看原文件 本地
     */
    @GetMapping("/download/{f}/{y}/{m}/{file:.+}")
    public void download(@PathVariable("f") String f,@PathVariable("y") String y, @PathVariable("m") String m,  @PathVariable("file") String filename, HttpServletResponse response) {
        String fileDir = f+"/"+y + "/" + m  + "/" + filename;

        outputFile(fileDir, response);
    }
    // 输出文件流
    private void outputFile(String fileDir, HttpServletResponse response) {
        // 判断文件是否存在
        File inFile = new File(System.getProperties().getProperty("user.home")+"/uploadRoot", fileDir);
        if (!inFile.exists()) {
            PrintWriter writer = null;
            try {
                response.setContentType("text/html;charset=UTF-8");
                writer = response.getWriter();
                writer.write("<!doctype html><title>404 Not Found</title><h1 style=\"text-align: center\">404 Not Found</h1><hr/><p style=\"text-align: center\">Easy File Server</p>");
                writer.flush();
            } catch (IOException e) {
                e.printStackTrace();
            }
            return;
        }
        // 获取文件类型
        String contentType = null;
        try {
            // Path path = Paths.get(inFile.getName());
            // contentType = Files.probeContentType(path);
            contentType = new Tika().detect(inFile);
        } catch (IOException e) {
            e.printStackTrace();
        }
        if (contentType != null) {
            response.setContentType(contentType);
        } else {
            response.setContentType("application/force-download");
            String newName;
            try {
                newName = URLEncoder.encode(inFile.getName(), "utf-8");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
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
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                is.close();
                os.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }


}
