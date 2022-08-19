package com.ruoyi.web.controller.system;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.entity.SysUserInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.enums.OlyStageRoot;
import com.ruoyi.common.enums.OperateTitle;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.ShiroUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.file.MimeExtensionEnum;
import com.ruoyi.framework.shiro.service.SysPasswordService;
import com.ruoyi.oss.factory.OssFactory;
import com.ruoyi.oss.model.OssResult;
import com.ruoyi.oss.properties.OssConfigProperties;
import com.ruoyi.oss.service.OssHandler;
import com.ruoyi.system.config.service.ISysConfigService;
import com.ruoyi.system.core.service.ISysUserInfoService;
import com.ruoyi.system.core.service.ISysUserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

/**
 * 个人信息 业务处理
 * 
 * @author ruoyi
 */
@Controller
@RequestMapping("/system/user/profile")
public class SysProfileController extends BaseController {
    private static final Logger log = LoggerFactory.getLogger(SysProfileController.class);

    private String prefix = "system/user/profile";

    @Autowired
    private ISysUserService userService;

    @Autowired
    private ISysUserInfoService userInfoService;

    @Autowired
    private SysPasswordService passwordService;

    @Autowired
    private OssFactory ossHandler;

    @Autowired
    private ISysConfigService configService;

    /**
     * 个人信息
     */
    @GetMapping()
    public String profile(ModelMap mmap) {
        SysUser user = getSysUser();
        mmap.put("user", user);
        mmap.put("userInfo", userInfoService.selectSysUserInfoByUserId(user.getUserId()));
        mmap.put("roleGroup", userService.selectUserRoleGroup(user.getUserId()));
        mmap.put("postGroup", userService.selectUserPostGroup(user.getUserId()));
        return prefix + "/profile";
    }

    @GetMapping("/checkPassword")
    @ResponseBody
    public boolean checkPassword(String password) {
        SysUser user = getSysUser();
        if (passwordService.matches(user, password)) {
            return true;
        }
        return false;
    }

    @GetMapping("/resetPwd")
    public String resetPwd(ModelMap mmap) {
        SysUser user = getSysUser();
        mmap.put("user", userService.selectUserById(user.getUserId()));
        return prefix + "/resetPwd";
    }

    @Log(title = OperateTitle.SYS_USRT_REST_PWD, businessType = BusinessType.UPDATE)
    @PostMapping("/resetPwd")
    @ResponseBody
    public AjaxResult resetPwd(String oldPassword, String newPassword) {
        SysUser user = getSysUser();
        if (!passwordService.matches(user, oldPassword)) {
            return error("修改密码失败，旧密码错误");
        }
        if (passwordService.matches(user, newPassword)) {
            return error("新密码不能与旧密码相同");
        }
        user.setSalt(ShiroUtils.randomSalt());
        user.setPassword(passwordService.encryptPassword(user.getLoginName(), newPassword, user.getSalt()));
        user.setPwdUpdateDate(DateUtils.getNowDate());
        if (userService.resetUserPwd(user) > 0) {
            setSysUser(userService.selectUserById(user.getUserId()));
            return success();
        }
        return error("修改密码异常，请联系管理员");
    }

    /**
     * 修改用户
     */
    @GetMapping("/edit")
    public String edit(ModelMap mmap) {
        SysUser user = getSysUser();
        mmap.put("user", userService.selectUserById(user.getUserId()));
        return prefix + "/edit";
    }

    /**
     * 修改头像
     */
    @GetMapping("/avatar")
    public String avatar(ModelMap mmap) {
        SysUser user = getSysUser();
        mmap.put("user", userService.selectUserById(user.getUserId()));
        return prefix + "/avatar";
    }

    /**
     * 修改用户基本信息
     */
    @Log(title = OperateTitle.SYS_PROFILE, businessType = BusinessType.UPDATE)
    @PostMapping("/update")
    @ResponseBody
    public AjaxResult update(SysUser user) {
        SysUser currentUser = getSysUser();
        currentUser.setUserName(user.getUserName());
        currentUser.setEmail(user.getEmail());
        currentUser.setPhonenumber(user.getPhonenumber());
        currentUser.setSex(user.getSex());
        if (StringUtils.isNotEmpty(user.getPhonenumber())
                && UserConstants.USER_PHONE_NOT_UNIQUE.equals(userService.checkPhoneUnique(currentUser))) {
            return error("修改用户'" + currentUser.getLoginName() + "'失败，手机号码已存在");
        } else if (StringUtils.isNotEmpty(user.getEmail())
                && UserConstants.USER_EMAIL_NOT_UNIQUE.equals(userService.checkEmailUnique(currentUser))) {
            return error("修改用户'" + currentUser.getLoginName() + "'失败，邮箱账号已存在");
        }
        if (userService.updateUserInfo(currentUser) > 0) {
            setSysUser(userService.selectUserById(currentUser.getUserId()));
            return success();
        }
        return error();
    }

    /**
     * 修改用户详细
     */
    @Log(title = OperateTitle.SYS_PROFILE, businessType = BusinessType.UPDATE)
    @PostMapping("/updateUserInfo")
    @ResponseBody
    public AjaxResult updateUserInfo(SysUserInfo userInfo) {
        SysUser user = new SysUser();
        user.setUserId(ShiroUtils.getUserId());
        user.setCreateBy(ShiroUtils.getUserIdStr());
        userInfo.setUserId(user.getUserId());
        // 更新用户修改时间
        userService.updateUser(user);
        return toAjax(userInfoService.updateSysUserInfo(userInfo));
    }

    /**
     * 保存头像
     */
    @Log(title = OperateTitle.SYS_PROFILE, businessType = BusinessType.UPDATE)
    @PostMapping("/updateAvatar")
    @ResponseBody
    public AjaxResult updateAvatar(@RequestParam("avatarfile") MultipartFile file) {
        SysUser currentUser = getSysUser();
        try {
            if (!file.isEmpty()) {
                String groupName = OssConfigProperties.OSS_CONFIG_GROUP.defaultValue();
                int maxLength = Integer.parseInt(configService.selectConfigDefauleValue(groupName,
                        OssConfigProperties.OSS_FILE_NAME_MAX_LENGTH));
                long maxSize = Long.parseLong(
                        configService.selectConfigDefauleValue(groupName, OssConfigProperties.OSS_FILE_MAX_SIZE));
                OssHandler.check(file, maxLength, maxSize,
                        new String[] { MimeExtensionEnum.IMAGE.name().toLowerCase() });
                OssResult avat = ossHandler.get().ossAppointUpload(file, OlyStageRoot.HEARD_DIR, null);
                String avatar = avat.getData().getDomain() + OlyStageRoot.HEARD_DIR.getValue() + "/"
                        + avat.getData().getFk();
                currentUser.setAvatar(avatar);
                if (userService.updateUserInfo(currentUser) > 0) {
                    setSysUser(userService.selectUserById(currentUser.getUserId()));
                    return success();
                }
            }
            return error();
        } catch (Exception e) {
            log.error("修改头像失败！", e);
            return error(e.getMessage());
        }
    }
}
