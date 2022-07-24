package com.ruoyi.oss.properties;

import com.ruoyi.common.properties.PropertyEnum;

public enum QnYunProperties implements PropertyEnum {
    OSS_ZONE("oly.oss.qiniu.zone", String.class, ""),

    OSS_ACCESS_KEY("oly.oss.qiniu.access.key", String.class, ""),

    OSS_SECRET_KEY("oly.oss.qiniu.secret.key", String.class, ""),

    OSS_DOMAIN("oly.oss.qiniu.domain", String.class, ""),

    OSS_BUCKET("oly.oss.qiniu.bucket", String.class, ""),

    OSS_STYLE_RULE("oly.oss.qiniu.style.rule", String.class, "");

    private final String value;

    private final Class<?> type;

    private final String defaultValue;

    QnYunProperties(String value, Class<?> type, String defaultValue) {
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
