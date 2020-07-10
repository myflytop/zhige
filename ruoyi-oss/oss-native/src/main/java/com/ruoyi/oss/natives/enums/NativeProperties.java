package com.ruoyi.oss.natives.enums;

public enum  NativeProperties {

    OSS_DOMAIN("oss_native_domain");

    private final String value;

    NativeProperties(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }

}
