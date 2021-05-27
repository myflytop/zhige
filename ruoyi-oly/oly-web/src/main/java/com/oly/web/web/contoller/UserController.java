package com.oly.web.web.contoller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oly.web.web.service.UserPageService;
import com.ruoyi.common.utils.ServletUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserPageService userPageService;
    private static final String themeName = null;

    @GetMapping("/login")
    public String login(HttpServletRequest request, HttpServletResponse response, ModelMap mp) {
        // 如果是Ajax请求，返回Json字符串。
        if (ServletUtils.isAjaxRequest(request)) {
            return ServletUtils.renderString(response, "{\"code\":\"1\",\"msg\":\"未登录或登录超时。请重新登录\"}");
        }
        return userPageService.login(themeName, request, response, mp);
    }

    @GetMapping("/personal")
    public String personal(ModelMap mp) {

        return userPageService.personal(themeName, mp);
    }

    @GetMapping("/logout")
    public String logout() {
        return userPageService.logout(themeName);
    }

    /**
     * 注册页面
     *
     * @return
     */
    @GetMapping("/register")
    public String register(ModelMap mp) {

        return userPageService.register(themeName, mp);
    }

    /**
     * 注册页面
     *
     * @return
     */
    @GetMapping("/forget")
    public String forget(ModelMap mp) {
        return userPageService.forget(themeName, mp);
    }

}
