package com.oly.web.web.api;


import com.oly.web.model.vo.UserVo;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.system.service.impl.SysUserServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/user")
@CrossOrigin
public class BlogUserApiController {
    @Autowired
    private SysUserServiceImpl userService;

    @GetMapping("/getUser/{userId}")
    public AjaxResult  getUserById(@PathVariable("userId")long userId){
        SysUser sysUser=userService.selectUserById(userId);
        UserVo userVo=null;
        if(sysUser!=null){
       userVo=new UserVo(sysUser.getUserId(),sysUser.getAvatar(),sysUser.getUserName());
        }  
      return AjaxResult.success(userVo);
    }
    
}
