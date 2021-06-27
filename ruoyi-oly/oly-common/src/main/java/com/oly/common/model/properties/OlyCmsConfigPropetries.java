package com.oly.common.model.properties;

public enum OlyCmsConfigPropetries implements PropertyEnum {

    // 最多允许关联标签数目
    ARTICLE_TAG_MAXNUM("oly.cms.articleTag.maxNum", Integer.class, "3"),
    // 最多允许关联分类数目
    ARTICLE_CAT_MAXNUM("oly.cms.articleCat.maxNum", Integer.class, "3"),
    // 最多允许关键词
    ARTICLE_KEYWORD_MAXNUM("oly.cms.articleKey.maxNum", Integer.class, "10"),
    // 最多预览图
    ARTICLE_IMG_MAXNUM("oly.cms.articleImg.maxNum", Integer.class, "3"),
    // 发布文章时默认状态 对应审核
    ARTICLE_VISIBLE_DEFAULT("oly.cms.articleVisible.default", Integer.class, "2"),
    // 固定链接前缀
    ARTICLE_FIXED_URL("oly.cms.articleUrl.fixedPrefix", String.class, "/post"),

    // 是否支持多主题
    THEME_OPEN_MORE("oly.cms.theme.more", Boolean.class, "true"),

    // 是否开启用户
    USER_OPEN("oly.cms.userOpen", Boolean.class, "true"),
    // 用户默认部门
    USER_DEPT("oly.cms.userDept", Long.class, "0"),

    // 商品状态
    TAO_FITTLE_DEFAULT("oly.cms.tao.defaultFettle", Integer.class, "0"),
    // 淘客文章
    TAO_POST_TYPE("oly.cms.tao.postType", Byte.class, "0");

    private final String value;

    private final Class<?> type;

    private final String defaultValue;

    OlyCmsConfigPropetries(String value, Class<?> type, String defaultValue) {
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
