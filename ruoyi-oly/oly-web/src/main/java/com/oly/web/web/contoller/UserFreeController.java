package com.oly.web.web.contoller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oly.web.web.service.UserPageService;
import com.ruoyi.common.utils.ServletUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/zuser")
public class UserFreeController {

    @Autowired
    private UserPageService userPageService;

    @GetMapping("/{themeName}/login")
    public String login(@PathVariable(name = "themeName", required = true) String themeName, HttpServletRequest request,
            HttpServletResponse response, ModelMap mp) {
        // 如果是Ajax请求，返回Json字符串。
        if (ServletUtils.isAjaxRequest(request)) {
            return ServletUtils.renderString(response, "{\"code\":\"1\",\"msg\":\"未登录或登录超时。请重新登录\"}");
        }
        return userPageService.login(themeName, request, response, mp);
    }

    @GetMapping("/{themeName}/personal")
    public String personal(@PathVariable(name = "themeName", required = true) String themeName, ModelMap mp) {

        return userPageService.personal(themeName, mp);
    }

   @GetMapping("/{themeName}/logout")
    public String logout(@PathVariable(name="themeName",required = true)String themeName) {
        return userPageService.logout(themeName);
    }

    /**
     * 注册页面
     *
     * @return
     */
    @GetMapping("/{themeName}/register")
    public String register(@PathVariable(name = "themeName", required = true) String themeName, ModelMap mp) {

        return userPageService.register(themeName, mp);
    }

    /**
     * 注册页面
     *
     * @return
     */
    @GetMapping("/{themeName}/forget")
    public String forget(@PathVariable(name = "themeName", required = true) String themeName, ModelMap mp) {
        return userPageService.forget(themeName, mp);
    }

}
