package com.oly.common.model.properties;

/**
 * 评论默认配置参数
 */
public enum OlyCommentProperties implements PropertyEnum {
    // 前缀
    COMMENT_PREIFX("cms.comment", String.class, ""),
    // 评论开关
    COMMENT_OPEN("cms.comment.open", Boolean.class, "true"),
    // 一级默认请求条数
    COMMENT_ONE_SIZE("cms.comment.oneSize", Integer.class, "20"),
    // 二级默认请求条数
    COMMENT_TWO_SIZE("cms.comment.twoSize", Integer.class, "20"),
    // 排序字段
    COMMENT_ORDER_BY("cms.comment.orderBy", String.class, "create_time"),
    // 排序方式
    COMMENT_ORDER("cms.comment.order", String.class, "asc");

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

}
