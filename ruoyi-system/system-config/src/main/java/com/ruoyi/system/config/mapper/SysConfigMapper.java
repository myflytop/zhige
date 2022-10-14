package com.ruoyi.system.config.mapper;

import java.util.List;
import com.ruoyi.system.config.domain.SysConfig;

/**
 * 参数配置 数据层
 * 
 * @author ruoyi
 */
public interface SysConfigMapper {
    /**
     * 查询参数配置信息
     * 
     * @param config 参数配置信息
     * @return 参数配置信息
     */
    public SysConfig selectConfig(SysConfig config);

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
     * @return
     */
    public List<String> selectConfigGroupList();

    /**
     * 新增参数配置
     * 
     * @param config 参数配置信息
     * @return 结果
     */
    public int insertConfig(SysConfig config);

    /**
     * 修改参数配置ById
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
     * 删除参数配置ById
     * 
     * @param configId 参数主键
     * @return 结果
     */
    public int deleteConfigById(Long configId);

    /**
     * 删除参数配置
     * 
     * @param configGroup 参数配置组
     * @return 结果
     */
    public int deleteConfigByGroup(String configGroup);

    /**
     * 批量删除参数配置
     * 
     * @param configIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteConfigByIds(String[] configIds);
}