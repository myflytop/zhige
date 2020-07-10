package com.ruoyi.blog.taglib;

import com.ruoyi.framework.util.ShiroUtils;
import com.ruoyi.system.domain.SysUser;
import com.ruoyi.system.service.impl.SysUserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("userTag")
public class UserTag {

    @Autowired
    private SysUserServiceImpl userService;
    public SysUser getLoginUser(){
        return ShiroUtils.getSysUser();
    }

    public SysUser getUserByUserId(Long userId){
        return userService.selectUserById(userId);
    }

}
