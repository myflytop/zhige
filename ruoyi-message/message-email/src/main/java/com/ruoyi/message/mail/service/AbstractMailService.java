package com.ruoyi.message.mail.service;
import com.ruoyi.framework.aspectj.LogAspect;
import com.ruoyi.message.mail.config.DefaultMailProperties;
import com.ruoyi.message.mail.config.MailSenderFactory;
import com.ruoyi.message.mail.domain.properties.EmailProperties;
import com.ruoyi.system.domain.SysConfig;
import com.ruoyi.system.service.impl.SysConfigServiceImpl;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.autoconfigure.mail.MailProperties;
import org.springframework.lang.NonNull;
import org.springframework.lang.Nullable;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.util.Assert;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Abstract mail service.
 *
 * @author johnniang
 */
public abstract class AbstractMailService implements IMsgEmailService {

    private static final int DEFAULT_POOL_SIZE = 5;
    protected final SysConfigServiceImpl sysConfigService;
    private JavaMailSender cachedMailSender;
    private DefaultMailProperties cachedMailProperties;
    private String cachedFromName;
    private Map<String, SysConfig> sysConfigMap;
    private static final Logger log = LoggerFactory.getLogger(LogAspect.class);

    @Nullable
    private ExecutorService executorService;

    protected AbstractMailService(SysConfigServiceImpl sysConfigService) {
        this.sysConfigService = sysConfigService;
    }

    @NonNull
    public ExecutorService getExecutorService() {
        if (this.executorService == null) {
            this.executorService = Executors.newFixedThreadPool(DEFAULT_POOL_SIZE);
        }
        return executorService;
    }

    public void setExecutorService(ExecutorService executorService) {
        this.executorService = executorService;
    }

    /**
     * Test connection with email server.
     */
    @Override
    public void testConnection() {
        JavaMailSender javaMailSender = getMailSender();
        if (javaMailSender instanceof JavaMailSenderImpl) {
            JavaMailSenderImpl mailSender = (JavaMailSenderImpl) javaMailSender;
            try {
                mailSender.testConnection();
            } catch (MessagingException e) {
              log.info("无法连接到邮箱服务器，请检查邮箱配置.[" + e.getMessage() + "]", e);
            }
        }
    }

    /**
     * Send mail template.
     *
     * @param callback mime message callback.
     */
    protected void sendMailTemplate(@Nullable Callback callback) {
        if (callback == null) {
            log.info("Callback is null, skip to send email");
            return;
        }

        // 检查是否开启邮件服务
        Boolean emailEnabled = Boolean.valueOf(getMailMapConfig().get(EmailProperties.ENABLED.getValue()).getConfigValue());

        if (!emailEnabled) {
            // If disabled
            log.info("Email has been disabled by yourself, you can re-enable it through email settings on admin page.");
            return;
        }

        // get mail sender
        JavaMailSender mailSender = getMailSender();
        printMailConfig();
        try {
            // create mime message helper
            MimeMessageHelper messageHelper = new MimeMessageHelper(mailSender.createMimeMessage(),true);
            // set from-name
            messageHelper.setFrom(getFromAddress(mailSender));
            // handle message set separately
            callback.handle(messageHelper);

            // get mime message
            MimeMessage mimeMessage = messageHelper.getMimeMessage();
            // send email
            mailSender.send(mimeMessage);

          log.info("Sent an email to [{}] successfully, subject: [{}], sent date: [{}]",
                    Arrays.toString(mimeMessage.getAllRecipients()),
                    mimeMessage.getSubject(),
                    mimeMessage.getSentDate());
        } catch (Exception e) {
            log.info(e.getMessage());
           // throw new EmailException("邮件发送失败，请检查 SMTP 服务配置是否正确", e);
        }
    }

