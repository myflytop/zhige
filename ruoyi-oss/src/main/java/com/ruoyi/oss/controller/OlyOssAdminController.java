package com.ruoyi.oss.controller;

import java.io.IOException;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.validation.constraints.Pattern;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.enums.OperateTitle;
import com.ruoyi.common.exception.file.FileSizeLimitExceededException;
import com.ruoyi.common.exception.file.InvalidExtensionException;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.file.MimeExtensionEnum;
import com.ruoyi.common.utils.spring.SpringUtils;
import com.ruoyi.oss.domain.OlyOss;
import com.ruoyi.oss.factory.OssFactory;
import com.ruoyi.oss.model.OssResult;
import com.ruoyi.oss.properties.OssConfigProperties;
import com.ruoyi.oss.service.OssHandler;
import com.ruoyi.oss.service.impl.OssService;
import com.ruoyi.system.config.service.ISysConfigService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/oly/oss")
@Validated
public class OlyOssAdminController extends BaseController {
    @Autowired
    private OssFactory ossHandler;
    @Autowired
    private OssService ossService;
    @Autowired
    private ISysConfigService configService;

    private final String prefix = "oly/oss";

    /**
     * 文件管理首页
     * 
     * @return
     */
    @GetMapping
    @RequiresPermissions("oly:oss:view")
    public String index() {
        return prefix + "/oss";
    }

    /**
     * 弹窗选择页
     * 
     * @return
     */
    @RequiresPermissions("oly:oss:view")
    @GetMapping("/alert")
    public String ossAlert() {
        return prefix + "/alert";
    }

    /**
     * 文件存储配置页
     * 
     * @param mmp
     * @return
     */
    @RequiresPermissions("oss:config:view")
    @GetMapping("/config")
    public String ossConfig(ModelMap mmp) {
        Map<String, String> configMap = configService
                .selectConfigMapValueByGroupName(OssConfigProperties.OSS_CONFIG_GROUP.getValue());
        mmp.put("ossConfig", configMap);
        mmp.put("maxSize", SpringUtils.getRequiredProperty("spring.servlet.multipart.max-file-size"));
        return prefix + "/config";
    }

