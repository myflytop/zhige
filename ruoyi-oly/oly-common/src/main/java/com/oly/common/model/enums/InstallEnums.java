package com.oly.common.model.enums;

/**
 * 安装相关基本阐述
 */
public enum InstallEnums {
    /* 默认主题 */
    DEFAULT_THEME("bobey"),

    /* 主题配置文件 */
    THEME_CONFIG("theme.json"),

    /* 主题设置前缀 */
    THEME_CONFIG_PREFIX("theme.");

    private String value;

    InstallEnums(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }
}
