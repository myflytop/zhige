package com.ruoyi.cms.common.mould.enums;

public enum CmsConfigPrefixEnum {
    BLOG_PREFIX("blog.config."),
    CMS_PREFIX("cms."),
    TAOKE_PREFIX("taoke.config");

    private String value;

    CmsConfigPrefixEnum(String value){
        this.value=value;

    }

    public String getValue() {
        return value;
    }
}
