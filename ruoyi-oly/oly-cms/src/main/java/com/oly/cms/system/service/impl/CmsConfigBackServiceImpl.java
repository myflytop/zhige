package com.oly.cms.system.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.oly.cms.system.mapper.CmsConfigBackMapper;
import com.oly.cms.system.model.po.CmsConfigBack;
import com.oly.cms.system.service.ICmsConfigBackService;
import com.ruoyi.common.utils.DateUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 配置文件备份Service业务层处理
 * 
 * @author 止戈
 * @date 2021-04-04
 */
@Service
public class CmsConfigBackServiceImpl implements ICmsConfigBackService {
    @Autowired
    private CmsConfigBackMapper cmsConfigBackMapper;

   

    /**
     * 查询配置文件备份列表
     * 
     * @param cmsConfigBack 配置文件备份
     * @return 配置文件备份
     */
    @Override
    public List<CmsConfigBack> selectCmsConfigBackList(CmsConfigBack cmsConfigBack) {
        return cmsConfigBackMapper.selectCmsConfigBackList(cmsConfigBack);
    }

    /**
     * 新增配置文件备份
     * 
     * @param cmsConfigBack 配置文件备份
     * @return 结果
     */
    @Override
    public int insertCmsConfigBack(CmsConfigBack cmsConfigBack) {
        cmsConfigBack.setCreateTime(DateUtils.getNowDate());
        return cmsConfigBackMapper.insertCmsConfigBack(cmsConfigBack);
    }

    /**
     * 修改配置文件备份
     * 
     * @param cmsConfigBack 配置文件备份
     * @return 结果
     */
    @Override
    public int updateCmsConfigBack(CmsConfigBack cmsConfigBack) {
        cmsConfigBack.setUpdateTime(DateUtils.getNowDate());
        return cmsConfigBackMapper.updateCmsConfigBack(cmsConfigBack);
    }

    
    /**
     * 删除配置文件备份信息
     * 
     * @param configGroup 配置文件备份ID
     * @return 结果
     */
    @Override
    public int deleteCmsConfigBackByGroup(String configGroup) {
        return cmsConfigBackMapper.deleteCmsConfigByGroup(configGroup);
    }

    @Override
    public boolean isExist(String backGroup, String configKey) {

        return cmsConfigBackMapper.isExist(backGroup, configKey) > 0 ? true : false;
    }

    @Override
    public CmsConfigBack getConfigByUnink(String configGroup, String configKey) {
        
        return cmsConfigBackMapper.getConfigByUnink(configGroup,configKey);
    }

    @Override
    public List<String> listGroup() {
       
        return cmsConfigBackMapper.listGroup();
    }

    @Override
    public Map<String, String> getConfigBackValueMap(CmsConfigBack cmsConfigBack) {
        List<CmsConfigBack> sysConfigs = this.selectCmsConfigBackList(cmsConfigBack);
        Map<String, String> collect = sysConfigs.stream().collect(HashMap::new,
                (k, v) -> k.put(v.getConfigKey(), v.getConfigValue()), HashMap::putAll);
        return collect;

    }

    @Override
    public Map<String, String> getConfigBackValueMap(String configGroup, String kerPrefix) {
        CmsConfigBack cmsConfigBack=new CmsConfigBack();
        cmsConfigBack.setConfigGroup(configGroup);
        cmsConfigBack.setConfigKey(kerPrefix);
        return getConfigBackValueMap(cmsConfigBack);
    }

    @Override
    public Map<String, String> getConfigBackValueMap(String configGroup) {
        CmsConfigBack cmsConfigBack=new CmsConfigBack();
        cmsConfigBack.setConfigGroup(configGroup);
        return getConfigBackValueMap(cmsConfigBack);
    }
}
