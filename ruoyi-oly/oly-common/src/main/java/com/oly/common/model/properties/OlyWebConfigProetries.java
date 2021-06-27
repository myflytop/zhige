package com.oly.common.model.properties;



/**
 * 前端相关配置参数
 */
public enum OlyWebConfigProetries implements PropertyEnum {
    
    
    // 网站标题
    TITLE("oly.web.title", String.class, "3"),
    // 主页
    INDEX("oly.web.index", String.class, "3"),
    // LOGO
    LOGO("oly.web.logo", String.class, "3"),
    // ICO
    ICO("oly.web.ico", String.class,"2"),
    // 页脚
    FOOTER("oly.web.footer", Boolean.class, "true"),


    // 作者
    AUTHOR("oly.web.author", Boolean.class, "true"),
    // 版权
    COPYRIGHT("oly.web.copyright", String.class, "3"),
    // 主页
    kEYWORDS("oly.web.keywords", String.class, "3"),
    // LOGO
    DESCRIPTION("oly.web.description", String.class, "3"),


    
     // 关于站点
    ABOUT_WEBSITE("oly.web.website", Boolean.class, "true"),


    // 默认排序
    ARTICLE_OEDRE_BY("oly.web.articleOrder", String.class,"2"),
    // 默认排序
    ARTICLE_ORDER("oly.web.articleOrderBy", String.class,"2"),
    // 默认请求条数
    ARTICLE_SIZE("oly.web.articleSize", Boolean.class, "20"),
    //文章支持分类标签类型
    ARTICLE_TYPES("oly.web.article.supportType",String.class,""),

    // 关于站点
    ABOUT_AUTHOR("oly.web.aboutAuthor", Boolean.class, "true"),
    // 关于作者主页
    ABOUT_AUTHOR_INDEX("oly.web.aboutAuthorIndex", Boolean.class, "true"),
    // 联系作者
    ABOUT_AUTHOR_CALL("oly.web.aboutAuthorCall", Boolean.class, "true"),

    PAGE_INDEX("oly.web.pageIndex", Long.class, "0"),

    PAGE_CATEGORY("oly.web.pageCategory", Long.class, "0"),

    PAGE_TAG("oly.web.pageTag", Long.class, "0"),

    PAGE_CALL("oly.web.pageCallMe", Long.class, "0"),

    PAGE_ABOUT("oly.web.pageAbout", Long.class, "0"),

    PAGE_RANK("oly.web.pageRank", Long.class, "0"),

    PAGE_TIMELINE("oly.web.pageTimeLine", Long.class, "0"),

    PAGE_LINKS("oly.web.pageLinks", Long.class, "0"),

    PAGE_INTROUDUE("oly.web.pageIntrouduce", Long.class, "0"),

    //淘客主页
    PAGE_TAO_INDEX("oly.tao.pageIndex", Long.class, "0"),
    //淘客搜索页面
    PAGE_TAO_SHOP("oly.tao.shop", Long.class, "0"),
    //关于淘客页面
    PAGE_TAO_ABOUT("oly.tao.pageAbout", Long.class, "0"),
    //淘客福利
    PAGE_TAO_WEAL("oly.tao.pageWeal", Long.class, "0"),
    //淘客教程
    PAGE_TAO_SCORE("oly.tao.pageScore", Long.class, "0"),
    //淘客排行页
    PAGE_TAO_RANK("oly.tao.pageRank", Long.class, "0"),


      APP_IOS_EXAMAIN("oly.app.iosExamine", Boolean.class, "true"),

      APP_NAME("oly.app.appName", String.class, ""),

      APP_LOGO("oly.app.logo", String.class, ""),

    // 支付宝
    PAY_ZHI("oly.web.payZhi", Boolean.class, "true"),
    // 微信支付
    PAY_WEI("oly.web.payWei", Boolean.class, "true");



    private final String value;

    private final Class<?> type;

    private final String defaultValue;

    OlyWebConfigProetries(String value, Class<?> type, String defaultValue) {
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
