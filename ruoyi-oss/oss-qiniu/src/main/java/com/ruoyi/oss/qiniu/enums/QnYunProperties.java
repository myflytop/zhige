package com.ruoyi.oss.qiniu.enums;
public enum QnYunProperties {
    OSS_ZONE("oss_qiniu_zone"),

    OSS_ACCESS_KEY("oss_qiniu_access_key"),

    OSS_SECRET_KEY("oss_qiniu_secret_key"),

    OSS_DOMAIN("oss_qiniu_domain"),

    OSS_BUCKET("oss_qiniu_bucket"),

    OSS_STYLE_RULE("oss_qiniu_style_rule");

    private final String value;

    QnYunProperties(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }

}
