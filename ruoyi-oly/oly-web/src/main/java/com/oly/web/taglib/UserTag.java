package com.oly.web.taglib;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.ShiroUtils;
import com.ruoyi.system.service.impl.SysUserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("userTag")
public class UserTag {

    @Autowired
    private SysUserServiceImpl userService;
    
    /**
     * 获取登陆用户
     * @return
     */
    public SysUser getLoginUser() {
        return ShiroUtils.getSysUser();
    }

    public SysUser getUserByUserId(Long userId) {
        return userService.selectUserById(userId);
    }

}
