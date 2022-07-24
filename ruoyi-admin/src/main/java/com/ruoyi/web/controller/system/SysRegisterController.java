package com.ruoyi.web.controller.system;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.framework.shiro.service.SysRegisterService;
import com.ruoyi.system.config.service.ISysConfigService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.hutool.core.convert.Convert;

/**
 * 注册验证
 * 
 * @author ruoyi
 */
@Controller
public class SysRegisterController extends BaseController {
    @Autowired
    private SysRegisterService registerService;

    @Autowired
    private ISysConfigService configService;

    @GetMapping("/register")
    public String register() {
        return "register";
    }

    @PostMapping("/register")
    @ResponseBody
    public AjaxResult ajaxRegister(SysUser user) {
        if (!("true".equals(configService.selectConfigValueByGk("sysUser", "sys.account.registerUser")))) {
            return error("当前系统没有开启注册功能！");
        }
        user.setDeptId(Convert.toLong(configService.selectConfigValueByGk("sysUser", "sys.account.defaultDept"), null));
        user.setPostIds(
                Convert.toLongArray(configService.selectConfigValueByGk("sysUser", "sys.account.defaultPostIds")));
        user.setRoleIds(
                Convert.toLongArray(configService.selectConfigValueByGk("sysUser", "sys.account.defaultRoleIds")));
        String msg = registerService.register(user);
        return StringUtils.isEmpty(msg) ? success() : error(msg);
    }
}
