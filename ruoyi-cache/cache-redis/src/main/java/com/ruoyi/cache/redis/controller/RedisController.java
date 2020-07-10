package com.ruoyi.cache.redis.controller;


import com.fasterxml.jackson.databind.ser.Serializers;
import com.ruoyi.cache.redis.constant.CacheConstant;
import com.ruoyi.cache.redis.util.RedisUtils;
import com.ruoyi.common.core.domain.AjaxResult;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

@Controller
@RequestMapping("/cache/redis")
public class RedisController extends Serializers.Base {

    @Autowired
     private  RedisUtils redisUtils;

    private String prefix = "cache/redis";

    @Cacheable(cacheNames = "users",keyGenerator = "myKeyGenerator")
    @GetMapping("/{userId}")
    @ResponseBody
    public AjaxResult test(@PathVariable("userId")Long userId){
        return AjaxResult.success("success!"+userId);
    }


    @GetMapping
    @RequiresPermissions("cache:redis:view")
    public String indexRedis(){
        return prefix+"/redis";
    }

    @GetMapping("list")
    @ResponseBody
    @RequiresPermissions("cache:redis:view")
    public AjaxResult listCacheNamePrefix() throws IllegalAccessException {
        return AjaxResult.success("获取成功",CacheConstant.getCacheNames());
    }

    @GetMapping("list/{prefix}")
    @ResponseBody
    @RequiresPermissions("cache:redis:view")
    public AjaxResult listCacheKey(@PathVariable("prefix") String prefix) throws IllegalAccessException {

        if(!CacheConstant.getCacheNames().contains(prefix))
        {
            return AjaxResult.error("缓存类型不存在!");
        }

        return AjaxResult.success("获取成功",redisUtils.getKeys(prefix+"::*"));
    }

    /*获取缓存列表*/
    @GetMapping("/key/{key}")
    @ResponseBody
    @RequiresPermissions("cache:redis:view")
    public AjaxResult findKeysForPage(@PathVariable("key")String key){
        return AjaxResult.success("获取成功",redisUtils.get1(key));
    }
    /*获取缓存列表*/
    @GetMapping("/clearCache")
    @ResponseBody
    @RequiresPermissions("cache:redis:view")
    public AjaxResult cleanCache(){
        Set<Object> keys = redisUtils.getKeys("*");
        if (keys!=null&&keys.size()>0)
        {
            Iterator key = keys.iterator();
            while (key.hasNext()) {
               Object str = key.next();
              redisUtils.delete(str.toString());
            }
        }
        return AjaxResult.success("清理中!");
    }


}
