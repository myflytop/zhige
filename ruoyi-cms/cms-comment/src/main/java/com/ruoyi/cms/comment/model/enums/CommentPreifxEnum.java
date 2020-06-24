package com.ruoyi.cms.comment.model.enums;

public enum CommentPreifxEnum {

    //前缀
    COMMENT_PREIFX("cms.comment"),
    //一级默认请求条数
    COMMENT_ONE_SIZE("cms.comment.one.size"),
    //二级默认请求条数
    COMMENT_TWO_SIZE("cms.comment.two.size"),
    //二级默认请求条数
    COMMENT_ORDER_BY("cms.comment.order.by"),
    //二级默认请求条数
    COMMENT_BY_ASC("cms.comment.order.asc"),
    ;

    public String getValue() {
        return value;
    }
    private String value;
   CommentPreifxEnum(String value){
       this.value=value;
   }


}
