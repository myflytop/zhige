package com.ruoyi.system.config.enums;

public enum ConfigValueTypeEnum {
    NUMBER("数值"), FLOAT("浮点"), BOOLEAN("布尔"), STRING("字符"), JSON("JSON"), HTML("HTML");

    private final String value;

    ConfigValueTypeEnum(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }
}