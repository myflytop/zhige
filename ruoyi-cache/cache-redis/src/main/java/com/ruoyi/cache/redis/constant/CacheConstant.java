package com.ruoyi.cache.redis.constant;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

public class CacheConstant {
    /*菜单缓存*/
 public final static  String  MENU_CACHE_NAME="menuCache",
    /*文章缓存*/
    POST_CACHE_NAME="postCache",
    /*文章列表缓存*/
    POSTS_CACHE_NAME="postsCache",
    /**
     * 链接缓存
     */
    LINKS_CACHE_NAME="linksCache",
    /*淘客缓存*/
    TAKE_CACHE_NAME="taoKeCache",
    /**
     * 配置缓存
     */
    CONFIG_CACHE_NAME="configCache",
   /* 标签缓存*/
    TAGS_CACHE_NAME = "tagsCache",
    /**
     * 分类缓存
     */
    CATS_CACHE_NAME="catsCache",
    /**
     * 页面缓存
     */
    PAGE_CACHE_NAME="pageCache";



    private CacheConstant(){}
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
