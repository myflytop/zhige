package com.oly.web.web.service;

import com.oly.common.model.properties.OlyCmsConfigPropetries;
import com.oly.common.model.properties.OlyThemeProperties;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.service.impl.SysConfigServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FrPageService {
    @Autowired
    private SysConfigServiceImpl configService;
    public String fr(String themeName,String page) {
        return getPrefix(themeName,"/fr/"+ page);
    }  
    
    /**
     * 默认转发 1.查找是否存在缓存 2.不存在使用默认主题
     * 
     * @param redisUtils
     * @param page
     * @return
     */
    protected String getPrefix(String themeName, String page) {
        if (StringUtils.isNotEmpty(themeName)) {
            boolean support = "true"
                    .equals(configService.selectConfigByKey(OlyCmsConfigPropetries.THEME_OPEN_MORE.getValue()));
            if (support && StringUtils.isNotEmpty(themeName)) {
                return themeName + page;
            }
            return "redirect:/";
        } else {
            themeName = configService.selectConfigByKey(OlyThemeProperties.THEME_USED.getValue());
            if (StringUtils.isEmpty(themeName)) {
                return OlyThemeProperties.THEME_USED.defaultValue() + page;
            }
            return themeName + page;
        }
    }
}
