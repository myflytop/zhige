package com.oly.framework.web.service;

import java.util.List;
import java.util.Map;

import com.oly.common.model.properties.PropertyEnum;
import com.ruoyi.common.core.domain.entity.SysDictData;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.system.domain.SysConfig;
import com.ruoyi.system.service.impl.SysConfigServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
/**
 * 只提供获取
 */
@Service
public class OlyCommonService {
    @Autowired
    private SysConfigServiceImpl serviceImpl;
 


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


    public SysUser getUser(long userId)
    {
        return null;
    }
    
    public String getConfigValue(String configKey){
       
        return null;
    }

    public Map<String,String> ListConfigValueMap(String configKeyPrefix){
       
        return null;
    }

    public List<SysDictData> selectDictTypeList(String dictType){

        return null;
    }


}
