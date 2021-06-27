package com.oly.mail.service.impl;

import java.io.File;
import java.nio.file.Paths;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.mail.MessagingException;

import com.oly.mail.domain.MailTypeEnums;
import com.oly.mail.domain.MailUsedEnums;
import com.oly.mail.domain.MailVisibleEnums;
import com.oly.mail.domain.OlyMail;
import com.oly.mail.mapper.OlyMailMapper;
import com.oly.mail.service.AbstractMailService;
import com.oly.template.domain.OlyTemplate;
import com.oly.template.service.impl.OlyTemplateServiceImpl;
import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.enums.OlyStageRoot ;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.ShiroUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.service.impl.SysConfigServiceImpl;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.thymeleaf.context.Context;

/**
 * 邮件记录Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-03-17
 */
@Service
public class OlyMailServiceImpl extends AbstractMailService {
    @Autowired
    private OlyMailMapper mailMapper;

    @Autowired
    private OlyTemplateServiceImpl olyTemplateServiceImpl;

    protected OlyMailServiceImpl(SysConfigServiceImpl sysConfigService) {

        super(sysConfigService);
    }

    @Override
    public void sendTextMail(OlyMail olyMail) {
        sendMailTemplate(true, messageHelper -> {
            try {
                commonEmail(olyMail, messageHelper);
                messageHelper.setText(olyMail.getContent());
            } catch (MessagingException e) {

                throw new RuntimeException("Failed to set message subject, to or test!", e);
            }

        });
    }

    @Override
    public void sendTemplateMail(OlyMail olyMail, Map<String, Object> content) {
        sendMailTemplate(true, messageHelper -> {
            // build message content with freemarker
            Context context = new Context();
            context.setLocale(Locale.getDefault());
            context.setVariables(content);
            OlyTemplate sysTemplate = olyTemplateServiceImpl
                    .selectOlyTemplateById(Long.valueOf(String.valueOf(content.get("templateId"))));
            try {
                commonEmail(olyMail, messageHelper);
                String ts = olyTemplateServiceImpl.getTemplateEngine().process(sysTemplate.getTemplateParam(), context);
                messageHelper.setText(ts, true);
            } catch (MessagingException e) {
                throw new RuntimeException("Failed to set message subject, to or test!", e);
            }
        });

    }

    @Override
    public void sendHtmlMail(OlyMail olyMail) {
        sendMailTemplate(true, messageHelper -> {
            try {
                commonEmail(olyMail, messageHelper);
                messageHelper.setText(olyMail.getContent(), true);
            } catch (MessagingException e) {
                throw new RuntimeException("Failed to set message subject, to or test!", e);
            }
        });

    }

    private void commonEmail(OlyMail olyMail, MimeMessageHelper messageHelper) throws MessagingException {
        String to = olyMail.getToMail(), subject = olyMail.getSubject(), cc = olyMail.getCopyTo(),
                bcc = olyMail.getBccTo(), attachFilePath = olyMail.getAttachKeys();
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
        File g = null;
        if (StringUtils.isNotEmpty(attachFilePath)) {

            for (String a : attachFilePath.split(";")) {
                g = Paths.get(RuoYiConfig.getWorkPath(), OlyStageRoot .MAIL_DIR.getDir(), a).toFile();
                if (g.exists()) {
                    System.out.println(a);
                    messageHelper.addAttachment(FilenameUtils.getName(g.toString()), g);
                }

            }
        }
    }

    @Override
    public void testConnection() {
        super.testConnection();
    }

    @Override
    public OlyMail selectOlyMailById(Long mailId) {

        return mailMapper.selectOlyMailById(mailId);
    }

    @Override
    public List<OlyMail> selectOlyMailList(OlyMail olyMail) {

        return mailMapper.selectOlyMailList(olyMail);
    }

    @Override
    public int insertOlyMail(OlyMail olyMail) {

        return mailMapper.insertOlyMail(olyMail);
    }

    @Override
    public int updateOlyMail(OlyMail olyMail) {

        return mailMapper.updateOlyMail(olyMail);
    }

    @Override
    public int deleteOlyMailByIds(String ids) {

        return mailMapper.deleteOlyMailByIds(Convert.toStrArray(ids));
    }

    @Override
    public int deleteOlyMailById(Long mailId) {

        return mailMapper.deleteOlyMailById(mailId);
    }
    @Override
    public void send(OlyMail olyMail, Map<String, Object> content) {
        olyMail.setSendTime(DateUtils.getNowDate());
        olyMail.setMailUsed(MailUsedEnums.NORMAL.ordinal());
        olyMail.setVisible(MailVisibleEnums.SEND.ordinal());
        if (olyMail.getMailType() == MailTypeEnums.TEXT_MAIL.ordinal()) {
            sendTextMail(olyMail);
        } else if ((olyMail.getMailType() == MailTypeEnums.HTML_MAIL.ordinal())) {
            sendHtmlMail(olyMail);
        } else {
            sendTemplateMail(olyMail, content);
        }
        if (olyMail.getMailId() == null) {
            olyMail.setCreateBy(ShiroUtils.getUserId());
            this.insertOlyMail(olyMail);
        } else {
            this.updateOlyMail(olyMail);
        }

    }

}
