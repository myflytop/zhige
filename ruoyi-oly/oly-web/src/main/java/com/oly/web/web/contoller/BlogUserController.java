package com.oly.web.web.contoller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.code.kaptcha.Constants;
import com.oly.mail.domain.MailUsedEnums;
import com.oly.mail.domain.OlyMail;
import com.oly.mail.service.impl.OlyMailServiceImpl;
import com.oly.web.web.CommonController;
import com.ruoyi.common.constant.ShiroConstants;
import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.ServletUtils;
import com.ruoyi.common.utils.ShiroUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.framework.shiro.service.SysPasswordService;
import com.ruoyi.system.service.impl.SysConfigServiceImpl;
import com.ruoyi.system.service.impl.SysUserServiceImpl;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.hutool.core.lang.Validator;
import cn.hutool.core.util.RandomUtil;

@Controller
@RequestMapping("/blog/user")
public class BlogUserController extends CommonController {
    @Autowired
    private SysConfigServiceImpl configService;
    @Autowired
    private OlyMailServiceImpl mailServiceImpl;
    @Autowired
    private SysUserServiceImpl sysUserService;
    @Autowired
    private SysPasswordService passwordService;

    @GetMapping("/login")
    public String login(HttpServletRequest request, HttpServletResponse response, ModelMap mp) {
        // 如果是Ajax请求，返回Json字符串。
        if (ServletUtils.isAjaxRequest(request)) {
            return ServletUtils.renderString(response, "{\"code\":\"1\",\"msg\":\"未登录或登录超时。请重新登录\"}");
        }
        return getPrefix(configService, "/login");
    }

    @GetMapping("/personal")
    public String personal(ModelMap mp){ 
        mp.put("user", ShiroUtils.getSysUser());
        System.out.println(ShiroUtils.getSysUser());
        return getPrefix(configService, "/personal");
    }

    @GetMapping("/logout")
    public String logout() {
        Subject currentUser = SecurityUtils.getSubject();
        currentUser.logout();
        return "redirect:/blog/index";
    }

    /**
     * 注册页面
     *
     * @return
     */
    @GetMapping("/register")
    public String register(ModelMap mp) {
    
        return getPrefix(configService, "/register");
    }

    /**
     * 注册页面
     *
     * @return
     */
    @GetMapping("/forget")
    public String forget(ModelMap mp) {
        return getPrefix(configService, "/forget");
    }

    /**
     * 发送邮箱验证码
     *
     * @return
     */
    @GetMapping("/sendEmailCode/{email}")
    @ResponseBody
    public AjaxResult sendEmailCode(@PathVariable("email") String email, HttpServletRequest request) {

        HttpSession session = request.getSession();
        // 验证是否为邮箱
        if (!Validator.isEmail(email)) {
            return AjaxResult.error("请输入正确邮箱");
        } else {
            SysUser sysUser = new SysUser();
            sysUser.setEmail(email);
            // 验证邮箱是否存在
            if (UserConstants.USER_EMAIL_UNIQUE.equals(sysUserService.checkEmailUnique(sysUser))) {
                String code = RandomUtil.randomNumbers(4);
                session.setAttribute(email, code);
                session.setMaxInactiveInterval(60);
                OlyMail olyMail = new OlyMail();
                olyMail.setToMail(email);
                olyMail.setSubject("你收到来止戈的找回密码验证码");
                olyMail.setContent("你的验证码为：" + code + ",验证码有效时间为60秒,请及时验证!");
                olyMail.setMailUsed(MailUsedEnums.CODE.ordinal());
                mailServiceImpl.sendTextMail(olyMail);
                return AjaxResult.success("验证码发送成功！");
            } else {
                return AjaxResult.error("邮箱已经注册！");
            }
        }
    }

    /**
     * 发送邮箱验证码找回密码
     *
     * @return
     */
    @GetMapping("/sendFindEmailCode/{email}")
    @ResponseBody
    public AjaxResult sendFindEmailCode(@PathVariable("email") String email, HttpServletRequest request) {
        HttpSession session = request.getSession();
        // 验证是否为邮箱
        if (!Validator.isEmail(email)) {
            return AjaxResult.error("请输入正确邮箱");
        } else {
            SysUser sysUser = new SysUser();
            sysUser.setEmail(email);
            // 验证邮箱是否存在
            if (!UserConstants.USER_EMAIL_UNIQUE.equals(sysUserService.checkEmailUnique(sysUser))) {
                String code = RandomUtil.randomNumbers(4);
                session.setAttribute(email, code);
                session.setMaxInactiveInterval(60);
                OlyMail olyMail = new OlyMail();
                olyMail.setToMail(email);
                olyMail.setSubject("你收到来止戈的找回密码验证码");
                olyMail.setContent("你的验证码为：" + code + ",验证码有效时间为60秒,请及时验证!");
                olyMail.setMailUsed(MailUsedEnums.CODE.ordinal());
                mailServiceImpl.sendTextMail(olyMail);
                return AjaxResult.success("验证码发送成功！");
            } else {
                return AjaxResult.error("邮箱可能已经注册！");
            }
        }
    }

