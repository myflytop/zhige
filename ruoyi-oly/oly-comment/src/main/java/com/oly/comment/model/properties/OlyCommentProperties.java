package com.oly.comment.model.properties;

import com.oly.common.model.properties.PropertyEnum;

/**
 * 评论默认配置参数
 */
public enum OlyCommentProperties implements PropertyEnum {
    // 前缀
    COMMENT_PREIFX("oly.comment.", String.class, ""),
    // 是否开启全局评论
    COMMENT_OPEN("oly.comment.open", Boolean.class, "true"),
    // 是否开启邮件回复
    COMMENT_MAIL_RESTORE("oly.comment.mailRestore", Boolean.class, "true"),
    // 评论默认状态
    COMMENT_DEFAULT_VISIBLE("oly.comment.defauleVisible", Byte.class, "0"),
    // 一级默认请求条数
    COMMENT_ONE_SIZE("oly.comment.oneSize", Integer.class, "20"),
    // 二级默认请求条数
    COMMENT_TWO_SIZE("oly.comment.twoSize", Integer.class, "20"),
    // 排序字段
    COMMENT_ORDER_BY("oly.comment.orderBy", String.class, "create_time"),
    // 排序方式
    COMMENT_ORDER("oly.comment.order", String.class, "desc");

    private final String value;

    private final Class<?> type;

    private final String defaultValue;

    OlyCommentProperties(String value, Class<?> type, String defaultValue) {
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

    public static OlyCommentProperties getEnum(String value) {

        return PropertyEnum.convertToEnum(value, OlyCommentProperties.class);
    }
}
