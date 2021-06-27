package com.oly.mail.controller;

import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;
import java.util.Map;

import com.oly.mail.domain.OlyMail;
import com.oly.mail.domain.properties.EmailProperties;
import com.oly.mail.service.IOlyMailService;
import com.oly.oss.service.impl.NativeOssHandler;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.enums.OlyStageRoot;
import com.ruoyi.common.exception.job.TaskException;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.ShiroUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.quartz.domain.SysJob;
import com.ruoyi.quartz.service.ISysJobService;
import com.ruoyi.quartz.util.CronUtils;
import com.ruoyi.system.domain.SysConfig;
import com.ruoyi.system.service.impl.SysConfigServiceImpl;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.quartz.SchedulerException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
    @Autowired
    private ISysJobService jobService;

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
        if(olyMail.getMailId()!=null)
        {
            deleteOnTimeSend(olyMail.getMailId());
        }
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
        int re=olyMailService.deleteOlyMailByIds(ids);
         for (Long mailId: Convert.toLongArray(ids)) {
             deleteOnTimeSend(mailId);
         } 
        return toAjax(re);
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
     * 添加定时发送邮件
     * 
     * @throws TaskException
     * @throws SchedulerException
     */
    @RequiresPermissions("oly:mail:send")
    @Log(title = "邮件", businessType = BusinessType.INSERT)
    @PostMapping("/sendOnTime")
    @ResponseBody
    public AjaxResult sendOnTime(OlyMail olyMail, Map<String, Object> params) throws SchedulerException, TaskException {

        SysJob sysJob = new SysJob();
        // 默认组
        sysJob.setJobGroup("DEFAULT");
        // 禁用并发
        sysJob.setConcurrent("1");
        // 执行策略 一次
        sysJob.setMisfirePolicy("2");
        // cron 表达式
        sysJob.setCronExpression(DateUtils.getCron(olyMail.getSendTime()));
          // 目标方法
        sysJob.setInvokeTarget("mailTask.onTimeSend(" + olyMail.getMailId() + "L)");
        if (validateJob(sysJob)) {
            // 已经存在Id 执行更新操作   
            if (olyMail.getMailId() != null) {
                // 更新邮件记录
                olyMail.setUpdateBy(ShiroUtils.getUserId());
                olyMailService.updateOlyMail(olyMail);
                SysJob sp = new SysJob();
                 // 任务名称
                sysJob.setJobName("sendMail_" + olyMail.getMailId()+"T");
                  // 目标方法
                sysJob.setInvokeTarget("mailTask.onTimeSend(" + olyMail.getMailId() + "L)");
                //获取是否存在任务
                sp.setJobName(sysJob.getJobName());
                List<SysJob> list = jobService.selectJobList(sp);
                //任务不存在直接插入任务
                if (list == null || list.size() == 0) {   
                    sysJob.setCreateBy(ShiroUtils.getLoginName()); 
                    jobService.insertJob(sysJob);
                } //任务存在直接更新
                else if (list.size() == 1) {
                    sp = list.get(0);
                    sp.setCronExpression(sysJob.getCronExpression());
                    sp.setUpdateBy(ShiroUtils.getLoginName());
                    // 更新定时邮件,强制更新与默认参数一样
                    jobService.updateJob(sp);
                }
                else{
                    return error("任务名可能作为其它任务前缀!");
                }

            } else {
                olyMail.setCreateBy(ShiroUtils.getUserId());
                // 插入邮件记录
                olyMailService.insertOlyMail(olyMail);
                // 目标方法
                sysJob.setJobName("sendMail_" + olyMail.getMailId()+"T");
                // 目标方法
                sysJob.setInvokeTarget("mailTask.onTimeSend(" + olyMail.getMailId() + "L)");
                sysJob.setCreateBy(ShiroUtils.getLoginName());
                jobService.insertJob(sysJob);
            }
            // 状态正常
            sysJob.setStatus("0");
            jobService.changeStatus(sysJob);
            return AjaxResult.success("任务已经添加或者已经修改！");
        } else {
            return error("cron表达式转换失败！");
        }
    }

    public boolean validateJob(@Validated SysJob job) throws SchedulerException, TaskException {
        if (!CronUtils.isValid(job.getCronExpression())) {
            return false;
        }
        return true;
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

        return AjaxResult.success(osshander.ossAppointUpload(file, OlyStageRoot.MAIL_DIR));
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
        if (Paths.get(RuoYiConfig.getWorkPath(), OlyStageRoot.MAIL_DIR.getDir(), attachKey).toFile().isFile()) {
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

    private void deleteOnTimeSend(Long mailId) {
        SysJob job = new SysJob();
        job.setJobName("sendMail_" + mailId+"T");
        List<SysJob> list = jobService.selectJobList(job);  
        if (list != null && list.size() == 1) {
            try {
                jobService.deleteJob(list.get(0));
            } catch (SchedulerException e) {
             
            }
        } 
    }

}
