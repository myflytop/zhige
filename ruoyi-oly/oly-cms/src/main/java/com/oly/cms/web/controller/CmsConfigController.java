package com.oly.cms.web.controller;

import com.oly.cms.web.CmsCommonController;
import com.oly.common.model.enums.OlyConfigCommonEnum;
import com.ruoyi.system.domain.SysConfig;
import com.ruoyi.system.service.impl.SysConfigServiceImpl;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/cms/config")
public class CmsConfigController extends CmsCommonController {

    @Autowired
    private SysConfigServiceImpl sysConfigService;

    private final String prefix = acceptPreifx + "config";
    // 内容参数配置
    private final String WEB_CONFIG_PREFIX = OlyConfigCommonEnum.OLY_WBE_PREIFX.getValue();
    // 内容参数配置
    private final String CMS_CONFIG_PREFIX = OlyConfigCommonEnum.OLY_CMS_PREIFX.getValue();

    @GetMapping
    @RequiresPermissions("cms:config:view")
    public String config(ModelMap mm) {

        SysConfig webConfig = new SysConfig();
        webConfig.setConfigKey(WEB_CONFIG_PREFIX);

        SysConfig cmsConfig = new SysConfig();
        cmsConfig.setConfigKey(CMS_CONFIG_PREFIX);

        mm.put("webConfig", sysConfigService.selectConfigValueMap(webConfig));
        mm.put("cmsConfig", sysConfigService.selectConfigValueMap(cmsConfig));
        return prefix + "/config";
    }

}
