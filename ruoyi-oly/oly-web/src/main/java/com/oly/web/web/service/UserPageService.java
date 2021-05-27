package com.oly.web.web.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oly.common.model.properties.OlyCmsConfigPropetries;
import com.oly.common.model.properties.OlyThemeProperties;
import com.ruoyi.common.utils.ServletUtils;
import com.ruoyi.common.utils.ShiroUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.service.impl.SysConfigServiceImpl;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

@Service
public class UserPageService {

    @Autowired
    private SysConfigServiceImpl configService;

    public String login(String themeName,HttpServletRequest request, HttpServletResponse response, ModelMap mp) {
        // 如果是Ajax请求，返回Json字符串。
        if (ServletUtils.isAjaxRequest(request)) {
            return ServletUtils.renderString(response, "{\"code\":\"1\",\"msg\":\"未登录或登录超时。请重新登录\"}");
        }
        return getPrefix(themeName, "/user/login");
    }

    public String personal(String themeName,ModelMap mp) {
        mp.put("user", ShiroUtils.getSysUser());

        return getPrefix(themeName, "/user/personal");
    }

    public String logout(String themeName) {
        Subject currentUser = SecurityUtils.getSubject();
        currentUser.logout();
        return "redirect:/"+themeName;
    }

    public String register(String themeName,ModelMap mp) {

        return getPrefix(themeName, "/user/register");
    }

    public String forget(String themeName,ModelMap mp) {
        return getPrefix(themeName, "/user/forget");
    }

      /**
     * 默认转发 1.查找是否存在缓存 2.不存在使用默认主题
     * 
     * @param redisUtils
     * @param page
     * @return
     */
    protected String getPrefix(String themeName, String page) {
        if (StringUtils.isNotEmpty(themeName)) {
            boolean support = "true"
                    .equals(configService.selectConfigByKey(OlyCmsConfigPropetries.THEME_OPEN_MORE.getValue()));
            if (support && StringUtils.isNotEmpty(themeName)) {
                return themeName + page;
            }
            return "redirect:/";
        } else {
            themeName = configService.selectConfigByKey(OlyThemeProperties.THEME_USED.getValue());
            if (StringUtils.isEmpty(themeName)) {
                return OlyThemeProperties.THEME_USED.defaultValue() + page;
            }
            return themeName + page;
        }
    }

}
