package com.oly.common.model.properties;

public enum OlyThemeProperties implements PropertyEnum {
    // 使用的主题默认为bobey
    THEME_USED("oly.theme.used", String.class, "bobey"),
    // 主题及文件说明
    THEME_INFO("oly.theme.info", String.class, "theme.json"),
    // 默认主题是否安装
    THEME_DEFAULT_INSTALL("oly.theme.defaule.install", Boolean.class, "false"),
    // 默认安装包路径
    THEME_DEFAULT_PACKAGE("oly.theme.defaule.package", String.class, "/templates/themes/zip/bobey.zip");

    private final String value;

    private final Class<?> type;

    private final String defaultValue;

    OlyThemeProperties(String value, Class<?> type, String defaultValue) {
        this.defaultValue = defaultValue;
        if (!PropertyEnum.isSupportedType(type)) {
            throw new IllegalArgumentException("Unsupported blog property type: " + type);
        }

        this.value = value;
        this.type = type;
    }

    @Override
    public Class<?> getType() {
        return type;
    }

    @Override
    public String defaultValue() {
        return defaultValue;
    }

    @Override
    public String getValue() {
        return value;
    }

}
