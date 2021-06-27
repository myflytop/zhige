package com.oly.web.web.api;

import java.util.Map;

import com.oly.common.model.enums.OlyConfigCommonEnum;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.system.domain.SysConfig;
import com.ruoyi.system.service.impl.SysConfigServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *获取配置相关
 */
@RestController
@RequestMapping("/api/app")
@CrossOrigin
public class AppApiController {
    private final String CONFIG_PREIGX = OlyConfigCommonEnum.OLY_APP_PREFIX.getValue();
    @Autowired
    private SysConfigServiceImpl sysConfigService;
    
  

    @GetMapping("/getAPPInfo")
    public AjaxResult getAPPInfo(){
    Map<String,SysConfig>  sMap=  sysConfigService.selectConfigMap(CONFIG_PREIGX);
        return AjaxResult.success(sMap);
    }
   


}
