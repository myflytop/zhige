package com.oly.web.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.oly.web.mapper.BlogConfigMapper;
import com.oly.web.model.po.BlogConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BlogCommonService {
    @Autowired
    private BlogConfigMapper bMapper;

    public BlogConfig getConfigByUnink(String configGroup, String configKey) {
        return bMapper.getConfigByUnink(configGroup, configKey);
    }

    public List<BlogConfig> listBlogConfigBackByGroup(String configGroup) {
        return bMapper.listBlogConfigBackByGroup(configGroup);
    }
    
    public Map<String, String> selectConfigValueMap(String configGroup) {
        List<BlogConfig> sysConfigs =this.listBlogConfigBackByGroup(configGroup);
        Map<String, String> collect = sysConfigs.stream().collect(HashMap::new,
                (k, v) -> k.put(v.getConfigKey(), v.getConfigValue()), HashMap::putAll);
        return collect;
    }
}
