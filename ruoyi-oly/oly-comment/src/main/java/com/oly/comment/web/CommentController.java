package com.oly.comment.web;

import com.oly.comment.model.CmsComment;
import com.oly.comment.model.properties.OlyCommentProperties;
import com.oly.comment.servie.impl.CmsCommentServiceImpl;
import com.oly.common.model.support.PageData;
import com.oly.framework.web.service.OlyCommonService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.ServletUtils;
import com.ruoyi.common.utils.ShiroUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import eu.bitwalker.useragentutils.UserAgent;

/**
 * 评论调用相关接口
 */
@Controller
@RequestMapping("/comment")
public class CommentController extends BaseController {
    @Autowired
    private CmsCommentServiceImpl cmsCommentService;

    @Autowired
    private OlyCommonService commonService;

    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addComment(CmsComment cmsComment) {
        if (supportReply()) {
            if (!cmsCommentService.getAllowCommentByArticleId(cmsComment.getArticleId())) {
                return AjaxResult.error("本文回复已关闭.");
            } else if (ShiroUtils.getUserId() == cmsComment.getReplyBy()) {
                return AjaxResult.error("不允许回复自己.");
            } else if (ShiroUtils.getUserId() == null) {
                return AjaxResult.error("请登录后进行操作.");
            } else {
                UserAgent userAgent = getUserAgent();
                String ip = ShiroUtils.getIp();
                cmsComment.setIp(ip);
                cmsComment.setFromBy(ShiroUtils.getUserId());
                cmsComment.setUserSystem(userAgent.getOperatingSystem().getName());
                cmsComment.setUserBower(userAgent.getBrowser().getName());
                return AjaxResult.success(cmsCommentService.insertCmsComment(cmsComment));
            }
        } else {
            return AjaxResult.error("全站禁止评论!");
        }
    }

    @GetMapping("/parentPage")
    @ResponseBody
    public AjaxResult listCommentOne(Long articleId) {
        startDefaultPage();
        PageData pageData = PageData.getData(cmsCommentService.listCommentPageOne(articleId));
        return AjaxResult.success(pageData);
    }
    
    @GetMapping("/childPage")
    @ResponseBody
    public AjaxResult listCommentTwo(Long parentId) {
        startDefaultPage();
        PageData pageData = PageData.getData(cmsCommentService.listCommentPageTwo(parentId));
        return AjaxResult.success(pageData);
    }

    private UserAgent getUserAgent() {
        return UserAgent.parseUserAgentString(ServletUtils.getRequest().getHeader("User-Agent"));
    }

    /**
     * 是否开启回复
     * 
     * @return
     */
    private boolean supportReply() {
        return "true".equals(commonService.selectConfigDefauleValue(OlyCommentProperties.COMMENT_OPEN));
    }


    /**
     * 是否开启邮件回复
     * 
     * @return
     */
    private boolean supportEmailReply() {
        return "true".equals(commonService.selectConfigDefauleValue(OlyCommentProperties.COMMENT_MAIL_RESTORE));
    }
}
