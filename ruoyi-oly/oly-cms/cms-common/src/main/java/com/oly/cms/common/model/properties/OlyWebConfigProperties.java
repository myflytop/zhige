package com.oly.cms.common.model.properties;

import com.ruoyi.common.properties.PropertyEnum;

/**
 * 前端通用相关配置
 */
public enum OlyWebConfigProperties implements PropertyEnum {

    // 默认类型
    DEFAULT_TYPE("oly.web.default.type", String.class, ""),
    // 网站域名
    DOMAIN("oly.web.domain", String.class, "127.0.0.1"),
    // 网站标题
    TITLE("oly.web.title", String.class, "止戈"),
    // 主页
    INDEX("oly.web.index", String.class, "/index"),
    // LOGO
    LOGO("oly.web.logo", String.class, ""),
    // ICO
    ICO("oly.web.ico", String.class, ""),
    // 页脚
    FOOTER("oly.web.footer", String.class, ""),

    // 评论开关
    COMMENT_ENABLE("oly.web.comment.enable", Boolean.class, "false"),

    // 作者
    AUTHOR("oly.web.author", String.class, "ZG"),
    // 版权
    COPYRIGHT("oly.web.copyright", String.class, "3"),
    // 主页
    kEYWORDS("oly.web.keywords", String.class, "3"),
    // LOGO
    DESCRIPTION("oly.web.description", String.class, "3"),

    // 默认排序
    ARTICLE_ORDER_BY("oly.web.articleOrder", String.class, "2"),
    // 默认排序
    ARTICLE_ORDER("oly.web.articleOrderBy", String.class, "2"),
    // 默认请求条数
    ARTICLE_SIZE("oly.web.articleSize", Boolean.class, "20"),

    // 文章支持分类标签类型
    ARTICLE_TYPES("oly.web.article.supportType", String.class, ""),

    // 关于站点
    ABOUT_AUTHOR("oly.web.aboutAuthor", String.class, "true"),
    // 关于作者主页
    ABOUT_AUTHOR_INDEX("oly.web.aboutAuthorIndex", String.class, "true"),
    // 联系作者
    ABOUT_AUTHOR_CALL("oly.web.aboutAuthorCall", String.class, "true"),

    PAGE_INDEX("oly.web.pageIndex", Long.class, "0"),

    PAGE_CATEGORY("oly.web.pageCategory", Long.class, "0"),

    PAGE_TAG("oly.web.pageTag", Long.class, "0"),

    PAGE_ABOUT("oly.web.pageAbout", Long.class, "0"),

    PAGE_RANK("oly.web.pageRank", Long.class, "0"),

    PAGE_TIMELINE("oly.web.pageTimeLine", Long.class, "0"),

    PAGE_POSTS("oly.web.pagePosts", Long.class, "0"),

    PAGE_LINKS("oly.web.pageLinks", Long.class, "0"),

    PAGE_INTRODUCE("oly.web.pageIntroduce", Long.class, "0"),

    // 淘客搜索页面
    PAGE_TAO_SHOP("oly.web.tao.shop", Long.class, "0"),

    APP_IOS_EXAMINE("oly.web.app.iosExamine", Boolean.class, "true"),

    APP_NAME("oly.web.app.appName", String.class, ""),

    APP_LOGO("oly.web.app.logo", String.class, ""),

    THEME_CONFIG_PREFIX("oly.web.theme.", String.class, "oly.web.theme.");

    private final String value;

    private final Class<?> type;

    private final String defaultValue;

    OlyWebConfigProperties(String value, Class<?> type, String defaultValue) {
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
