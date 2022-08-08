package com.oly.cms.general.model.enums;

import com.oly.cms.common.model.enums.OrderEnums;

/**
 * 排序字段
 */
public enum ArticleCountSortEnum {
    LOOK("article_look "), LIKE("article_like "), COLLECT("article_collect "), NASTY("article_nasty "),
    SHARE("article_share "), SCORE("article_score "), TIME("create_time "), TOP("article_top ");

    private String value;

    ArticleCountSortEnum(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getOrder(OrderEnums orderEnums) {
        return value + orderEnums.name().toLowerCase();
    }
}
