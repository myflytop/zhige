package com.oly.common.model.properties;

public enum OlyCmsConfigPropetries implements PropertyEnum {
    
    
    // 最多允许关联标签数目
    ARTICLE_TAG_MAXNUM("oly.cms.articleTag.maxNum", Integer.class, "3"),
    // 最多允许关联分类数目
    ARTICLE_CAT_MAXNUM("oly.cms.articleCat.maxNum", Integer.class, "3"),
    // 最多允许关键词
    ARTICLE_KEYWORD_MAXNUM("oly.cms.articleKey.maxNum", Integer.class, "3"),
    // 发布文章时默认状态 对应审核
    ARTICLE_VISIBLE_DEFAULT("oly.cms.articleVisible.default", Integer.class,"2"),
    // 是否开启全局评论
    ARTICLE_COMMENT_OPEN("oly.cms.articleComment.open", Boolean.class, "true"),
    // 是否开启邮件回复
    ARTICLE_MAIL_RESTORE("oly.cms.articleMail.restore", Boolean.class, "true"), 


    //是否开启用户
    USER_OPEN("oly.cms.userOpen", Boolean.class, "true"),
    //用户默认部门
    USER_DEPT("oly.cms.userDept", Long.class, "0"),
    //是否支持主题切换
    THEME_CHANGE("oly.theme.change",Boolean.class,"true"),
    
    //商品状态
    TAO_FITTLE_DEFAULT("oly.tao.defaultFettle",Integer.class,"0"),
     
    //淘客福利文章
    TAO_POST_WEAL_TYPE("oly.tao.postWealType",Byte.class,"1"),

    //淘客文章
    TAO_POST_TYPE("oly.tao.postType",Byte.class,"0");

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
