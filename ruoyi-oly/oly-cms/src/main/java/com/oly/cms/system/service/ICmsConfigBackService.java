package com.oly.cms.system.service;

import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import com.oly.cms.system.domain.CmsConfigBack;

/**
 * 配置文件备份Service接口
 * 
 * @author 止戈
 * @date 2021-04-04
 */
public interface ICmsConfigBackService 
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
     * 批量删除配置文件备份
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteCmsConfigBackByIds(String ids);

    /**
     * 删除配置文件备份信息
     * 
     * @param configGroup 配置文件备份ID
     * @return 结果
     */
    public int deleteCmsConfigBackById(String configGroup);

    public boolean isExist(String backGroup,String configKey);
}
