package com.oly.cms.web.controller;

import com.oly.cms.web.CmsCommonController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.CacheWebUtils;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/cms/cache")
public class CmsCacheController extends CmsCommonController {
    private String prefix = acceptPreifx + "cache";

    @GetMapping()
    public String cache(ModelMap mmap) {
        mmap.put("cacheNames", CacheWebUtils.getCacheNames());
        return prefix + "/cache";
    }

    @PostMapping("/getNames")
    public String getCacheNames(String fragment, ModelMap mmap) {
        mmap.put("cacheNames", CacheWebUtils.getCacheNames());
        return prefix + "/cache::" + fragment;
    }

    @PostMapping("/getKeys")
    public String getCacheKeys(String fragment, String cacheName, ModelMap mmap) {
        mmap.put("cacheName", cacheName);
        mmap.put("cacheKyes", CacheWebUtils.getKeys(cacheName));
        return prefix + "/cache::" + fragment;
    }

    @PostMapping("/getValue")
    public String getCacheValue(String fragment, String cacheName, String cacheKey, ModelMap mmap) {
        mmap.put("cacheName", cacheName);
        mmap.put("cacheKey", cacheKey);
        mmap.put("cacheValue", CacheWebUtils.get(cacheName, cacheKey));
        return prefix + "/cache::" + fragment;
    }

    @PostMapping("/clearCacheName")
    @ResponseBody
    public AjaxResult clearCacheName(String cacheName, ModelMap mmap) {
        CacheWebUtils.removeAll(cacheName);
        return AjaxResult.success();
    }

    @PostMapping("/clearCacheKey")
    @ResponseBody
    public AjaxResult clearCacheKey(String cacheName, String cacheKey, ModelMap mmap) {
        CacheWebUtils.remove(cacheName, cacheKey);
        return AjaxResult.success();
    }

    @GetMapping("/clearAll")
    @ResponseBody
    public AjaxResult clearAll(ModelMap mmap) {
        CacheWebUtils.clean();
        return AjaxResult.success();
    }
}
