package com.oly.web.service.cache;

import java.util.Map;

import com.oly.common.constant.CacheConstant;
import com.oly.web.service.BlogCommonService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

@Service
@CacheConfig(cacheNames = "oly-web")
public class BlogConfigCacheService {

    @Autowired
    private BlogCommonService bService;


    @Cacheable(key = "'" + CacheConstant.CONFIG_CACHE_KEY_PREFIX + "getWebConfigByGroup_'+#p0")
    public Map<String,String> getWebConfigByGroup(String group){
         
        return bService.selectConfigValueMap(group);
    }

}
