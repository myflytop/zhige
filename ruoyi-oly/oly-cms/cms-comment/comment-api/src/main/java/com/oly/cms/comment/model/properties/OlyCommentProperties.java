package com.oly.cms.comment.model.properties;

import com.oly.cms.comment.model.enums.CommentVisibleEnums;
import com.ruoyi.common.enums.SysConfigGroups;
import com.ruoyi.common.properties.PropertyEnum;

/**
 * 评论默认配置参数
 */
public enum OlyCommentProperties implements PropertyEnum {

    COMMENT_CONFIG_GROUP(SysConfigGroups.COMMENT_CONFIG.getValue(), String.class,
            SysConfigGroups.COMMENT_CONFIG.getValue()),
    // 前缀
    COMMENT_PREIFX("oly.comment.", String.class, "oly.comment."),
    // 是否开启文章评论
    COMMENT_OPEN_ARTICLE("oly.comment.open.article", Boolean.class, "true"),
    // 是否开启战斗评论
    COMMENT_OPEN_SITE("oly.comment.open.site", Boolean.class, "true"),
    // 是否开启链接评论
    COMMENT_OPEN_LINKS("oly.comment.open.links", Boolean.class, "true"),
    // 是否开启邮件回复
    COMMENT_MAIL_RESTORE("oly.comment.mailRestore", Boolean.class, "true"),
    // 评论默认状态
    COMMENT_DEFAULT_VISIBLE("oly.comment.defauleVisible", String.class, CommentVisibleEnums.CHECK.name());

    private final String value;

    private final Class<?> type;

    private final String defaultValue;

    OlyCommentProperties(String value, Class<?> type, String defaultValue) {
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

    public static OlyCommentProperties getEnum(String value) {

        return PropertyEnum.convertToEnum(value, OlyCommentProperties.class);
    }
}
