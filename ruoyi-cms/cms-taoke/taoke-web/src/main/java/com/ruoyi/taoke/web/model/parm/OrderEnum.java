package com.ruoyi.taoke.web.model.parm;

public enum OrderEnum {
    ORDER_BY_SHOP_PRICE_DESC("shop_price desc"),
    ORDER_BY_SHOP_PRICE_ASC("shop_price asc"),
    ORDER_BY_COUPON_PRICE_DESC("coupon_price desc"),
    ORDER_BY_COUPON_PRICE_ASC("coupon_price asc");

    private String value;

    OrderEnum(String value){
        this.value=value;
    }

    public String getValue() {
        return value;
    }
}
