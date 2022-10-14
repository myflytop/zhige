package com.ruoyi.system.config.service;

import java.util.List;
import java.util.Map;

import com.ruoyi.common.properties.PropertyEnum;
import com.ruoyi.system.config.domain.SysConfig;

/**
 * 参数配置 服务层
 * 
 * @author ruoyi
 */
public interface ISysConfigService {
    /**
     * 查询参数配置信息
     * 
     * @param configId 参数配置ID
     * @return 参数配置信息
     */
    public SysConfig selectConfigById(Long configId);

    /**
     * 查询参数配置信息
     * 
     * @param configGroup 参数组
     * @param configKey   参数键名
     * @return 参数配置信息
     */
    public SysConfig selectConfigByGk(String configGroup, String configKey);

    /**
     * 根据Gk查询参数配置信息
     * 
     * @param configGroup 参数组
     * @param configKey   参数键名
     * @return 参数键值
     */
    public String selectConfigValueByGk(String configGroup, String configKey);

    /**
     * 查询参数配置列表
     * 
     * @param config 参数配置信息
     * @return 参数配置集合
     */
    public List<SysConfig> selectConfigList(SysConfig config);

    /**
     * 获取配置列表
     * 
     * @return 配置组列表
     */
    public List<String> selectConfigGroupList();

    /**
     * 查询参数配置列表转Map
     * key config
     * 
     * @param config 参数配置信息
     * @return 参数配置集合
     */
    public Map<String, SysConfig> selectConfigMap(SysConfig config);

    /**
     * 查询参数配置列表转Map
     * key value
     * 
     * @param config 参数配置信息
     * @return 参数配置集合
     */
    public Map<String, String> selectConfigMapValue(SysConfig config);

    /**
     * 查询参数配置列表转Map
     * 
     * @param configGroup 参数配置组
     * @return 参数配置集合
     */
    public Map<String, SysConfig> selectConfigMapByGroupName(String configGroup);

    /**
     * 查询参数配置列表转Map
     * 
     * @param configGroup 参数配置组
     * @return 参数配置集合
     */
    public Map<String, String> selectConfigMapValueByGroupName(String configGroup);

    /**
     * 新增参数配置
     * 
     * @param config 参数配置信息
     * @return 结果
     */
    public int insertConfig(SysConfig config);

    /**
     * 修改参数配置
     * 
     * @param config 参数配置信息
     * @return 结果
     */
    public int updateConfigById(SysConfig config);

    /**
     * 修改参数配置ByGk
     * 
     * @param config 参数配置信息
     * @return 结果
     */
    public int updateConfigByGk(SysConfig config);

    /**
     * 批量修改参数配置
     * 
     * @param map
     * @return 结果
     */
    public int updatesByMap(Map<String, String> map);

    /**
     * 批量删除参数配置信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public void deleteConfigByIds(String ids);

    /**
     * 删除参数配置
     * 
     * @param configGroup 参数组
     * @param configKey   参数键名
     * @return 结果
     */
    public int deleteConfigByGk(String configGroup, String configKey);

    /**
     * 删除参数配置
     * 
     * @param configGroup 参数配置组
     * @return 结果
     */
    public int deleteConfigByGroup(String configGroup);

    /**
     * 加载参数缓存数据
     */
    public void loadingConfigCache();

    /**
     * 清空参数缓存数据
     */
    public void clearConfigCache();

    /**
     * 重置参数缓存数据
     */
    public void resetConfigCache();

    /**
     * 校验参数键名是否唯一
     * 
     * @param config 参数信息
     * @return 结果
     */
    public String checkConfigGkUnique(SysConfig config);

    /**
     * 如果获取到的信息为空 返回默认值
     * 
     * @param propertyEnum
     * @return
     */
    public String selectConfigDefaultValue(String groupName, PropertyEnum propertyEnum);
}
