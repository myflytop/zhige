package com.ruoyi.common.enums;

public enum ConfigValueTypeEnum {
    NUMBER("数值型"), BOOLEAN("布尔类型"), STRING("字符型");

    private final String value;

    ConfigValueTypeEnum(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }
}
