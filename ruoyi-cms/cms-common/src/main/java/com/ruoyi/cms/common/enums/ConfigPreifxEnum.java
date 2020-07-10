package com.ruoyi.cms.common.enums;

public enum  ConfigPreifxEnum {
    //博客参数配置前缀
    BLOG_CONFIG("blog.config"),
    //淘客参数配置前缀
    TAOKE_CONFIG("taoke.config");
    public String getValue() {
        return value;
    }
    private String value;
   ConfigPreifxEnum(String value){
       this.value=value;
   }


}
