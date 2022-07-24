package com.oly.cms.admin.controller.page;

import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oly.cms.admin.web.CmsCommonController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.enums.OperateTitle;
import com.ruoyi.system.config.service.ISysConfigService;

@Controller
@RequestMapping("/cms/config")
public class CmsConfigController extends CmsCommonController {

    private final String prefix = acceptPrefix + "config";
    @Autowired
    private ISysConfigService configService;

    @GetMapping("/cmsConfig")
    @RequiresPermissions("cms:config:view")
    public String configCms() {

        return prefix + "/cmsConfig";
    }

    /**
     * 修改保存参数配置
     * 通过key批量保存
     * 默认设置为字符串类型
     * 
     * @param mp
     * @return
     */
    @RequiresPermissions("cms:config:edit")
    @Log(title = OperateTitle.CMS_CONFIG, businessType = BusinessType.UPDATE)
    @PostMapping("/updateByGk")
    @ResponseBody
    public AjaxResult editByGkSaves(@RequestParam Map<String, String> mp) {
        return toAjax(configService.updatesByMap(mp));
    }

    @GetMapping("/appConfig")
    @RequiresPermissions("cms:config:view")
    public String configApp() {

        return prefix + "/appConfig";
    }

}
