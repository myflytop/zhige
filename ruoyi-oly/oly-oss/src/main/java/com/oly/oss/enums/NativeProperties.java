package com.oly.oss.enums;

//本地储存配置
public enum NativeProperties {

    // 储存域名
    OSS_DOMAIN("oly.oss.native.domain");

    private final String value;

    NativeProperties(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }

}
