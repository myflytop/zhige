package com.ruoyi.taoke.web.config;

import com.ruoyi.cms.common.enums.ConfigPreifxEnum;
import com.ruoyi.system.service.impl.SysConfigServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.thymeleaf.spring5.view.ThymeleafViewResolver;

import java.util.HashMap;
import java.util.Map;

@Component
public class TaokeThymeleafConfig {
    //blog配置前缀
    private final String CONFIG_PREIGX= ConfigPreifxEnum.TAOKE_CONFIG.getValue();
    @Autowired
    private SysConfigServiceImpl sysConfigService;

    /**
     * 设置全局变量
     * @param viewResolver
     */
    @Autowired
    @Qualifier("thymeleafViewResolver")
    private void configureThymeleafStaticVars(ThymeleafViewResolver viewResolver) {
        if(viewResolver != null) {
            Map<String, Object> vars = new HashMap();
            vars.put("taokeConfig", sysConfigService.selectConfigMap(CONFIG_PREIGX));
            viewResolver.setStaticVariables(vars);
        }
    }


}
