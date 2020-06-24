package com.ruoyi.cache.redis.controller;

import com.ruoyi.cache.redis.annotation.RedisCache;
import com.ruoyi.cache.redis.util.RedisUtils;
import com.ruoyi.common.core.domain.AjaxResult;
import org.apache.xmlbeans.impl.xb.xsdschema.Public;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/cache/redis")
public class RedisController {

    @Autowired
     private  RedisUtils redisUtils;

    @Cacheable(cacheNames = "users",keyGenerator = "myKeyGenerator")
    @GetMapping("/{userId}")
    @ResponseBody
    public AjaxResult test(@PathVariable("userId")Long userId){
        return AjaxResult.success("success!"+userId);
    }

    @GetMapping("/key/{key}")
    @ResponseBody
    public AjaxResult findKeysForPage(@PathVariable("key")String key){
        return AjaxResult.success(redisUtils.get1(key));
    }
}
