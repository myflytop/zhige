package com.ruoyi.message.mail.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.util.ShiroUtils;
import com.ruoyi.message.mail.domain.MailUsedEnums;
import com.ruoyi.message.mail.domain.MsgEmail;
import com.ruoyi.message.mail.service.IMsgEmailService;
import com.ruoyi.system.domain.SysConfig;
import com.ruoyi.system.service.impl.SysConfigServiceImpl;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Map;


/**
 * 邮件记录Controller
 *
 * @author ruoyi
 * @date 2020-03-17
 */
@Controller
@RequestMapping("/message/email")
public class MsgEmailController extends BaseController
{
    private String prefix = "message/email";
    final static String CACHE_SUB_DIR = "/cacheUpload";

    @Autowired
    private IMsgEmailService msgEmailService;

    @Autowired
    private SysConfigServiceImpl sysConfigService;

    @RequiresPermissions("message:email:view")
    @GetMapping()
    public String email()
    {
        return prefix + "/email";
    }


    @GetMapping("/config")
    public String config(ModelMap mmp)
    {
        Map<String, SysConfig> email=sysConfigService.selectConfigMap("email_");
        mmp.put("mail",email);
        return prefix + "/config";
    }

    /**
     * 查询邮件记录列表
     */
    @RequiresPermissions("message:email:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(MsgEmail msgEmail)
    {
        startPage();
        List<MsgEmail> list = msgEmailService.selectMsgEmailList(msgEmail);
        return getDataTable(list);
    }

    /**
     * 导出邮件记录列表
     */
 /*   @RequiresPermissions("message:email:export")
    @Log(title = "邮件记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(MsgEmail msgEmail)
    {
        List<MsgEmail> list = msgEmailService.selectMsgEmailList(msgEmail);
        ExcelUtil<MsgEmail> util = new ExcelUtil<MsgEmail>(MsgEmail.class);
        return util.exportExcel(list, "email");
    }*/

    /**
     * 新增邮件记录
     */
    @GetMapping("/add")
    @RequiresPermissions("message:email:add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存邮件记录
     */
    @RequiresPermissions("message:email:add")
    @Log(title = "邮件记录", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(MsgEmail msgEmail,String attachFilePath)
    {

        System.out.println(msgEmail.getParams());
        msgEmail.setCreateBy(ShiroUtils.getUserId().toString());
        if(msgEmail.getEmailType()==0) {
            msgEmailService.sendTextMail(msgEmail.getToEmail(), msgEmail.getSubject(), msgEmail.getContent(), attachFilePath, msgEmail.getCopyTo(), msgEmail.getBccTo(), MailUsedEnums.NORMAL);
        }
        else {
            msgEmailService.sendTemplateMail(msgEmail.getToEmail(), msgEmail.getSubject(), msgEmail.getParams(), attachFilePath, msgEmail.getCopyTo(), msgEmail.getBccTo(),MailUsedEnums.NORMAL);
        }
        return toAjax(0);
    }

    /**
     * 修改邮件记录
     */
  /*  @GetMapping("/edit/{mailId}")
    public String edit(@PathVariable("mailId") Long mailId, ModelMap mmap)
    {
        MsgEmail msgEmail = msgEmailService.selectMsgEmailById(mailId);
        mmap.put("msgEmail", msgEmail);
        return prefix + "/edit";
    }
*/
    /**
     * 修改保存邮件记录
     */
 /*   @RequiresPermissions("message:email:edit")
    @Log(title = "邮件记录", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(MsgEmail msgEmail)
    {
        return toAjax(msgEmailService.updateMsgEmail(msgEmail));
    }*/

    /**
     * 删除邮件记录
     */
    @RequiresPermissions("message:email:remove")
    @Log(title = "邮件记录", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(msgEmailService.deleteMsgEmailByIds(ids));
    }

    @GetMapping("/sendTextMail")
    @ResponseBody
    public AjaxResult sendTextMail(String to, String subject, String content, MultipartFile multipartFile, String cc, String bcc){
        msgEmailService.sendTextMail(to,subject,content,"C:\\Users\\huazh\\Desktop\\202003060503585e62123ae5086.png;C:\\Users\\huazh\\Desktop\\10001922_1582525225072_750x750.png",cc,bcc,MailUsedEnums.NORMAL);
        return AjaxResult.success("发送成功！");

    }

    /**
     * 上传附件
     * @param multipartFile
     * @return
     */
    @PostMapping("/uploadAttachFile")
    @ResponseBody
    public AjaxResult uploadAttachFile(MultipartFile multipartFile) throws IOException {
        String d=System.getProperties().getProperty("user.home")+CACHE_SUB_DIR;
        String originalBasename=multipartFile.getOriginalFilename();
        if(originalBasename.contains("\\")) {
            originalBasename = originalBasename.substring(originalBasename.lastIndexOf('\\') + 1);
        }
        Path uploadPath = Paths.get(d,originalBasename);
        if (!uploadPath.getParent().toFile().exists())
        {
            uploadPath.getParent().toFile().mkdirs();
        }

        try {
            multipartFile.transferTo(uploadPath);
            return AjaxResult.success(uploadPath.toString());
        } catch (IOException e) {
           throw new IOException();
        }
    }
    @GetMapping("/u")
    @ResponseBody
    public AjaxResult upl(MultipartFile multipartFile){
        msgEmailService.testConnection();
       return toAjax(1);
    }
}
