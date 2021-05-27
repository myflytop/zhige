package com.oly.web.taglib;

import java.util.Map;

import com.oly.web.service.cache.BlogConfigCacheService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("configTag")
public class ConfigTag {
    @Autowired
    private BlogConfigCacheService bService;

  
    public String getTaoConfigValueByKey(String key){

        return null;
    }

    public Map<String,String> getWebConfigByGroup(String group){
        return bService.getWebConfigByGroup(group);
    }
    
}
