package com.ruoyi.system.config.tag;

import java.util.List;
import java.util.Map;

import com.ruoyi.system.config.domain.SysConfig;
import com.ruoyi.system.config.service.ISysConfigService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("configTag")
public class ConfigTag {
    @Autowired
    private ISysConfigService configService;

    /**
     * 根据Gk查询参数配置组
     * 
     * @param configGroup 参数组
     * @param configKey   参数键名
     * @return 参数键值
     */
    public String getKey(String configGroup, String configKey) {
        return configService.selectConfigValueByGk(configGroup, configKey);
    }

    /**
     * 查询参数配置列表转Map
     * 
     * @param configGroup 参数配置组
     * @return 参数配置集合
     */
    public Map<String, SysConfig> getConfigMap(String configGroup) {
        return configService.selectConfigMapByGroupName(configGroup);
    }

    /**
     * 查询参数配置列表转Map
     * 
     * @param configGroup 参数配置组
     * @return 参数配置集合
     */
    public Map<String, String> getConfigMapValue(String configGroup) {
        return configService.selectConfigMapValueByGroupName(configGroup);
    }

    /**
     * 查询参数配置列表转Map
     * 
     * @param configGroup 参数配置组
     * @param configKey
     * @return 参数配置集合
     */
    public Map<String, SysConfig> getConfigMap(String configGroup, String configKey) {
        return configService.selectConfigMapByGf(configGroup, configKey);
    }

    /**
     * 查询参数配置列表转Map
     * 
     * @param configGroup 参数配置组
     * @param configKey
     * @return 参数配置集合
     */
    public Map<String, String> getConfigMapValue(String configGroup, String configKey) {
        return configService.selectConfigMapValueByGf(configGroup, configKey);
    }

    /**
     * 获取分组列表
     * 
     * 
     * @return
     */
    public List<String> getConfigGroups() {
        return configService.selectConfigGroupList();
    }
}
