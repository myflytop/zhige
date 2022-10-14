package com.ruoyi.system.config.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.enums.SysConfigGroups;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.properties.PropertyEnum;
import com.ruoyi.common.utils.CacheUtils;
import com.ruoyi.common.utils.ShiroUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.config.domain.SysConfig;
import com.ruoyi.system.config.enums.ConfigValueTypeEnum;
import com.ruoyi.system.config.mapper.SysConfigMapper;
import com.ruoyi.system.config.service.ISysConfigService;
import org.apache.commons.lang3.math.NumberUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 参数配置 服务层实现
 * 
 * @author ruoyi
 */
@Service
public class SysConfigServiceImpl implements ISysConfigService {
    @Autowired
    private SysConfigMapper configMapper;

    /**
     * 项目启动时，初始化参数到缓存
     */
    @PostConstruct
    public void init() {
        loadingConfigCache();
    }

    /**
     * 查询参数配置信息
     * 
     * @param configId 参数配置ID
     * @return 参数配置信息
     */
    @Override
    public SysConfig selectConfigById(Long configId) {
        SysConfig config = new SysConfig();
        config.setConfigId(configId);
        return configMapper.selectConfig(config);
    }

    /**
     * 根据Gk查询参数配置信息
     * 
     * @param configGroup 参数组
     * @param configKey   参数键名
     * @return 参数键值
     */
    @Override
    public String selectConfigValueByGk(String configGroup, String configKey) {
        String configValue = Convert.toStr(CacheUtils.get(getCacheName(), getCacheKey(configGroup, configKey)));
        if (StringUtils.isNotEmpty(configValue)) {
            return configValue;
        }
        SysConfig config = new SysConfig();
        config.setConfigKey(configKey);
        config.setConfigGroup(configGroup);
        SysConfig retConfig = configMapper.selectConfig(config);
        if (StringUtils.isNotNull(retConfig)) {
            CacheUtils.put(getCacheName(), getCacheKey(configGroup, configKey), retConfig.getConfigValue());
            return retConfig.getConfigValue();
        }
        return StringUtils.EMPTY;
    }

    @Override
    public SysConfig selectConfigByGk(String configGroup, String configKey) {
        SysConfig config = new SysConfig();
        config.setConfigKey(configKey);
        config.setConfigGroup(configGroup);
        return configMapper.selectConfig(config);
    }

    /**
     * 查询参数配置列表
     * 
     * @param config 参数配置信息
     * @return 参数配置集合
     */
    @Override
    public List<SysConfig> selectConfigList(SysConfig config) {
        return configMapper.selectConfigList(config);
    }

    /**
     * 获取配置列表
     * 
     * @return 配置组列表
     */
    @Override
    public List<String> selectConfigGroupList() {

        return configMapper.selectConfigGroupList();
    }

    /**
     * 新增参数配置
     * 
     * @param config 参数配置信息
     * @return 结果
     */
    @Override
    public int insertConfig(SysConfig config) {
        checkConfigValueType(config.getConfigValueType(), config.getConfigValue());
        int row = configMapper.insertConfig(config);
        if (row > 0) {
            CacheUtils.put(getCacheName(), getCacheKey(config.getConfigGroup(), config.getConfigKey()),
                    config.getConfigValue());
        }
        return row;
    }

    /**
     * 修改参数配置ById
     * 
     * @param config 参数配置信息
     * @return 结果
     */
    @Override
    public int updateConfigById(SysConfig config) {
        checkConfigValueType(config.getConfigValueType(), config.getConfigValue());
        int row = configMapper.updateConfigById(config);
        if (row > 0) {
            CacheUtils.put(getCacheName(), getCacheKey(config.getConfigGroup(), config.getConfigKey()),
                    config.getConfigValue());
        }
        return row;
    }

    /**
     * 修改参数配置ByGk
     * 
     * @param config 参数配置信息
     * @return 结果
     */
    @Override
    public int updateConfigByGk(SysConfig config) {
        checkConfigValueType(config.getConfigValueType(), config.getConfigValue());
        int row = configMapper.updateConfigByGk(config);
        if (row > 0) {
            CacheUtils.put(getCacheName(), getCacheKey(config.getConfigGroup(), config.getConfigKey()),
                    config.getConfigValue());
        }
        return row;
    }

    /**
     * 批量删除参数配置对象ByGk
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public void deleteConfigByIds(String ids) {
        Long[] configIds = Convert.toLongArray(ids);
        for (Long configId : configIds) {
            SysConfig config = selectConfigById(configId);
            if (UserConstants.IS_SYSTEM == config.getConfigType()) {
                throw new ServiceException(String.format("内置参数【%1$s】不能删除 ", config.getConfigKey()));
            }
            configMapper.deleteConfigById(configId);
            CacheUtils.remove(getCacheName(), getCacheKey(config.getConfigGroup(), config.getConfigKey()));
        }
    }

    /**
     * 删除参数配置对象ByGk
     * 
     * @param config
     * @return 结果
     */
    @Override
    public int deleteConfigByGk(SysConfig config) {
        if (SysConfigGroups.getValues().contains(config.getConfigGroup())) {
            throw new ServiceException(String.format("【%1$s】为系统配置组,当前组成员不能删除 ", config.getConfigGroup()));
        }
        return configMapper.deleteConfigByGk(config);
    }

