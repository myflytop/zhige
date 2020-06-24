package com.ruoyi.blog.mould.enums;

/**
 * 排序字段
 */
public enum ArticleSortEnum {
    LOOK("article_look"),
    LIKE("article_like"),
    COLLECT("article_collect"),
    NASTY("article_nasty"),
    SHARE("article_share"),
    SCORE("article_score"),
    TIME("create_time"),
    TOP("article_top");
    private String value;
    ArticleSortEnum(String value) {
        this.value=value;
    }
    public String getValue() {
        return value;
    }
    public void setValue(String value) {
        this.value = value;
    }
}
