package com.oly.oss.enums;
public enum QnYunProperties {
    OSS_ZONE("oly.oss.qiniu.zone"),

    OSS_ACCESS_KEY("oly.oss.qiniu.access.key"),

    OSS_SECRET_KEY("oly.oss.qiniu.secret.key"),

    OSS_DOMAIN("oly.oss.qiniu.domain"),

    OSS_BUCKET("oly.oss.qiniu.bucket"),

    OSS_STYLE_RULE("oly.oss.qiniu.style.rule");

    private final String value;

    QnYunProperties(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }

}
