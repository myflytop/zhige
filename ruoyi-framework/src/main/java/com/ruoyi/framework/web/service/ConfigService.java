package com.ruoyi.framework.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.service.ISysConfigService;

import java.util.List;

/**
 * RuoYi首创 html调用 thymeleaf 实现参数管理
 * 
 * @author ruoyi
 */
@Service("config")
public class ConfigService
{
    @Autowired
    private ISysConfigService configService;

    /**
     * 根据键名查询参数配置信息
     * 
     * @param configKey 参数键名
     * @return 参数键值
     */
    public String getConfigByKey(String configKey)
    {
        return configService.selectConfigValueByKey(configKey);
    }

    /**
     * 获取分组列表
     * @return
     */
    public List<String> getConfigGroup()
    {
        return configService.selectConfigGroup();
    }
}
