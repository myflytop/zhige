package com.ruoyi.common.utils;

import java.io.Serializable;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Ehcache;
import net.sf.ehcache.Element;

/**
 * Cache工具类
 * 
 * @author ruoyi
 */
public class CacheWebUtils {
    private static Logger logger = LoggerFactory.getLogger(CacheWebUtils.class);

    private static CacheManager cache = CacheManager.getCacheManager("olyWeb");

    /**
     * 存入
     *
     * @param <T>       the type parameter
     * @param cacheName the cache name
     * @param key       键
     * @param value     值
     */
    public static <T extends Serializable> void put(String cacheName, String key, T value) {
        Cache cache = checkCache(cacheName);
        Element e = new Element(key, value);
        cache.put(e);
        cache.flush();
    }

    /**
     * 存入 并设置元素是否永恒保存
     *
     * @param <T>       the type parameter
     * @param cacheName the cache name
     * @param key       键
     * @param value     值
     * @param eternal   对象是否永久有效，一但设置了，timeout将不起作用
     */
    public static <T extends Serializable> void put(String cacheName, String key, T value, boolean eternal) {
        Cache cache = checkCache(cacheName);
        Element element = new Element(key, value);
        element.setEternal(eternal);
        cache.put(element);
        cache.flush();
    }

    /**
     * 存入
     *
     * @param <T>               the type parameter
     * @param cacheName         the cache name
     * @param key               键
     * @param value             值
     * @param timeToLiveSeconds 最大存活时间
     * @param timeToIdleSeconds 最大访问间隔时间
     */
    public static <T extends Serializable> void put(String cacheName, String key, T value, int timeToLiveSeconds,
            int timeToIdleSeconds) {
        Cache cache = checkCache(cacheName);
        Element element = new Element(key, value);
        element.setTimeToLive(timeToLiveSeconds);
        element.setTimeToIdle(timeToIdleSeconds);
        cache.put(element);
        cache.flush();
    }

    /**
     * Get object.
     *
     * @param cacheName the cache name
     * @param key       the key
     * @return the object
     */
    public static Object get(String cacheName, String key) {
        Cache cache = checkCache(cacheName);
        Element e = cache.get(key);
        if (e != null) {

            return e.getObjectValue();
        }
        return null;
    }

    /**
     * Remove.
     *
     * @param cacheName the cache name
     * @param key       the key
     */
    public static void remove(String cacheName, String key) {
        Cache cache = checkCache(cacheName);
        cache.remove(key);
    }

    /**
     * Remove all.
     *
     * @param cacheName the cache name
     * @param keys      the keys
     */
    public static void removeAll(String cacheName) {
        List<String> keys = getKeys(cacheName);
        Cache cache = checkCache(cacheName);
        cache.removeAll(keys);
    }

    /**
     * Clears the contents of all caches in the CacheManager, but without removing
     * any caches.
     * <p/>
     * This method is not synchronized. It only guarantees to clear those elements
     * in a cache at the time that the {@link Ehcache#removeAll()} mehod on each
     * cache is called.
     */
    public static void clearAll() {
        cache.clearAll();
    }

    public static void clean() {
        String[] cacheNames = getCacheNames();
        for (String cacheName : cacheNames) {
            removeAll(cacheName);
        }
    }

    private static Cache checkCache(String cacheName) {
        Cache cache1 = cache.getCache(cacheName);
        if (null == cache) {
            throw new IllegalArgumentException("name=[" + cacheName + "],不存在对应的缓存组,请查看ehcache.xml");
        }
        return cache1;
    }

    /**
     * 获取所有缓存
     * 
     * @return 缓存组
     */
    public static String[] getCacheNames() {

        return cache.getCacheNames();
    }

   /**
    * 模糊删除
    * @param cacheName
    * @param vagueKey
    */
    public static void vagueDeleteKeys(String cacheName,String vagueKey) {
        List<String> keys = getKeys(cacheName);
        for (String key : keys) {
            if (key.startsWith(vagueKey)) {
                remove(cacheName, key);
            }
        }

    }

    public static List<String> getKeys(String cacheName) {

        return cache.getCache(cacheName).getKeys();
    }
}