    /**
     * 修改保存参数配置
     * 通过key批量保存
     * 默认设置为字符串类型
     * 
     * @param mp
     * @return
     */
    @RequiresPermissions("oss:config:edit")
    @Log(title = OperateTitle.SYS_OSS, businessType = BusinessType.UPDATE)
    @PostMapping("/updateByGk")
    @ResponseBody
    public AjaxResult editByGkSaves(@RequestParam Map<String, String> mp) {
        mp.put("configGroup", OssConfigProperties.OSS_CONFIG_GROUP.getValue());
        return toAjax(configService.updatesByMap(mp));
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
    @Log(title = OperateTitle.SYS_OSS, businessType = BusinessType.INSERT)
    @PostMapping("/upload")
    @ResponseBody
    public OssResult upload(MultipartFile file)
            throws IOException, FileSizeLimitExceededException, InvalidExtensionException {
        return uploadFile(file);
    }

    /**
     * 批量文件上传
     * 
     * @param files
     * @return
     * @throws Exception
     */
    @RequiresPermissions("oly:oss:upload")
    @Log(title = OperateTitle.SYS_OSS, businessType = BusinessType.INSERT)
    @PostMapping("/uploads")
    @ResponseBody
    public OssResult uploadFiles(List<MultipartFile> files) throws Exception {
        List<OlyOss> dates = new ArrayList<OlyOss>();
        for (MultipartFile file : files) {
            dates.add(uploadFile(file).getData());
        }
        return OssResult.listOk("批量上传成功", dates);
    }

    /**
     * 文件列表
     * 
     * @param olyOss
     * @return
     */
    @GetMapping("/list")
    @RequiresPermissions("oly:oss:list")
    @ResponseBody
    public TableDataInfo list(OlyOss olyOss) {
        OssHandler oso = ossHandler.get();
        olyOss.setOssType(oso.getOssType());
        startPage();
        List<OlyOss> list = ossService.selectOlyOssList(olyOss);
        TableDataInfo tableDataInfo = getDataTable(list);
        List<OlyOss> olyOses = new ArrayList<>();
        for (OlyOss o : list) {
            if (o.getFileType().equals(MimeExtensionEnum.IMAGE.name().toLowerCase())) {
                o.setThumbKey(ossHandler.get().getThumbKey(o.getFk()));
            }
            olyOses.add(o);
        }
        tableDataInfo.setRows(olyOses);
        return tableDataInfo;
    }

    /**
     * 支持自定义返回参数
     * 
     * @param file 上传文件
     * @param code 自定义返回状态
     * @param url  自定义返回路径
     * @param msg  自定义返回消息
     * @return
     * @throws FileSizeLimitExceededException
     * @throws InvalidExtensionException
     * @throws IOException
     */
    @RequiresPermissions("oly:oss:upload")
    @Log(title = OperateTitle.SYS_OSS, businessType = BusinessType.INSERT)
    @PostMapping("/upload/{code}/{url}/{msg}")
    @ResponseBody
    public Map<String, Object> uploadResult(MultipartFile file, @PathVariable("code") String code,
            @PathVariable("url") String url, @PathVariable("msg") String msg)
            throws FileSizeLimitExceededException, InvalidExtensionException, IOException {
        OssResult ossResult = uploadFile(file);
        Map<String, Object> mm = new HashMap<>();
        mm.put(code, ossResult.getCode());
        mm.put(url, ossResult.getData().getDomain() + ossResult.getData().getFk());
        mm.put(msg, ossResult.getMsg());
        return mm;
    }

    /**
     * 删除文件
     * 已经支持中文路径访问
     * 
     * @param f
     * @param y
     * @param m
     * @param d
     * @param filename
     * @return
     */
    @Log(title = OperateTitle.SYS_OSS, businessType = BusinessType.DELETE)
    @RequiresPermissions("oly:oss:delete")
    @GetMapping("/delete/{f}/{y}/{m}/{d}/{file:.+}")
    @ResponseBody
    public OssResult delete(@PathVariable("f") @Pattern(regexp = "^(?!(\\.\\.)).*$", message = "禁止特殊字符") String f,
            @PathVariable("y") @Pattern(regexp = "^\\d*$", message = "必须全是数字") String y,
            @PathVariable("m") @Pattern(regexp = "^\\d*$", message = "必须全是数字") String m,
            @PathVariable("d") @Pattern(regexp = "^\\d*$", message = "必须全是数字") String d,
            @PathVariable("file") @Pattern(regexp = "^(?![.]{2}).*$", message = "禁止特殊字符") String filename) {
        return ossHandler.get().ossDelete(Paths.get(f, y, m, d, filename).toString());
    }

    /**
     * 删除文件通过Key
     * 
     * @param key
     * @return
     */
    @Log(title = OperateTitle.SYS_OSS, businessType = BusinessType.DELETE)
    @GetMapping("/delete")
    @RequiresPermissions("oly:oss:delete")
    @ResponseBody
    public OssResult delete(String key) {
        return ossHandler.get().ossDelete(key);
    }

    /**
     * 删除文件通过文件Id
     * 
     * @param id
     * @return
     */
    @Log(title = OperateTitle.SYS_OSS, businessType = BusinessType.DELETE)
    @GetMapping("/deleteById/{id}")
    @RequiresPermissions("oly:oss:delete")
    @ResponseBody
    public OssResult delete(@PathVariable("id") Long id) {
        ossService.deleteOlyOssById(id);
        return OssResult.ok("删除附件成功", null);
    }

    /**
     * 文件上传
     * 
     * @param file
     * @return
     * @throws FileSizeLimitExceededException
     * @throws InvalidExtensionException
     * @throws IOException
     */
    private OssResult uploadFile(MultipartFile file)
            throws FileSizeLimitExceededException, InvalidExtensionException, IOException {
        String groupName = OssConfigProperties.OSS_CONFIG_GROUP.defaultValue();
        int maxLength = Integer.parseInt(
                configService.selectConfigDefaultValue(groupName, OssConfigProperties.OSS_FILE_NAME_MAX_LENGTH));
        long maxSize = Long
                .parseLong(configService.selectConfigDefaultValue(groupName, OssConfigProperties.OSS_FILE_MAX_SIZE));
        boolean chan = Boolean.parseBoolean(
                configService.selectConfigDefaultValue(groupName, OssConfigProperties.OSS_FILE_NAME_ZH_PY));
        String gx = configService.selectConfigDefaultValue(groupName, OssConfigProperties.OSS_FILE_SUPPORT_TYPE);
        String[] supportType = StringUtils.isEmpty(gx) ? null : Convert.toStrArray(gx);
        return ossHandler.get().ossUpload(file, maxLength, maxSize, chan, supportType);
    }

}
