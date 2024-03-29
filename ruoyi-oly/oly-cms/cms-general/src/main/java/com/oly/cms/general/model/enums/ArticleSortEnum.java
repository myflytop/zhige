package com.oly.cms.general.model.enums;

import com.oly.cms.common.model.enums.OrderEnums;

/**
 * 排序字段
 */
public enum ArticleSortEnum {
    TIME("create_time "), TOP("article_top ");

    private String value;

    ArticleSortEnum(String value) {
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
