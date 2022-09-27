package com.oly.cms.hand.controller;

import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.oly.cms.comment.model.CmsComment;
import com.oly.cms.comment.model.CmsCommentHand;
import com.oly.cms.comment.model.enums.CommentHandVisibleEnums;
import com.oly.cms.comment.model.enums.CommentTypeEnum;
import com.oly.cms.comment.model.enums.CommentVisibleEnums;
import com.oly.cms.comment.model.vo.CmsCommentVo;
import com.oly.cms.comment.service.impl.CmsCommentHandServiceImpl;
import com.oly.cms.comment.service.impl.CmsCommentServiceImpl;
import com.oly.cms.general.annotation.WebLog;
import com.oly.cms.general.model.enums.WebBusinessType;
import com.oly.cms.general.model.enums.WebLogType;
import com.oly.cms.general.taglib.ArticleTag;
import com.oly.cms.hand.service.tadlib.CommentTag;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.ServletUtils;
import com.ruoyi.common.utils.ShiroUtils;
import eu.bitwalker.useragentutils.UserAgent;

/**
 * 评论控制
 */
@RestController
@RequestMapping("/web/hand/comment")
public class CommentHandController {

    @Autowired
    private CmsCommentServiceImpl cmsCommentService;

    @Autowired
    private CmsCommentHandServiceImpl cmsCommentHandService;

    @Autowired
    private CommentTag commentTag;

    @Autowired
    private ArticleTag articleTag;

    /**
     * 添加评论
     * 
     * @param cmsComment
     * @return
     */

    @PostMapping("/addComment")
    @WebLog(title = "添加评论", logType = WebLogType.COMMENT, businessType = WebBusinessType.UPDATE)
    @RequiresAuthentication
    public AjaxResult addComment(CmsComment cmsComment, CommentTypeEnum type) {
        if (commentTag.commentSupport(type)) {
            switch (type) {
                case ARTICLE:
                    if (!articleTag.checkArticleSupportComment(cmsComment.getTypeId())) {
                        return AjaxResult.error("评论已关闭.");
                    }
                    break;
                case SITE:

                    break;
                case LINKS:

                    break;
            }
            if (ShiroUtils.getUserId() == cmsComment.getReplyBy()) {
                return AjaxResult.error("不允许回复自己.");
            } else if (ShiroUtils.getUserId() == null) {
                return AjaxResult.error("请登录后进行操作.");
            } else {
                UserAgent userAgent = getUserAgent();
                String ip = ShiroUtils.getIp();
                cmsComment.setIp(ip);
                cmsComment.setCommentType(type.ordinal());
                cmsComment.setFromBy(ShiroUtils.getUserId());
                cmsComment.setUserSystem(userAgent.getOperatingSystem().getName());
                cmsComment.setUserBower(userAgent.getBrowser().getName());
                return AjaxResult.success(cmsCommentService.insertCmsComment(cmsComment));
            }
        } else {
            return AjaxResult.error("全站禁止评论!");
        }
    }

    /**
     * 点赞|取消点赞
     * 
     * @param commentId
     * @param visibleEnums
     * @return
     */
    @RequiresAuthentication
    @WebLog(title = "评论赞成", logType = WebLogType.COMMENT, businessType = WebBusinessType.UPDATE)
    @PostMapping("/addCommentLike")
    public AjaxResult addCommentLike(long commentId) {
        CmsComment comment = cmsCommentService.selectCmsCommentVoById(commentId);
        if (comment == null || comment.getVisible().intValue() != CommentVisibleEnums.PASS.ordinal()) {
            return AjaxResult.error("操作节点不存在或者不存在");
        }
        CmsCommentHand cmsCommentHand = new CmsCommentHand();
        cmsCommentHand.setCommentId(commentId);
        cmsCommentHand.setUserId(ShiroUtils.getUserId());
        CmsCommentHand aHand = cmsCommentHandService.selectCmsCommentHand(cmsCommentHand);
        if (aHand == null) {
            aHand = new CmsCommentHand();
            aHand.setTypeId(comment.getTypeId());
            aHand.setUserId(ShiroUtils.getUserId());
            aHand.setCommentId(commentId);
            aHand.setVisible(CommentHandVisibleEnums.LIKE.ordinal());
            setHand(aHand);
            return AjaxResult.success(cmsCommentHandService.insertCmsCommentHand(aHand));
        } else {
            int vvl = aHand.getVisible().intValue();
            if (vvl == CommentHandVisibleEnums.LIKE.ordinal()) {
                aHand.setVisible(CommentHandVisibleEnums.C_LIKE.ordinal());
            } else if (vvl == CommentHandVisibleEnums.NASTY.ordinal()) {
                return AjaxResult.error("不允许同时赞和踩");
            } else {
                aHand.setVisible(CommentHandVisibleEnums.LIKE.ordinal());
            }
            setHand(aHand);
            cmsCommentHandService.updateCmsCommentHand(aHand);
            return AjaxResult.success(aHand);
        }
    }

