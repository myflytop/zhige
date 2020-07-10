package com.ruoyi.blog.mould.enums;

public enum CountColumnEnum {
    LOOK("article_look"),
    LIKE("article_like"),
    COLLECT("article_collect"),
    NASTY("article_nasty"),
    SHARE("article_share"),
    SCORE("article_score");
    public String getValue() {
        return value;
    }

    private String value;
    CountColumnEnum(String value)
    {
        this.value=value;
    }
}
