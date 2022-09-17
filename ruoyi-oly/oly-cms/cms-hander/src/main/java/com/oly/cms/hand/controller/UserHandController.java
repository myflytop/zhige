package com.oly.cms.hand.controller;

import com.oly.cms.hand.service.IHandleService;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.ShiroUtils;
import com.ruoyi.common.utils.StringUtils;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/web/hand/user")
public class UserHandController {

    @Autowired
    private IHandleService webHandleService;

    @GetMapping("/isLogin/{userId}")
    private AjaxResult isLogin(@PathVariable("userId") Long userId) {
        if (ShiroUtils.getUserId() == null) {
            return AjaxResult.error("用户未登录");
        } else if (!ShiroUtils.getUserId().equals(userId)) {
            return AjaxResult.error("登陆账号不符");
        } else
            return AjaxResult.success("身份验证成功");
    }

    @GetMapping("/getUser/{userId}")
    public AjaxResult selectUser(@PathVariable("userId") Long userId) {
        return AjaxResult.success(webHandleService.selectUserById(userId));
    }

    @PostMapping("/login")
    public AjaxResult ajaxLogin(String username, String password, Boolean rememberMe) {
        /* 获取请求登陆参数 */
        UsernamePasswordToken token = new UsernamePasswordToken(username, password, rememberMe);
        Subject subject = SecurityUtils.getSubject();
        try {
            subject.login(token);
            return AjaxResult.success();
        } catch (AuthenticationException e) {
            String msg = "用户或密码错误";
            if (StringUtils.isNotEmpty(e.getMessage())) {
                msg = e.getMessage();
            }
            return AjaxResult.error(msg);
        }
    }
}
