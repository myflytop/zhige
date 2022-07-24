package com.oly.cms.hand.controller;

import com.oly.cms.hand.service.IHandleService;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.ShiroUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
}
