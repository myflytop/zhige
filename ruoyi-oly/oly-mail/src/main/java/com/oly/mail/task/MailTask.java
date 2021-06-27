package com.oly.mail.task;

import java.util.List;

import com.oly.mail.domain.OlyMail;
import com.oly.mail.service.impl.OlyMailServiceImpl;
import com.ruoyi.common.exception.BusinessException;
import com.ruoyi.quartz.domain.SysJob;
import com.ruoyi.quartz.service.impl.SysJobServiceImpl;

import org.quartz.SchedulerException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * MailTask
 */
@Component("mailTask")
public class MailTask {

    @Autowired
    private OlyMailServiceImpl olyMailService;

    @Autowired
    private SysJobServiceImpl jobService;

    /**
     * 定时发送邮件
     * 
     * @param mailId
     * @throws SchedulerException
     */
    public void onTimeSend(Long mailId) throws SchedulerException {
        SysJob job = new SysJob();
        job.setJobName("sendMail_" + mailId+"T");
        List<SysJob> list = jobService.selectJobList(job);
        OlyMail olyMail = olyMailService.selectOlyMailById(mailId);
        if (olyMail == null) {
            throw new BusinessException("定时发送邮件不存,请检查！");
        } else {
            olyMailService.send(olyMail, null);
        }
        if (list != null && list.size() == 1) {
            jobService.deleteJob(list.get(0));
        } else {
            throw new BusinessException("删除邮件定时任务失败！");
        }
    }
}