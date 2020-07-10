package com.ruoyi.cms.comment.web;

import com.ruoyi.cms.comment.model.CmsComment;
import com.ruoyi.cms.comment.model.CmsCommentRecord;
import com.ruoyi.cms.comment.servie.impl.CmsCommentServiceImpl;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.ServletUtils;
import com.ruoyi.framework.util.ShiroUtils;
import eu.bitwalker.useragentutils.UserAgent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 评论调用相关接口
 */
@Controller
@RequestMapping("/comment")
public class CommentController {
    @Autowired
    private CmsCommentServiceImpl cmsCommentService;
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addComment(CmsComment cmsComment){

        if(ShiroUtils.getUserId()==cmsComment.getReplyBy())
        {
            return AjaxResult.error("不允许回复自己");
        }
        else {
            UserAgent userAgent = getUserAgent();
            String ip = ShiroUtils.getIp();
            cmsComment.setIp(ip);
            cmsComment.setFromBy(ShiroUtils.getUserId());
            cmsComment.setUserSystem(userAgent.getOperatingSystem().getName());
            cmsComment.setUserBower(userAgent.getBrowser().getName());
            return AjaxResult.success(cmsCommentService.insertCmsComment(cmsComment));
        }
    }

    @GetMapping("/list")
    @ResponseBody
    public AjaxResult listComment(CmsComment cmsComment){

        return AjaxResult.success(cmsCommentService.listCmsComment(cmsComment));
    }


    @PostMapping("/addRecord")
    @ResponseBody
    public AjaxResult addCommentRecord(CmsCommentRecord cmsCommentRecord){
        UserAgent userAgent=getUserAgent();
        String ip = ShiroUtils.getIp();
        cmsCommentRecord.setIp(ip);
        cmsCommentRecord.setUserId(ShiroUtils.getUserId());
        cmsCommentRecord.setUserSystem(userAgent.getOperatingSystem().getName());
        cmsCommentRecord.setUserBower(userAgent.getBrowser().getName());
        return AjaxResult.success(cmsCommentService.insertCmsCommentRecord(cmsCommentRecord));
    }
   private UserAgent getUserAgent(){
    return UserAgent.parseUserAgentString(ServletUtils.getRequest().getHeader("User-Agent"));
   }
}