    /**
     * 修改密码
     *
     * @return
     */
    @PostMapping("/forget")
    @ResponseBody
    public AjaxResult forget(SysUser user, String emailCode, HttpServletRequest request) {
        HttpSession session = request.getSession();
        // 验证码拦截器处理，没有验证码code,标识验证通过
        if (ServletUtils.getRequest().getAttribute(ShiroConstants.CURRENT_CAPTCHA) != null) {
            return AjaxResult.error("图形验证码验证失败");
        }
        SysUser sysUser = sysUserService.selectUserByEmail(user.getEmail());
        if (sysUser == null) {
            return AjaxResult.error("邮箱可能未注册！");
        } else if (session.getAttribute(user.getEmail()).equals(emailCode)) {
            user.setSalt(ShiroUtils.randomSalt());
            user.setPassword(
                    passwordService.encryptPassword(sysUser.getLoginName(), user.getPassword(), user.getSalt()));
            if (sysUserService.updateUserByEmail(user) == 1) {
                OlyMail olyMail = new OlyMail();
                olyMail.setToMail(user.getEmail());
                olyMail.setSubject("你收到来止戈的消息");
                olyMail.setContent("修改密码成功！" + "你可以通过邮箱" + user.getEmail() + "登陆修改密码等。");
                olyMail.setMailUsed(MailUsedEnums.NORMAL.ordinal());
                mailServiceImpl.sendTextMail(olyMail);
                return toAjax(1);
            }
        } else {
            return AjaxResult.error("验证码验证失败！");
        }
        return AjaxResult.error("修改失败！");
    }

    /**
     * 注册页面
     *
     * @return
     */
    @PostMapping("/register")
    @ResponseBody
    public AjaxResult register(SysUser user, String emailCode, HttpServletRequest request) {
        HttpSession session = request.getSession();
        // 验证码拦截器处理，没有验证码code,标识验证通过
        Object obj = ShiroUtils.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY);
        String code = String.valueOf(obj != null ? obj : "");
        if (!StringUtils.isEmpty(code)) {
            return AjaxResult.error("图形验证码验证失败");
        }
        if (user.getEmail() != null && session.getAttribute(user.getEmail()).equals(emailCode)) {
            if (UserConstants.USER_EMAIL_NOT_UNIQUE.equals(sysUserService.checkEmailUnique(user))) {
                return error("新增用户'" + user.getLoginName() + "'失败，邮箱账号已存在");
            }
            user.setSalt(ShiroUtils.randomSalt());
            user.setLoginName(user.getEmail());
            user.setUserName(user.getEmail());
            user.setRemark("普通用户|自行注册");
            user.setPassword(passwordService.encryptPassword(user.getLoginName(), user.getPassword(), user.getSalt()));
            if (sysUserService.insertUser(user) == 1) {
                OlyMail olyMail = new OlyMail();
                olyMail.setToMail(user.getEmail());
                olyMail.setSubject("你收到来止戈的消息");
                olyMail.setContent("注册成功！你可以通过邮箱" + user.getEmail() + "登陆修改密码等。");
                olyMail.setMailUsed(MailUsedEnums.NORMAL.ordinal());
                mailServiceImpl.sendTextMail(olyMail);
                return toAjax(1);
            }
        }

        return AjaxResult.error("注册失败！");
    }

    /**
     *
     * @param username   用户名
     * @param password   密码
     * @param rememberMe 记住我
     * @return
     */
    @PostMapping("/login")
    @ResponseBody
    public AjaxResult ajaxLogin(String username, String password, Boolean rememberMe) { /* 获取请求登陆参数 */
        UsernamePasswordToken token = new UsernamePasswordToken(username, password, rememberMe);
        Subject subject = SecurityUtils.getSubject();
        try {
            subject.login(token);
            return success();
        } catch (AuthenticationException e) {
            String msg = "用户或密码错误";
            if (StringUtils.isNotEmpty(e.getMessage())) {
                msg = e.getMessage();
            }
            return error(msg);
        }
    }

    @GetMapping("/isLogin/{userId}")
    @ResponseBody
    private AjaxResult isLogin(@PathVariable("userId") Long userId) {
        if (ShiroUtils.getUserId() == null) {
            return AjaxResult.error("用户未登录");
        } else if (!ShiroUtils.getUserId().equals(userId)) {
            return AjaxResult.error("登陆账号不符");
        } else
            return AjaxResult.success("身份验证成功");
    }

}
