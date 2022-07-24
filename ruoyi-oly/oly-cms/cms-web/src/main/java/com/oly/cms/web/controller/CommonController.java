package com.oly.cms.web.controller;

import com.oly.cms.common.domain.entity.CmsColumn;
import com.oly.cms.common.model.properties.OlyThemeConfigProperties;
import com.oly.cms.general.service.cache.GeneralColumnCacheService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.properties.PropertyEnum;
import com.ruoyi.common.utils.ServletUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.config.service.ISysConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;

public class CommonController extends BaseController {

    @Autowired
    protected GeneralColumnCacheService cmsColumnService;

    @Autowired
    protected ISysConfigService configService;

    /**
     * 默认转发 1.查找是否存在缓存 2.不存在使用默认主题
     *
     * @param page
     * @return
     */
    protected String getPrefix(String themeName, String page, ModelMap mp) {
        setParams(mp);
        if (StringUtils.isNotEmpty(themeName)) {
            boolean support = "true".equals(
                    configService.selectConfigDefauleValue(OlyThemeConfigProperties.THEME_CONFIG_GROUP.defaultValue(),
                            OlyThemeConfigProperties.THEME_MORE_INSTALL));
            if (support) {
                return themeName + page;
            }
            return "redirect:/";
        } else {
            themeName = configService.selectConfigDefauleValue(
                    OlyThemeConfigProperties.THEME_CONFIG_GROUP.defaultValue(), OlyThemeConfigProperties.THEME_USED);
            return themeName + page;
        }
    }

    // 返回所有参数
    private void setParams(ModelMap mp) {
        mp.putAll(ServletUtils.getRequest().getParameterMap());
    }

    protected String getSupportType(String themeName, PropertyEnum propertyEnum) {
        return configService.selectConfigDefauleValue(getThemeName(themeName), propertyEnum);
    }

    protected CmsColumn getCmsColumn(String themeName, PropertyEnum propertyEnum) {
        CmsColumn cmsColumn = cmsColumnService.getCmsColumnById(
                Long.parseLong(configService.selectConfigDefauleValue(getThemeName(themeName), propertyEnum)));
        return cmsColumn == null ? new CmsColumn() : cmsColumn;
    }

    protected String getThemeName(String themeName) {
        if (StringUtils.isEmpty(themeName)) {
            themeName = configService.selectConfigDefauleValue(
                    OlyThemeConfigProperties.THEME_CONFIG_GROUP.defaultValue(), OlyThemeConfigProperties.THEME_USED);
        }
        return themeName;
    }

}