    /**
     * 反对|取消反对
     * 
     * @param commentId
     * @param visibleEnums
     * @return
     */
    @RequiresAuthentication
    @WebLog(title = "评论反对", logType = WebLogType.COMMENT, businessType = WebBusinessType.UPDATE)
    @PostMapping("/addCommentNasty")
    public AjaxResult addCommentNasty(long commentId) {
        CmsCommentVo comment = cmsCommentService.selectCmsCommentVoById(commentId);
        if (comment == null || comment.getVisible().intValue() != CommentVisibleEnums.PASS.ordinal()) {
            return AjaxResult.error("操作节点不存在或者不存在");
        }
        CmsCommentHand cmsCommentHand = new CmsCommentHand();
        cmsCommentHand.setCommentId(commentId);
        cmsCommentHand.setUserId(ShiroUtils.getUserId());
        CmsCommentHand aHand = cmsCommentHandService.selectCmsCommentHand(cmsCommentHand);
        if (aHand == null) {
            aHand = new CmsCommentHand();
            aHand.setUserId(ShiroUtils.getUserId());
            aHand.setCommentId(commentId);
            aHand.setTypeId(comment.getTypeId());
            aHand.setVisible(CommentHandVisibleEnums.NASTY.ordinal());
            setHand(aHand);
            return AjaxResult.success(cmsCommentHandService.insertCmsCommentHand(aHand));
        } else {
            int vvl = aHand.getVisible().intValue();
            if (vvl == CommentHandVisibleEnums.NASTY.ordinal()) {
                aHand.setVisible(CommentHandVisibleEnums.C_NASTY.ordinal());
            } else if (vvl == CommentHandVisibleEnums.LIKE.ordinal()) {
                return AjaxResult.error("不允许同时赞和踩");
            } else {
                aHand.setVisible(CommentHandVisibleEnums.NASTY.ordinal());
            }
            setHand(aHand);
            return AjaxResult.success(cmsCommentHandService.updateCmsCommentHand(aHand));
        }
    }

    @RequiresAuthentication
    @PostMapping("/selectCommentHand")
    public AjaxResult selectCommentHand(long commentId) {
        CmsCommentHand cmsCommentHand = new CmsCommentHand();
        cmsCommentHand.setCommentId(commentId);
        cmsCommentHand.setUserId(ShiroUtils.getUserId());
        return AjaxResult.success(cmsCommentHandService.selectCmsCommentHand(cmsCommentHand));
    }

    @RequiresAuthentication
    @GetMapping("/listCommentHandByTypeId/{typeId}")
    public AjaxResult listCommentHand(@PathVariable("typeId") String typeId) {
        CmsCommentHand cmsCommentHand = new CmsCommentHand();
        cmsCommentHand.setTypeId(typeId);
        cmsCommentHand.setUserId(ShiroUtils.getUserId());
        return AjaxResult.success(cmsCommentHandService.listCmsCommentHand(cmsCommentHand));
    }

    private UserAgent getUserAgent() {
        return UserAgent.parseUserAgentString(ServletUtils.getRequest().getHeader("User-Agent"));
    }

    void addComment() {

    }

    void addNasty() {

    }

    void addLike() {

    }

    private void setHand(CmsCommentHand commentHand) {
        UserAgent userAgent = getUserAgent();
        String ip = ShiroUtils.getIp();
        commentHand.setIp(ip);
        commentHand.setUserSystem(userAgent.getOperatingSystem().getName());
        commentHand.setUserBower(userAgent.getBrowser().getName());
    }

}
