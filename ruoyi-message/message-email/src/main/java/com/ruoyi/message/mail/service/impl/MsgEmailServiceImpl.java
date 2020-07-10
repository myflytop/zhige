package com.ruoyi.message.mail.service.impl;

import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.message.mail.config.MailSenderFactory;
import com.ruoyi.message.mail.domain.MailTypeEnums;
import com.ruoyi.message.mail.domain.MailUsedEnums;
import com.ruoyi.message.mail.domain.MsgEmail;
import com.ruoyi.message.mail.mapper.MsgEmailMapper;
import com.ruoyi.message.mail.service.AbstractMailService;
import com.ruoyi.system.domain.SysTemplate;
import com.ruoyi.system.service.impl.SysConfigServiceImpl;
import com.ruoyi.system.service.impl.SysTemplateServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.thymeleaf.context.Context;

import javax.mail.MessagingException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/**
 * 邮件记录Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-03-17
 */
@Service
public class MsgEmailServiceImpl extends AbstractMailService
{
    @Autowired
    private MsgEmailMapper msgEmailMapper;



    @Autowired
    private SysTemplateServiceImpl sysTemplateService;

    private  MailSenderFactory mailSenderFactory=new MailSenderFactory();


    protected MsgEmailServiceImpl(SysConfigServiceImpl sysConfigService) {
        super(sysConfigService);
    }

    /**
     * 查询邮件记录
     * 
     * @param mailId 邮件记录ID
     * @return 邮件记录
     */
    @Override
    public MsgEmail selectMsgEmailById(Long mailId)
    {
        return msgEmailMapper.selectMsgEmailById(mailId);
    }

    /**
     * 查询邮件记录列表
     * 
     * @param msgEmail 邮件记录
     * @return 邮件记录
     */
    @Override
    public List<MsgEmail> selectMsgEmailList(MsgEmail msgEmail)
    {
        return msgEmailMapper.selectMsgEmailList(msgEmail);
    }

    /**
     * 新增邮件记录
     * 
     * @param msgEmail 邮件记录
     * @return 结果
     */
    @Override
    public int insertMsgEmail(MsgEmail msgEmail)
    {
        msgEmail.setCreateTime(DateUtils.getNowDate());
        return msgEmailMapper.insertMsgEmail(msgEmail);
    }

    /**
     * 修改邮件记录
     * 
     * @param msgEmail 邮件记录
     * @return 结果
     */
    @Override
    public int updateMsgEmail(MsgEmail msgEmail)
    {
        return msgEmailMapper.updateMsgEmail(msgEmail);
    }

    /**
     * 删除邮件记录对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteMsgEmailByIds(String ids)
    {
        return msgEmailMapper.deleteMsgEmailByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除邮件记录信息
     * 
     * @param mailId 邮件记录ID
     * @return 结果
     */
    @Override
    public int deleteMsgEmailById(Long mailId)
    {
        return msgEmailMapper.deleteMsgEmailById(mailId);
    }

    @Override
    public void sendTextMail(String to, String subject, String content,String attachFilePath, String cc, String bcc, MailUsedEnums mailUsedEnums) {
        sendMailTemplate(true, messageHelper -> {

            commonEmail(to,subject,attachFilePath, cc, bcc, messageHelper);
            messageHelper.setText(content);
            recordMail(to,subject, content, cc, bcc, mailUsedEnums, MailTypeEnums.TEXT_MAIL);
        });
    }

    @Override
    public void sendTemplateMail(String to, String subject, Map<String, Object> content,String attachFilePath, String cc, String bcc, MailUsedEnums mailUsedEnums) {
        sendMailTemplate(true, messageHelper -> {
            // build message content with freemarker
            Context context=new Context();
            context.setLocale(Locale.getDefault());
            context.setVariables(content);
            SysTemplate sysTemplate=sysTemplateService.selectSysTemplateById(Long.valueOf(String.valueOf(content.get("templateId"))));
            commonEmail(to,subject,attachFilePath, cc, bcc, messageHelper);
            String ts=sysTemplateService.getTemplateEngine().process(sysTemplate.getTemplateHtml(),context);
            messageHelper.setText(ts, true);
            recordMail(to,subject, ts, cc, bcc, mailUsedEnums, MailTypeEnums.TEMPLATE_MAIL);
        });

    }



    @Override
    public void sendHtmlMail(String to, String subject, String content,String attachFilePath, String cc, String bcc, MailUsedEnums mailUsedEnums) {
        sendMailTemplate(true, messageHelper -> {
            commonEmail(to,subject,attachFilePath, cc, bcc, messageHelper);
            messageHelper.setText(content,true);
            recordMail(to,subject, content, cc, bcc, mailUsedEnums, MailTypeEnums.HTML_MAIL);
        });

    }
    private void commonEmail(String to, String subject,String attachFilePath, String cc, String bcc, MimeMessageHelper messageHelper) throws MessagingException {
        messageHelper.setTo(to);
        messageHelper.setSubject(subject);
        if (StringUtils.isNotEmpty(cc)) {
            for (String cs : cc.split(";")) {
                messageHelper.addCc(cs);
            }
        }
        if (StringUtils.isNotEmpty(bcc)) {
            for (String ms : bcc.split(";")) {
                messageHelper.addCc(ms);
            }
        }
        Path g = null;
        if (StringUtils.isNotEmpty(attachFilePath)) {
            for (String at : attachFilePath.split(";")) {
                g = Paths.get(at);
                if (g.toFile().exists()) {
                    messageHelper.addAttachment(g.getFileName().toString(), g.toFile());
                }

            }
        }
    }
    private void recordMail(String to,String subject, String content, String cc, String bcc, MailUsedEnums mailUsedEnums, MailTypeEnums htmlMail) {
        MsgEmail msgEmail = new MsgEmail();
        msgEmail.setFromEmail(super.getMailProperties().getUsername());
        msgEmail.setToEmail(to);
        msgEmail.setCopyTo(bcc);
        msgEmail.setCopyTo(cc);
        msgEmail.setSubject(subject);
        msgEmail.setContent(content);
        msgEmail.setEmailUse(mailUsedEnums.ordinal());
        msgEmail.setEmailType(mailUsedEnums.ordinal());
        this.insertMsgEmail(msgEmail);
    }

    @Override
    public void testConnection() {
    super.testConnection();
    }






}
