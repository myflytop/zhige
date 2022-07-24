package com.oly.cms.common.model.properties;

import com.ruoyi.common.enums.SysConfigGroups;
import com.ruoyi.common.properties.PropertyEnum;

public enum OlyThemeConfigProperties implements PropertyEnum {

    // 配置组
    THEME_CONFIG_GROUP(SysConfigGroups.THEME_CONFIG.getValue(), String.class, SysConfigGroups.THEME_CONFIG.getValue()),
    // 获取主题描述前缀
    THEME_DATA_PREFIX("themeData", String.class, "themeData"),
    // 获取主题配置前缀
    THEME_CONFIG_PREFIX("themeConfig", String.class, "themeConfig"),
    // 使用的主题
    THEME_USED("oly.theme.used", String.class, ""),
    // 主题及文件说明
    THEME_INFO("oly.theme.info", String.class, "setting/theme.yaml"),
    // 主题配置
    THEME_SETTING("oly.theme.setting", String.class, "setting/setting.yaml"),
    // 是否支持多主题
    THEME_MORE_INSTALL("oly.theme.more", Boolean.class, "false");

    private final String value;

    private final Class<?> type;

    private final String defaultValue;

    OlyThemeConfigProperties(String value, Class<?> type, String defaultValue) {
        this.defaultValue = defaultValue;
        if (!PropertyEnum.isSupportedType(type)) {
            throw new IllegalArgumentException("Unsupported web property type: " + type);
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
