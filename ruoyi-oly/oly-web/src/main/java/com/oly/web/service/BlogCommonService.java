package com.oly.web.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.oly.common.model.properties.PropertyEnum;
import com.oly.web.mapper.BlogConfigMapper;
import com.oly.web.model.po.BlogConfig;
import com.ruoyi.system.domain.SysConfig;
import com.ruoyi.system.service.impl.SysConfigServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BlogCommonService {
    @Autowired
    private BlogConfigMapper bMapper;

    @Autowired
    private SysConfigServiceImpl serviceImpl;

    /**
     * 获取配置
     * 
     * @param configGroup
     * @param configKey
     * @return
     */
    public BlogConfig getConfigByUnink(String configGroup, String configKey) {
        return bMapper.getConfigByUnink(configGroup, configKey);
    }

    /**
     * 
     * @param configGroup
     * @return
     */
    public List<BlogConfig> listBlogConfigBackByGroup(String configGroup) {
        return bMapper.listBlogConfigBackByGroup(configGroup);
    }

    /**
     * 获取配置转换为map
     * 
     * @param configGroup
     * @return
     */
    public Map<String, String> selectConfigValueMap(String configGroup) {
        List<BlogConfig> sysConfigs = this.listBlogConfigBackByGroup(configGroup);
        Map<String, String> collect = sysConfigs.stream().collect(HashMap::new,
                (k, v) -> k.put(v.getConfigKey(), v.getConfigValue()), HashMap::putAll);
        return collect;
    }

    /**
     * 如果获取到的信息为空 返回默认值
     * 
     * @return
     */
    public String selectConfigDefauleValue(PropertyEnum propertyEnum) {
        String value = serviceImpl.selectConfigByKey(propertyEnum.getValue());
        return PropertyEnum.convertTo(value, propertyEnum).toString();
    }

    public String checkConfigKeyUnique(String key) {
        SysConfig sysConfig = new SysConfig();
        sysConfig.setConfigKey(key);
        return serviceImpl.checkConfigKeyUnique(sysConfig);
    }

    public int insertConfig(SysConfig sysConfig) {
        return serviceImpl.insertConfig(sysConfig);
    }

    public int updateConfigBy(SysConfig sysConfig) {
        return serviceImpl.updateConfigByKey(sysConfig);
    }

    public String getConfigByUninkValue(String group, String key) {
        BlogConfig b = this.getConfigByUnink(group, key);
        return b == null ? null : b.getConfigValue();
    }

}
