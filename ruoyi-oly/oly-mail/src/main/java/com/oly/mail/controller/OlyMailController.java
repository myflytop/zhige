package com.oly.mail.controller;

import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;
import java.util.Map;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.enums.OlyStageRoot ;
import com.oly.common.constant.OlySystemConstant;
import com.oly.mail.domain.OlyMail;
import com.oly.mail.domain.properties.EmailProperties;
import com.oly.mail.service.IOlyMailService;
import com.oly.oss.service.impl.NativeOssHandler;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.ShiroUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.system.domain.SysConfig;
import com.ruoyi.system.service.impl.SysConfigServiceImpl;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 邮件Controller
 * 
 * @author hush
 * @date 2021-03-06
 */
@Controller
@RequestMapping("/oly/mail")
public class OlyMailController extends BaseController {
    private String prefix = "oly/mail";

    @Autowired
    private IOlyMailService olyMailService;

    @Autowired
    private NativeOssHandler osshander;
    @Autowired
    private SysConfigServiceImpl configService;

    @RequiresPermissions("oly:mail:view")
    @GetMapping()
    public String mail() {
        return prefix + "/mail";
    }

    /**
     * 查询邮件列表
     */
    @RequiresPermissions("oly:mail:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(OlyMail olyMail) {
        startPage();
        List<OlyMail> list = olyMailService.selectOlyMailList(olyMail);
        return getDataTable(list);
    }

    /**
     * 导出邮件列表
     */
    @RequiresPermissions("oly:mail:export")
    @Log(title = "邮件", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(OlyMail olyMail) {
        List<OlyMail> list = olyMailService.selectOlyMailList(olyMail);
        ExcelUtil<OlyMail> util = new ExcelUtil<OlyMail>(OlyMail.class);
        return util.exportExcel(list, "mail");
    }

    /**
     * 新增邮件
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 新增保存邮件
     */
    @RequiresPermissions("oly:mail:add")
    @Log(title = "邮件", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(OlyMail olyMail) {
        olyMail.setCreateBy(ShiroUtils.getUserId());
        return toAjax(olyMailService.insertOlyMail(olyMail));
    }

    @GetMapping("/config")
    public String config(ModelMap mmp) {
        SysConfig sysConfig = new SysConfig();
        sysConfig.setConfigKey(EmailProperties.PREFIX.getValue());
        mmp.put("mail", configService.selectConfigValueMap(sysConfig));
        return prefix + "/config";
    }

    /**
     * 修改邮件
     */
    @GetMapping("/edit/{mailId}")
    public String edit(@PathVariable("mailId") Long mailId, ModelMap mmap) {
        OlyMail olyMail = olyMailService.selectOlyMailById(mailId);
        mmap.put("olyMail", olyMail);
        return prefix + "/edit";
    }

    /**
     * 修改保存邮件
     */
    @RequiresPermissions("oly:mail:edit")
    @Log(title = "邮件", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(OlyMail olyMail) {
        return toAjax(olyMailService.updateOlyMail(olyMail));
    }

    /**
     * 删除邮件
     */
    @RequiresPermissions("oly:mail:remove")
    @Log(title = "邮件", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(olyMailService.deleteOlyMailByIds(ids));
    }

    /**
     * 发送邮件邮件
     */
    @RequiresPermissions("oly:mail:send")
    @Log(title = "邮件", businessType = BusinessType.INSERT)
    @PostMapping("/send")
    @ResponseBody
    public AjaxResult send(OlyMail olyMail, Map<String, Object> params) {
        olyMailService.send(olyMail, params);
        return AjaxResult.success();
    }

    /**
     * 上传附件
     * 
     * @param multipartFile
     * @return
     * @throws IOException
     */
    @PostMapping("/uploadAttach")
    @ResponseBody
    public AjaxResult uploadAttach(MultipartFile file) throws IOException {

        return AjaxResult.success(osshander.ossAppointUpload(file, OlyStageRoot .MAIL_DIR));
    }

    /**
     * 检查附件
     * 
     * @param multipartFile
     * @return
     * @throws IOException
     */
    @PostMapping("/chakeAttach")
    @ResponseBody
    public AjaxResult checkAttach(String attachKey) throws IOException {
        if (Paths.get(OlySystemConstant.getUserHome(), OlyStageRoot .MAIL_DIR.getDir(), attachKey).toFile().isFile()) {

            return AjaxResult.success();
        }
        return AjaxResult.error();
    }

    @GetMapping("/u")
    @ResponseBody
    public AjaxResult upl(MultipartFile multipartFile) {
        olyMailService.testConnection();
        return toAjax(1);
    }

}
