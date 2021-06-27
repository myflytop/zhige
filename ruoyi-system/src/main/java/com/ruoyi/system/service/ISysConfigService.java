package com.ruoyi.system.service;

import java.util.List;
import java.util.Map;

import com.ruoyi.system.domain.SysConfig;

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
     * 根据键名查询参数配置信息
     * 
     * @param configKey 参数键名
     * @return 参数键值
     */
    public String selectConfigByKey(String configKey);

    /**
     * 根据键名查询参数配置信息
     * 
     * @param configKey 参数键名
     * @return 配置参数
     */
    public SysConfig getConfigByKey(String configKey);

    /**
     * 查询参数配置列表
     * 
     * @param config 参数配置信息
     * @return 参数配置集合
     */
    public List<SysConfig> selectConfigList(SysConfig config);

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
    public int updateConfig(SysConfig config);

       /**
     * 批量删除参数配置信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public void deleteConfigByIds(String ids);

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
    public String checkConfigKeyUnique(SysConfig config);

    /**
     * 获取分组列表
     * 
     * @return 分组名列表
     */
    public List<String> selectConfigGroup();

    /**
     * 通过key修改参数配置
     * 
     * @param sysConfig
     * @return
     */
    public int updateConfigByKey(SysConfig sysConfig);

    /**
     * 获取配置文件转化为key SysConfig形式
     * 
     * @param configValuePrefix
     * @return
     */
    public Map<String, SysConfig> selectConfigMap(String configValuePrefix);

    /**
     * 获取配置文件转化为key value形式
     * 
     * @param configValuePrefix
     * @return
     */
    public Map<String, String> selectConfigValueMap(SysConfig sysConfig);

}
