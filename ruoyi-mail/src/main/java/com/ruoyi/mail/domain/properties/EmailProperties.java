package com.ruoyi.mail.domain.properties;

import com.ruoyi.common.enums.SysConfigGroups;
import com.ruoyi.common.properties.PropertyEnum;

/**
 * Email properties.
 *
 * @author johnniang
 * @date 3/27/19
 */
public enum EmailProperties implements PropertyEnum {

    GROUP_NAME(SysConfigGroups.MAIL_CONFIG.getValue(), String.class, SysConfigGroups.MAIL_CONFIG.getValue()),

    PREFIX("oly.mail.", String.class, "oly.mail."),
    /**
     * Email sender host 邮件服务器地址
     */
    HOST("oly.mail.host", String.class, ""),

    /**
     * Email sender protocol 邮件协议
     *
     */
    PROTOCOL("oly.mail.protocol", String.class, "smtp"),

    /**
     * Is starttls enabled starttls支持
     */
    STARTTLS("oly.mail.starttls", Boolean.class, "false"),

    /**
     * SSL port 邮件端口
     */
    SSL_PORT("oly.mail.ssl.port", Integer.class, "465"),

    /**
     * Email Sender username 邮件发送名字
     */
    USERNAME("oly.mail.username", String.class, ""),

    /**
     * Email Sender password 邮件密码或者授权码
     */
    PASSWORD("oly.mail.password", String.class, ""),

    /**
     * Email Sender name 邮件发送名字
     */
    FROM_NAME("oly.mail.from.name", String.class, ""),

    /**
     * Is enabled email sender 是否开启邮件
     */
    ENABLED("oly.mail.enabled", Boolean.class, "false");

    private final String value;

    private final Class<?> type;

    private final String defaultValue;

    EmailProperties(String value, Class<?> type, String defaultValue) {
        this.defaultValue = defaultValue;
        if (!PropertyEnum.isSupportedType(type)) {
            throw new IllegalArgumentException("Unsupported web property type: " + type);
        }

        this.value = value;
        this.type = type;
    }

    @Override
    public Class<?> getType() {
        return type;
    }

    @Override
    public String defaultValue() {
        return defaultValue;
    }

    @Override
    public String getValue() {
        return value;
    }
}