package com.ruoyi.cms.common.constant;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

public class CacheConstant {
 public final static  String  MENU_CACHE_NAME="menuCache",
    POST_CACHE_NAME="postCache",
    POSTS_CACHE_NAME="postsCache",
    LINKS_CACHE_NAME="linksCache",
    TAKE_CACHE_NAME="taoKeCache",
    CONFIG_CACHE_NAME="configCache",
    TAGS_CACHE_NAME = "tagCache",
    CATS_CACHE_NAME="catsCache";



    private  CacheConstant(){}
    public static List<String> getCacheNames() throws IllegalAccessException {
     Class clazz=CacheConstant.class;
        List<String> cacheNames=new ArrayList<>();
        Field[] fields=clazz.getFields();
        for ( Field field:fields) {
            cacheNames.add(field.get("java.lang.String").toString());
        }
        return cacheNames;
    }
}
