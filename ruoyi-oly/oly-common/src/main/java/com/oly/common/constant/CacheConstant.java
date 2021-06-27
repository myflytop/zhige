package com.oly.common.constant;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

/**
 * 前端配置缓存
 */
public class CacheConstant {

    public final static String CACHE_NAME="oly-web";

    /* 菜单缓存 */
    public final static String MENU_CACHE_KEY_PREFIX = "menuCache_",
            /* 文章缓存 */
            POST_CACHE_KEY_PREFIX = "postCache_",
            /* 文章列表缓存 */
            POSTS_CACHE_KEY_PREFIX = "postsCache_",
            /**
             * 链接缓存
             */
            LINKS_CACHE_KEY_PREFIX = "linksCache_",
            /**
             * 配置缓存
             */
            CONFIG_CACHE_KEY_PREFIX = "configCache_",
            /* 标签缓存 */
            TAGS_CACHE_KEY_PREFIX = "tagsCache_",
            /**
             * 分类缓存
             */
            CATS_CACHE_KEY_PREFIX = "catsCache_",

            /**
             * 页面缓存
             */
            PAGE_CACHE_KEY_PREFIX = "pageCache_";

    private CacheConstant() {
    }

    public static List<String> getCacheNames() throws IllegalAccessException {
        Class clazz = CacheConstant.class;
        List<String> cacheNames = new ArrayList<>();
        Field[] fields = clazz.getFields();
        for (Field field : fields) {
            cacheNames.add(field.get("java.lang.String").toString());
        }
        return cacheNames;
    }
}
