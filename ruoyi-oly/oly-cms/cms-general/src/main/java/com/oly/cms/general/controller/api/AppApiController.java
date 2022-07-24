package com.oly.cms.general.controller.api;

import java.util.Map;

import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.system.config.service.ISysConfigService;

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
    @Autowired
    private ISysConfigService configService;

    /**
     * 获取App配置
     * 
     * @return
     */
    @GetMapping("/getAppInfo")
    public AjaxResult getAppInfo() {
        Map<String, String> bMap = configService.selectConfigMapValueByGroupName("");
        return AjaxResult.success(bMap);
    }

}
