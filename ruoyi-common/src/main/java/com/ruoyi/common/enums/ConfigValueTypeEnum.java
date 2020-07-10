package com.ruoyi.common.enums;

public enum  ConfigValueTypeEnum {
    BOOLEAN("布尔类型"),
    NUMBER("数值型"),
    STRING("字符型");
    private final  String value;
    ConfigValueTypeEnum(String value){
        this.value=value;
    }
    public String getValue() {
        return value;
    }
}
