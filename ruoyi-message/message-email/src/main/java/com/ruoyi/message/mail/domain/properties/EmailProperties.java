package com.ruoyi.message.mail.domain.properties;

import com.ruoyi.common.properties.PropertyEnum;

/**
 * Email properties.
 *
 * @author johnniang
 * @date 3/27/19
 */
public enum EmailProperties implements PropertyEnum {

    /**
     * Email sender host
     * 邮件服务器地址
     */
    HOST("email_host", String.class, ""),

    /**
     * Email sender protocol
     * 邮件协议
     *
     */
    PROTOCOL("email_protocol", String.class, "smtp"),

    /**
     * SSL port
     * 邮件端口
     */
    SSL_PORT("email_ssl_port", Integer.class, "465"),

    /**
     * Email Sender username
     * 邮件发送名字
     */
    USERNAME("email_username", String.class, ""),

    /**
     * Email Sender password
     * 邮件密码或者授权码
     */
    PASSWORD("email_password", String.class, ""),

    /**
     * Email Sender name
     * 邮件发送名字
     */
    FROM_NAME("email_from_name", String.class, ""),

    /**
     * Is enabled email sender
     * 是否开启邮件
     */
    ENABLED("email_enabled", Boolean.class, "false");

    private final String value;

    private final Class<?> type;

    private final String defaultValue;

    EmailProperties(String value, Class<?> type, String defaultValue) {
        this.defaultValue = defaultValue;
        if (!PropertyEnum.isSupportedType(type)) {
            throw new IllegalArgumentException("Unsupported blog property type: " + type);
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