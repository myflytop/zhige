package com.oly.cms.comment.model.enums;

public enum CommentVisibleEnums {
    /* 审核中 */
    CHECK,
    /* 禁用|审核不通过 */
    CLOSE,
    /* 审核通过 */
    PASS,
    // 逻辑删除
    DELETE;
}