    /**
     * Send mail template if executor service is enable.
     *
     * @param callback   callback message handler
     * @param tryToAsync if the send procedure should try to asynchronous
     */
    protected void sendMailTemplate(boolean tryToAsync, @Nullable Callback callback) {
        ExecutorService executorService = getExecutorService();
        if (tryToAsync && executorService != null) {
            // send mail asynchronously
            executorService.execute(() -> sendMailTemplate(callback));
        } else {
            // send mail synchronously
            sendMailTemplate(callback);
        }
    }

    /**
     * Get java mail sender.
     *
     * @return java mail sender
     */
    @NonNull
    private synchronized JavaMailSender getMailSender() {
        if (this.cachedMailSender == null) {
            // create mail sender factory
            MailSenderFactory mailSenderFactory = new MailSenderFactory();
            // get mail sender
            this.cachedMailSender = mailSenderFactory.getMailSender(getMailProperties());
        }

        return this.cachedMailSender;
    }

    /**
     * Get from-address.
     *
     * @param javaMailSender java mail sender.
     * @return from-name internet address
     * @throws UnsupportedEncodingException throws when you give a wrong character encoding
     */
    private synchronized InternetAddress getFromAddress(@NonNull JavaMailSender javaMailSender) throws UnsupportedEncodingException {
        Assert.notNull(javaMailSender, "Java mail sender must not be null");

        if (StringUtils.isBlank(this.cachedFromName)) {
            // set personal name
            this.cachedFromName = getMailMapConfig().get(EmailProperties.FROM_NAME.getValue()).getConfigValue();
        }

        if (javaMailSender instanceof JavaMailSenderImpl) {
            // get user name(email)
            JavaMailSenderImpl mailSender = (JavaMailSenderImpl) javaMailSender;
            String username = mailSender.getUsername();

            // build internet address
            return new InternetAddress(username, this.cachedFromName, mailSender.getDefaultEncoding());
        }

        throw new UnsupportedOperationException("Unsupported java mail sender: " + javaMailSender.getClass().getName());
    }

    /**
     * Get mail properties.
     *
     * @return mail properties
     */
    @NonNull
    protected synchronized DefaultMailProperties getMailProperties() {
        if (cachedMailProperties == null) {
            // create mail properties
            DefaultMailProperties mailProperties = new DefaultMailProperties();
            // set properties
            mailProperties.setHost(getMailMapConfig().get(EmailProperties.HOST.getValue()).getConfigValue());
            mailProperties.setPort(Integer.parseInt(getMailMapConfig().get(EmailProperties.SSL_PORT.getValue()).getConfigValue()));
            mailProperties.setProtocol(getMailMapConfig().get(EmailProperties.PROTOCOL.getValue()).getConfigValue());
            mailProperties.setPassword(getMailMapConfig().get(EmailProperties.PASSWORD.getValue()).getConfigValue());
            mailProperties.setUsername(getMailMapConfig().get(EmailProperties.USERNAME.getValue()).getConfigValue());
            this.cachedMailProperties = mailProperties;
        }

        return this.cachedMailProperties;
    }

    /**
     * Print mail configuration.
     */
    private void printMailConfig() {
        if (!log.isDebugEnabled()) {
            return;
        }

        // get mail properties
        MailProperties mailProperties = getMailProperties();
       log.debug(mailProperties.toString());
    }

    /**
     * Clear cached instance.
     */
    protected void clearCache() {
        this.cachedMailSender = null;
        this.cachedFromName = null;
        this.cachedMailProperties = null;
        log.debug("Cleared all mail caches");
    }

    /**
     * Message callback.
     */
    protected interface Callback {
        /**
         * Handle message set.
         *
         * @param messageHelper mime message helper
         * @throws Exception if something goes wrong
         */
        void handle(@NonNull MimeMessageHelper messageHelper) throws Exception;
    }

    private  Map<String, SysConfig> getMailMapConfig(){
        if (this.sysConfigMap==null) {
            this.sysConfigMap = sysConfigService.selectConfigMap("email_");
        }
        return sysConfigMap;
    }
}