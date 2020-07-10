package com.ruoyi.cms.common.enums;

/**
 * 主题相关静态变量
 */
public enum ThemeEnums {
   /* 使用主题*/
    THEME_USED("blog_theme_used"),
    /*主题列表*/
    THEME_LIST("blog_theme_list"),
    /*主题根目录*/
    THEME_ROOT("themes/"),
    /*默认主题*/
    DEFAULT_THEME("bobey");
    private String value;
    ThemeEnums(String value){
        this.value=value;
    }

    public String getValue() {
        return value;
    }
}
