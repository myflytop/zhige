package com.oly.common.model.properties;

public enum OlyThemeProperties implements PropertyEnum {
    // 使用的主题默认为zgblog
    THEME_USED("oly.theme.used", String.class, "zgblog"),
    // 主题及文件说明
    THEME_INFO("oly.theme.info", String.class, "setting/theme.yaml"),
    // 主题配置
    THEME_SETTING("oly.theme.setting", String.class, "setting/setting.yaml"),
    // 默认主题是否安装
    THEME_DEFAULT_INSTALL("oly.theme.default.install", Boolean.class, "false"),
    // 是否允许多主题
    THEME_MORE_INSTALL("oly.theme.more", Boolean.class, "false"),
    // 默认安装包路径
    THEME_DEFAULT_PACKAGE("oly.theme.defaule.package", String.class, "/templates/themes/zip/zgblog.zip");

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
