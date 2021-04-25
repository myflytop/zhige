package com.ruoyi.web.controller.monitor;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.CacheWebUtils;
import com.ruoyi.framework.web.service.CacheService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 缓存监控
 * 
 * @author ruoyi
 */
@Controller
@RequestMapping("/monitor/cache")
public class CacheController extends BaseController {
    private String prefix = "monitor/cache";

    @Autowired
    private CacheService cacheService;

    @GetMapping()
    public String cache(ModelMap mmap) {
        String[] names = cacheService.getCacheNames();
        List<String> listNames = new ArrayList<>();
        Collections.addAll(listNames, names);
        Collections.addAll(listNames, CacheWebUtils.getCacheNames());
        mmap.put("cacheNames", listNames);
        return prefix + "/cache";
    }

    @PostMapping("/getNames")
    public String getCacheNames(String fragment, ModelMap mmap) {
        String[] names = cacheService.getCacheNames();
        List<String> listNames = new ArrayList<>();
        Collections.addAll(listNames, names);
        Collections.addAll(listNames, CacheWebUtils.getCacheNames());
        mmap.put("cacheNames", listNames);
        return prefix + "/cache::" + fragment;
    }

    @PostMapping("/getKeys")
    public String getCacheKeys(String fragment, String cacheName, ModelMap mmap) {
        if ("oly-web".equals(cacheName)) {
            mmap.put("cacheKyes", CacheWebUtils.getKeys(cacheName));
        } else {
            mmap.put("cacheKyes", cacheService.getCacheKeys(cacheName));
        }
        mmap.put("cacheName", cacheName);

        return prefix + "/cache::" + fragment;
    }

    @PostMapping("/getValue")
    public String getCacheValue(String fragment, String cacheName, String cacheKey, ModelMap mmap) {
        mmap.put("cacheName", cacheName);
        mmap.put("cacheKey", cacheKey);
        if ("oly-web".equals(cacheName)) {
            mmap.put("cacheValue", CacheWebUtils.get(cacheName, cacheKey));
        } else {
            mmap.put("cacheValue", cacheService.getCacheValue(cacheName, cacheKey));
        }
        return prefix + "/cache::" + fragment;
    }

    @PostMapping("/clearCacheName")
    @ResponseBody
    public AjaxResult clearCacheName(String cacheName, ModelMap mmap) {
        if ("oly-web".equals(cacheName)) {
            CacheWebUtils.removeAll(cacheName);
        } else {
            cacheService.clearCacheName(cacheName);
        }
        return AjaxResult.success();
    }

    @PostMapping("/clearCacheKey")
    @ResponseBody
    public AjaxResult clearCacheKey(String cacheName, String cacheKey, ModelMap mmap) {
        if ("oly-web".equals(cacheName)) {
             CacheWebUtils.remove(cacheName, cacheKey);
        } else {
            cacheService.clearCacheKey(cacheName, cacheKey);
        }
        return AjaxResult.success();
    }

    @GetMapping("/clearAll")
    @ResponseBody
    public AjaxResult clearAll(ModelMap mmap) {
        cacheService.clearAll();
        CacheWebUtils.removeAll("oly-web");
        return AjaxResult.success();
    }
}
