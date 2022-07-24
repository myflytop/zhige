package com.oly.cms.comment.model.enums;

/* 评论统计字段 */
public enum CommentCountFieldEnum {
    LIKE_COUNT("like_count"), NASTY_COUNT("nasty_count");

    public String getValue() {
        return value;
    }

    private String value;

    CommentCountFieldEnum(String value) {
        this.value = value;
    }

}
