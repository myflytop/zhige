package com.ruoyi.taoke.web.contoller.api;

import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.system.service.impl.SysConfigServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.thymeleaf.spring5.view.ThymeleafViewResolver;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/taoke/api")
public class TaoKeApiController {
    //blog配置前缀
    private final String CONFIG_PREFIX="taoke.config";
    @Autowired
    private SysConfigServiceImpl sysConfigService;

    @Autowired
    @Qualifier("thymeleafViewResolver")
    private ThymeleafViewResolver viewResolver;

    /**
     * 刷新淘客全局变量配置
     * @return
     */
    @GetMapping("/taokeConfigRefresh")
    public AjaxResult refreshConfig(){
        Map<String, Object> vars = new HashMap<>();
        vars.put("taokeConfig", sysConfigService.selectConfigMap(CONFIG_PREFIX));
        viewResolver.setStaticVariables(vars);
        return AjaxResult.success();
    }
}