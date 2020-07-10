package com.ruoyi.cms.web.controller;

import com.ruoyi.cms.common.mould.enums.CmsConfigPrefixEnum;
import com.ruoyi.system.service.impl.SysConfigServiceImpl;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

@Controller
@RequestMapping("/cms/config")
public class CmsConfigController {

    @Autowired
    private SysConfigServiceImpl sysConfigService;

    private final String prefix = "blog/admin/config";
    //blog配置前缀
    private final String BLOG_CONFIG_PREFIX= CmsConfigPrefixEnum.BLOG_PREFIX.getValue();
    //blog配置前缀
    private final String CMS_CONFIG_PREFIX= CmsConfigPrefixEnum.CMS_PREFIX.getValue();


    @GetMapping
    @RequiresPermissions("cms:config:view")
    public String config(ModelMap mm){

        mm.put("blogConfig",sysConfigService.selectConfigMap(BLOG_CONFIG_PREFIX));
        mm.put("cmsConfig",sysConfigService.selectConfigMap(CMS_CONFIG_PREFIX));
        return prefix+ "/config";
    }



}
