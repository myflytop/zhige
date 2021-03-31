package com.oly.common.constant;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

public class CacheConstant {
    /* 菜单缓存 */
    public final static String MENU_CACHE_PREFIX = "menuCache::",
            /* 文章缓存 */
            POST_CACHE_PREFIX = "postCache",
            /* 文章列表缓存 */
            POSTS_CACHE_PREFIX = "postsCache",
            /**
             * 链接缓存
             */
            LINKS_CACHE_PREFIX = "linksCache",
            /* 淘客缓存 */
            TAKE_CACHE_PREFIX = "taoKeCache",
            /**
             * 配置缓存
             */
            CONFIG_CACHE_PREFIX = "configCache",
            /* 标签缓存 */
            TAGS_CACHE_PREFIX = "tagsCache",
            /**
             * 分类缓存
             */
            CATS_CACHE_PREFIX = "catsCache",
            /**
             * 页面缓存
             */
            PAGE_CACHE_PREFIX = "pageCache";

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
