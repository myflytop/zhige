package com.oly.web.config;

import java.util.HashMap;
import java.util.Map;

import com.oly.common.model.enums.OlyConfigCommonEnum;
import com.ruoyi.system.service.impl.SysConfigServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.thymeleaf.spring5.view.ThymeleafViewResolver;

/**
 * 全局配置
 */
@Component
public class ThymeleafContestConfig {
    // blog配置前缀
    private final String BLOG_PREIGX = OlyConfigCommonEnum.OLY_WBE_PREIFX.getValue();
    // tao配置前缀
    private final String TAO_PREIGX = OlyConfigCommonEnum.OLY_TAO_PREFIX.getValue();
    @Autowired
    private SysConfigServiceImpl sysConfigService;


    /**
     * 设置全局变量
     * 
     * @param viewResolver
     */
    @Autowired
    @Qualifier("thymeleafViewResolver")
    private void configureThymeleafStaticVars(ThymeleafViewResolver viewResolver) {
        if (viewResolver != null) {
            Map<String, Object> vars = new HashMap<String,Object>();
            vars.put("blogConfig", sysConfigService.selectConfigMap(BLOG_PREIGX));
            vars.put("taoConfig", sysConfigService.selectConfigMap(TAO_PREIGX));
            viewResolver.setStaticVariables(vars);
        }
    }

}
