package com.oly.cms.common.model.enums;

public enum UnionSortEnums {
    CREATE_TIME("create_time "),
    SHOP_PRICE("shop_price ");

    private String value;

    UnionSortEnums(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }

    public String getOrder(OrderEnums orderEnums) {
        return value + orderEnums.name().toLowerCase();
    }
}
