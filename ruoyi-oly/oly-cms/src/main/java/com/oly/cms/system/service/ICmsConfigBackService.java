package com.oly.cms.system.service;

import java.util.List;

import com.oly.cms.system.model.po.CmsConfigBack;

/**
 * 配置文件备份Service接口
 * 
 * @author 止戈
 * @date 2021-04-04
 */
public interface ICmsConfigBackService {
    /**
     * 查询配置文件备份
     * 
     * @param configGroup 配置文件备份ID
     * @return 配置文件备份
     */
    public List<CmsConfigBack> listCmsConfigBackByGroup(String configGroup);

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
     * 删除配置文件备份信息
     * 
     * @param configGroup 配置文件备份ID
     * @return 结果
     */
    public int deleteCmsConfigBackByGroup(String configGroup);

    public boolean isExist(String backGroup, String configKey);

    public CmsConfigBack getConfigByUnink(String configGroup, String configKey);
    
    public List<String> listGroup();
}
