package com.oly.cms.common.model.enums;

public enum UnionSortEnums {
    DEFAULT("create_time "),
    SHOP_PRICE("shop_price "),
    SHOP_SALES("shop_sales "),
    COUPON_PRICE("coupon_price ");

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
