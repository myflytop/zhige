package com.ruoyi.system.core.taglib;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.entity.SysUserInfo;
import com.ruoyi.common.utils.ShiroUtils;
import com.ruoyi.system.core.service.ISysUserInfoService;
import com.ruoyi.system.core.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("userTag")
public class UserTag {

    @Autowired
    private ISysUserService userService;

    @Autowired
    private ISysUserInfoService userInfoService;

    /**
     * 获取登陆用户
     * 
     * @return
     */
    public SysUser getLoginUser() {
        return ShiroUtils.getSysUser();
    }

    public SysUserInfo getLoginUserInfo() {
        return userInfoService.selectSysUserInfoByUserId(ShiroUtils.getUserId());
    }

    public SysUser getUserByUserId(Long userId) {
        return userService.selectUserById(userId);
    }

    public SysUser getUserByUserLoginName(String userName) {
        return userService.selectUserByLoginName(userName);
    }

}