    /**
     * 加载参数缓存数据
     */
    @Override
    public void loadingConfigCache() {
        List<SysConfig> configsList = configMapper.selectConfigList(new SysConfig());
        for (SysConfig config : configsList) {
            CacheUtils.put(getCacheName(), getCacheKey(config.getConfigGroup(), config.getConfigKey()),
                    config.getConfigValue());
        }
    }

    /**
     * 清空参数缓存数据
     */
    @Override
    public void clearConfigCache() {
        CacheUtils.removeAll(getCacheName());
    }

    /**
     * 重置参数缓存数据
     */
    @Override
    public void resetConfigCache() {
        clearConfigCache();
        loadingConfigCache();
    }

    /**
     * 校验Gk是否唯一
     * 
     * @param config 参数配置信息
     * @return 结果
     */
    @Override
    public String checkConfigGkUnique(SysConfig config) {
        Long configId = StringUtils.isNull(config.getConfigId()) ? -1L : config.getConfigId();
        SysConfig info = configMapper.selectConfig(config);
        if (StringUtils.isNotNull(info) && info.getConfigId().longValue() != configId.longValue()) {
            return UserConstants.CONFIG_KEY_NOT_UNIQUE;
        }
        return UserConstants.CONFIG_KEY_UNIQUE;
    }

    @Override
    public Map<String, SysConfig> selectConfigMap(SysConfig config) {
        List<SysConfig> sysConfigs = this.selectConfigList(config);
        Map<String, SysConfig> collect = sysConfigs.stream().collect(HashMap::new, (k, v) -> k.put(v.getConfigKey(), v),
                HashMap::putAll);
        return collect;
    }

    @Override
    public Map<String, String> selectConfigMapValue(SysConfig config) {
        List<SysConfig> sysConfigs = this.selectConfigList(config);
        Map<String, String> collect = sysConfigs.stream().collect(HashMap::new,
                (k, v) -> k.put(v.getConfigKey(), v.getConfigValue()), HashMap::putAll);
        return collect;
    }

    @Override
    public int deleteConfigByGroup(String configGroup) {
        if (SysConfigGroups.getValues().contains(configGroup)) {
            throw new ServiceException(String.format("【%1$s】为系统配置组,当前组不能删除 ", configGroup));
        }
        return configMapper.deleteConfigByGroup(configGroup);
    }

    /**
     * 判断是否符合预期类型
     * 
     * @param type
     * @param object
     * @return
     */
    private void checkConfigValueType(Integer type, Object object) {
        boolean result = false;
        if (type == ConfigValueTypeEnum.BOOLEAN.ordinal()) {
            result = "true".equals(object) || "false".equals(object);
        } else if (type == ConfigValueTypeEnum.NUMBER.ordinal()) {
            result = NumberUtils.isDigits(object.toString());
        } else if (type == ConfigValueTypeEnum.FLOAT.ordinal()) {
            result = NumberUtils.isCreatable(object.toString());
        } else {
            result = true;
        }
        if (!result)
            throw new ServiceException(String.format("预期类型检测不通过类型【%1$s,参数%2$s】", type, object));
    }

    /**
     * 获取cache name
     * 
     * @return 缓存名
     */
    private String getCacheName() {
        return Constants.SYS_CONFIG_CACHE;
    }

    /**
     * 设置cache key
     * 
     * @param configGroup 参数组
     * @param configKey   参数键
     * @return 缓存键key
     */
    private String getCacheKey(String configGroup, String configKey) {
        return Constants.SYS_CONFIG_KEY + configGroup + "_" + configKey;
    }

    @Override
    public String selectConfigDefaultValue(String groupName, PropertyEnum propertyEnum) {
        String value = selectConfigValueByGk(groupName, propertyEnum.getValue());
        return PropertyEnum.convertTo(value, propertyEnum).toString();

    }

    @Override
    public Map<String, SysConfig> selectConfigMapByGroupName(String configGroup) {
        SysConfig config = new SysConfig();
        config.setConfigGroup(configGroup);
        return this.selectConfigMap(config);
    }

    @Override
    public Map<String, String> selectConfigMapValueByGroupName(String configGroup) {
        SysConfig config = new SysConfig();
        config.setConfigGroup(configGroup);
        return this.selectConfigMapValue(config);
    }

    @Override
    public int updatesByMap(Map<String, String> map) {
        int i = 0;
        String configGroup = map.get("configGroup");
        if (StringUtils.isEmpty(configGroup)) {
            throw new ServiceException("配置组能为空!");
        }
        map.remove("configGroup");
        for (Map.Entry<String, String> entry : map.entrySet()) {
            SysConfig sysConfig = new SysConfig();
            sysConfig.setConfigKey(entry.getKey());
            sysConfig.setConfigValue(entry.getValue());
            sysConfig.setConfigGroup(configGroup);
            SysConfig rsConfig = this.selectConfigByGk(sysConfig.getConfigGroup(), sysConfig.getConfigKey());
            // 存在执行更新操作
            if (StringUtils.isNotNull(rsConfig)) {
                sysConfig.setUpdateBy(ShiroUtils.getLoginName());
                sysConfig.setConfigValueType(rsConfig.getConfigValueType());
                this.updateConfigByGk(sysConfig);
            }
            // 不存在执行插入操作
            else {
                sysConfig.setConfigName(entry.getKey());
                sysConfig.setCreateBy(ShiroUtils.getLoginName());
                sysConfig.setConfigValueType(ConfigValueTypeEnum.STRING.ordinal());
                this.insertConfig(sysConfig);
            }
            i = +1;
        }
        this.clearConfigCache();
        return i;
    }

}
