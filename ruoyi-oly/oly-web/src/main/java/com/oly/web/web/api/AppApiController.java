package com.oly.web.web.api;

import java.util.Map;

import com.oly.common.model.enums.OlyConfigCommonEnum;
import com.oly.web.service.cache.BlogConfigCacheService;
import com.ruoyi.common.core.domain.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/*
 *@description: 获取相关配置获取
 *@author: zg
 *@date: 2021-07-02 16:53:01
*/
@RestController
@RequestMapping("/api/config")
@CrossOrigin
public class AppApiController {
    private final String CONFIG_PREIGX = OlyConfigCommonEnum.OLY_APP_PREFIX.getValue();
    @Autowired
    private BlogConfigCacheService configCacheService;

    /**
     * 获取App配置
     * 
     * @return
     */
    @GetMapping("/getAppInfo")
    public AjaxResult getAppInfo() {
        Map<String, String> bMap = configCacheService.getWebConfigByGroup(CONFIG_PREIGX);
        return AjaxResult.success(bMap);
    }

}
