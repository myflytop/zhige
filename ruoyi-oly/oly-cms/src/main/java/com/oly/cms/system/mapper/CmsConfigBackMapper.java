package com.oly.cms.system.mapper;

import java.util.List;
import com.oly.cms.system.domain.CmsConfigBack;

import org.apache.ibatis.annotations.Param;

/**
 * 配置文件备份Mapper接口
 * 
 * @author 止戈
 * @date 2021-04-04
 */
public interface CmsConfigBackMapper 
{
    /**
     * 查询配置文件备份
     * 
     * @param configGroup 配置文件备份ID
     * @return 配置文件备份
     */
    public CmsConfigBack selectCmsConfigBackById(String configGroup);

    /**
     * 查询配置文件备份列表
     * 
     * @param cmsConfigBack 配置文件备份
     * @return 配置文件备份集合
     */
    public List<CmsConfigBack> selectCmsConfigBackList(CmsConfigBack cmsConfigBack);

    /**
     * 新增配置文件备份
     * 
     * @param cmsConfigBack 配置文件备份
     * @return 结果
     */
    public int insertCmsConfigBack(CmsConfigBack cmsConfigBack);

    /**
     * 修改配置文件备份
     * 
     * @param cmsConfigBack 配置文件备份
     * @return 结果
     */
    public int updateCmsConfigBack(CmsConfigBack cmsConfigBack);

    /**
     * 删除配置文件备份
     * 
     * @param configGroup 配置文件备份ID
     * @return 结果
     */
    public int deleteCmsConfigBackById(String configGroup);

    /**
     * 批量删除配置文件备份
     * 
     * @param configGroups 需要删除的数据ID
     * @return 结果
     */
    public int deleteCmsConfigBackByIds(String[] configGroups);

    public int isExist(@Param("configGroup")String configGroup,@Param("configKey") String configKey);
}
