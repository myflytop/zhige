package com.ruoyi.mail.service.impl;

import java.io.File;
import java.nio.file.Paths;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.mail.MessagingException;

import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.enums.OlyStageRoot;
import com.ruoyi.common.utils.ShiroUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.mail.domain.MailTypeEnums;
import com.ruoyi.mail.domain.MailUsedEnums;
import com.ruoyi.mail.domain.OlyMail;
import com.ruoyi.mail.mapper.OlyMailMapper;
import com.ruoyi.mail.service.AbstractMailService;
import com.ruoyi.system.config.service.impl.SysConfigServiceImpl;
import com.ruoyi.template.domain.OlyTemplate;
import com.ruoyi.template.service.impl.OlyTemplateServiceImpl;
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
    private OlyTemplateServiceImpl olyTemplateServiceImpl;

   private SysConfigServiceImpl sysConfigService;
   
   @Autowired
   private OlyMailMapper mailMapper;

    protected OlyMailServiceImpl(SysConfigServiceImpl sysConfigService){
        super(sysConfigService);
        this.sysConfigService=sysConfigService;
    }

    @Override
    public void sendTextMail(OlyMail olyMail, Boolean system) {
        sendMailTemplate(true,olyMail, messageHelper -> {
            try {
                commonEmail(olyMail, system, messageHelper);
                messageHelper.setText(olyMail.getContent());
            } catch (MessagingException e) {
                throw new RuntimeException("Failed to set message subject, to or test!", e);
            }

        });
    }

    @Override
    public void sendTemplateMail(OlyMail olyMail, Map<String, Object> content, Boolean system) {
        OlyTemplate sysTemplate = olyTemplateServiceImpl
        .selectOlyTemplateById(Long.valueOf(String.valueOf(content.get("templateId"))));
        Context context = new Context();
        context.setLocale(Locale.getDefault());
        context.setVariables(content);
        String ts = olyTemplateServiceImpl.getTemplateEngine().process(sysTemplate.getTemplateParam(), context);
        olyMail.setContent(ts);
        sendMailTemplate(true, olyMail,messageHelper -> {
            try {
                commonEmail(olyMail, system, messageHelper);          
                messageHelper.setText(ts, true);
            } catch (MessagingException e) {
                throw new RuntimeException("Failed to set message subject, to or test!", e);
            }
        });

    }

    @Override
    public void sendHtmlMail(OlyMail olyMail, Boolean system) {
        sendMailTemplate(true,olyMail, messageHelper -> {
            try {
                commonEmail(olyMail, system, messageHelper);
                messageHelper.setText(olyMail.getContent(), true);
            } catch (MessagingException e) {
                throw new RuntimeException("Failed to set message subject, to or test!", e);
            }
        });

    }

    private void commonEmail(OlyMail olyMail, Boolean system, MimeMessageHelper messageHelper)
            throws MessagingException {
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
                if (!system) {
                    g = Paths.get(OlyStageRoot.MAIL_DIR.getRoot(a)).toFile();
                } else {
                    g = Paths.get(a).toFile();
                }
                if (g.exists()) {
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
        olyMail.setCreateBy(ShiroUtils.getUserIdStr());
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
        olyMail.setMailUsed(MailUsedEnums.NORMAL.ordinal());
        if (olyMail.getMailType() == MailTypeEnums.TEXT_MAIL.ordinal()) {
            sendTextMail(olyMail, false);
        } else if ((olyMail.getMailType() == MailTypeEnums.HTML_MAIL.ordinal())) {
            sendHtmlMail(olyMail, false);
        } else {
            sendTemplateMail(olyMail, content, false);
        }
    }

    @Override
    public int updateConfigByMap(Map<String, String> mp) {
         int count=sysConfigService.updatesByMap(mp);
         clearCache();
        return count;
    }


}
