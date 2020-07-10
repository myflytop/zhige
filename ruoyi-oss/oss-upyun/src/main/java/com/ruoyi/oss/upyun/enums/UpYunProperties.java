package com.ruoyi.oss.upyun.enums;

public enum UpYunProperties  {

    OSS_SOURCE("oss_upyun_source"),
    OSS_PASSWORD("oss_upyun_password"),
    OSS_BUCKET("oss_upyun_bucket"),
    OSS_DOMAIN("oss_upyun_domain"),
    OSS_OPERATOR("oss_upyun_operator"),
    OSS_STYLE_RULE("oss_upyun_style_rule"),
    OSS_THUMBNAIL_STYLE_RULE("oss_upyun_thumbnail_style_rule");


    public String getValue() {
        return value;
    }

    private String value;

    UpYunProperties(String value) {
        this.value = value;
    }
}
