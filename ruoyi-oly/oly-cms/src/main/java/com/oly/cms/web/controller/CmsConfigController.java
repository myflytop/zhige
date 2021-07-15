package com.oly.cms.web.controller;

import java.util.Map;

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
    // 网站参数配置模板
    private final String WEB_CONFIG_PREFIX = OlyConfigCommonEnum.OLY_WBE_PREIFX.getValue();
    // 内容参数配置
    private final String CMS_CONFIG_PREFIX = OlyConfigCommonEnum.OLY_CMS_PREIFX.getValue();
    // 内容参数配置
    private final String THEME_CONFIG_PREFIX = OlyConfigCommonEnum.OLY_THEME_PREFIX.getValue();
    // app参数设置
    private final String APP_CONFIG_PREFIX = OlyConfigCommonEnum.OLY_APP_PREFIX.getValue();
    // 淘客参数设置模板
    private final String TAO_KE_CONFIG_PREFIX = OlyConfigCommonEnum.OLY_TAO_PREFIX.getValue();
    // 评论参数设置模板
    private final String COMMENT_CONFIG_PREFIX = OlyConfigCommonEnum.OLY_COMMENT_PREIFX.getValue();

    @GetMapping("/cms")
    @RequiresPermissions("cms:config:view")
    public String configCms(ModelMap mm) {
        SysConfig cmsConfig = new SysConfig();
        cmsConfig.setConfigKey(CMS_CONFIG_PREFIX);
        Map<String, String> mps = sysConfigService.selectConfigValueMap(cmsConfig);
        cmsConfig.setConfigKey(COMMENT_CONFIG_PREFIX);
        mps.putAll(sysConfigService.selectConfigValueMap(cmsConfig));
        cmsConfig.setConfigKey(THEME_CONFIG_PREFIX);
        mps.putAll(sysConfigService.selectConfigValueMap(cmsConfig));
        mm.put("cmsConfig", mps);
        return prefix + "/cmsConfig";
    }

    @GetMapping("/app")
    @RequiresPermissions("cms:config:view")
    public String configApp(ModelMap mm) {

        SysConfig appConfig = new SysConfig();
        appConfig.setConfigKey(APP_CONFIG_PREFIX);
        mm.put("appConfig", sysConfigService.selectConfigValueMap(appConfig));
        return prefix + "/appConfig";
    }

    @GetMapping("/web")
    @RequiresPermissions("cms:config:view")
    public String configWeb(ModelMap mm) {
        SysConfig webConfig = new SysConfig();
        webConfig.setConfigKey(WEB_CONFIG_PREFIX);
        mm.put("webConfig", sysConfigService.selectConfigValueMap(webConfig));
        return prefix + "/webConfig";
    }

    /**
     * 淘客配置
     * 
     * @return
     */
    @RequiresPermissions("cms:config:view")
    @GetMapping("/tao")
    public String manage(ModelMap mm) {
        SysConfig webConfig = new SysConfig();
        webConfig.setConfigKey(TAO_KE_CONFIG_PREFIX);
        mm.put("taokeConfig", sysConfigService.selectConfigValueMap(webConfig));
        return prefix + "/taoConfig";
    }

}
