package com.oly.web.web;

import com.oly.common.model.properties.OlyThemeProperties;
import com.oly.common.model.properties.PropertyEnum;
import com.oly.web.model.po.BlogMenu;
import com.oly.web.service.cache.BlogConfigCacheService;
import com.oly.web.service.cache.BlogMenuCacheService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.utils.StringUtils;

import org.springframework.beans.factory.annotation.Autowired;

public class CommonController extends BaseController {

    @Autowired
    protected BlogMenuCacheService blogMenuService;

    @Autowired
    protected BlogConfigCacheService commonService;

    /**
     * 默认转发 1.查找是否存在缓存 2.不存在使用默认主题
     *
     * @param page
     * @return
     */
    protected String getPrefix(String themeName, String page) {
        if (StringUtils.isNotEmpty(themeName)) {
            boolean support = "true"
                    .equals(commonService.getSysConfigDefauleValue(OlyThemeProperties.THEME_MORE_INSTALL));
            if (support && StringUtils.isNotEmpty(themeName)) {
                return themeName + page;
            }
            return "redirect:" + page;
        } else {
            themeName = commonService.getSysConfigDefauleValue(OlyThemeProperties.THEME_USED);
            return themeName + page;
        }
    }

    protected String getSupportType(String themeName, PropertyEnum propertyEnum) {
        return commonService.getBackConfigDefauleValue(getThemeName(themeName), propertyEnum);
    }

    protected BlogMenu getBlogMenu(String themeName, PropertyEnum propertyEnum) {
        BlogMenu blogMenu = blogMenuService.getBlogMenuById(
                Long.parseLong(commonService.getBackConfigDefauleValue(getThemeName(themeName), propertyEnum)));
        return blogMenu == null ? new BlogMenu() : blogMenu;
    }

    protected String getThemeName(String themeName) {
        if (StringUtils.isEmpty(themeName)) {
            themeName = commonService.getSysConfigDefauleValue(OlyThemeProperties.THEME_USED);
        }
        return themeName;
    }

}
