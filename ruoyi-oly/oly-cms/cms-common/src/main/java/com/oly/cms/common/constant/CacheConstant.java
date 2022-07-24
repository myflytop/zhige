package com.oly.cms.common.constant;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

/**
 * 前端配置缓存
 */
public class CacheConstant {

    public final static String CACHE_NAME = "oly-web";

    /* 菜单缓存 */
    public final static String MENU_CACHE_KEY_PREFIX = "menu-cache",
            /* 文章缓存 */
            POST_CACHE_KEY_PREFIX = "post-cache",
            /**
             * 链接缓存
             */
            LINKS_CACHE_KEY_PREFIX = "links-cache",

            /* 标签缓存 */
            TAGS_CACHE_KEY_PREFIX = "tags-cache",
            /**
             * 分类缓存
             */
            CATS_CACHE_KEY_PREFIX = "cats-cache",
            /**
             * 商品缓存
             */
            SHOP_CACHE_KEY_PREFIX = "shop-cache",
            /**
             * 页面缓存
             */
            PAGE_CACHE_KEY_PREFIX = "page-cache",
            /**
             * 评论缓存
             */
            COMMENT_CACHE_KEY_PREFIX = "comment-cache",
            /**
             * 联盟缓存
             */
            UNION_CACHE_KEY_PREFIX = "union-cache";

    private CacheConstant() {
    }

    /**
     * 获取缓存列表
     * 
     * @return
     * @throws IllegalAccessException
     */
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
