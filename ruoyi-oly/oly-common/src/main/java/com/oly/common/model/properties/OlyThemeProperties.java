package com.oly.common.model.properties;

public enum OlyThemeProperties implements PropertyEnum {
    // 使用的主题默认为zgblog
    THEME_USED("oly.theme.used", String.class, "zgblog"),
    // 主题及文件说明
    THEME_INFO("oly.theme.info", String.class, "setting/theme.yaml"),
    // 主题配置
    THEME_SETTING("oly.theme.setting", String.class, "setting/setting.yaml"),
    // 是否支持多主题
    THEME_MORE_INSTALL("oly.theme.more", Boolean.class, "false");

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
