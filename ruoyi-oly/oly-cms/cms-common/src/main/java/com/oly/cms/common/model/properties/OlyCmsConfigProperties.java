package com.oly.cms.common.model.properties;

import com.ruoyi.common.enums.SysConfigGroups;
import com.ruoyi.common.properties.PropertyEnum;

public enum OlyCmsConfigProperties implements PropertyEnum {

    CMS_CONFIG_GROUP(SysConfigGroups.CMS_CONFIG.getValue(), String.class, SysConfigGroups.CMS_CONFIG.getValue()),
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
    ARTICLE_FIXED_URLTHEME_EDIT("oly.cms.articleUrl.fixedPrefix", String.class, "/post"),

    // 主题编辑
    THEME_EDIT("oly.cms.theme.edit", Boolean.class, "true"),

    // 主题上传
    THEME_UPLOAD("oly.cms.theme.upload", Boolean.class, "true"),

    // 主题上传文件
    THEME_FILE_UPLOAD("oly.cms.theme.file.upload", Boolean.class, "true"),

    // 主题备份
    THEME_BACK("oly.cms.theme.back", Boolean.class, "true"),

    // 主题备份
    THEME("oly.cms.theme.back", Boolean.class, "true"),

    // 是否开启用户
    USER_OPEN("oly.cms.userOpen", Boolean.class, "true"),
    // 用户默认部门
    USER_DEPT("oly.cms.userDept", Long.class, "0"),
    // 联盟默认状态
    UNION_VISIBLE_DEFAULT("oly.cms.union.defaultVisible", Integer.class, "0"),
    // 联盟关联分类标签类型
    UNION_TYPE("oly.cms.union.type", Integer.class, "0"),
    // 联盟关联分类ID
    UNION_CAT_ID("oly.cms.union.catId", Integer.class, "0"),
    // 联盟关联分类数量
    UNION_CAT_SIZE("oly.cms.union.catSize", Integer.class, "1"),
    // 联盟关联标签数量
    UNION_TAG_SIZE("oly.cms.union.tagSize", Integer.class, "2");

    private final String value;

    private final Class<?> type;

    private final String defaultValue;

    OlyCmsConfigProperties(String value, Class<?> type, String defaultValue) {
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
