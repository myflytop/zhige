package com.oly.web.service.cache;

import java.util.Map;

import com.oly.common.constant.CacheConstant;
import com.oly.common.model.properties.PropertyEnum;
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
    
    @Cacheable(key = "'" + CacheConstant.CONFIG_CACHE_KEY_PREFIX + "getConfigValueByGroupAndKey_'+#p0+'_'+#p1")
    public String getConfigValueByGroupAndKey(String group,String key){
         
        return bService.getConfigByUnink(group,key).getConfigValue();
    }
    

    /**
     * 系统缓存
     * @param propertyEnum
     * @return
     */
    public String getSysConfigDefauleValue(PropertyEnum propertyEnum){
       
        return bService.selectConfigDefauleValue(propertyEnum);
    }

    @Cacheable(key = "'" + CacheConstant.CONFIG_CACHE_KEY_PREFIX + "getBackConfigDefauleValueByGroup_'+#p0+'key_'+#p1")
    public String getBackConfigDefauleValue(String group,PropertyEnum propertyEnum){
        String value = bService.getConfigByUninkValue(group,propertyEnum.getValue());
        return PropertyEnum.convertTo(value, propertyEnum).toString();
    }

}
