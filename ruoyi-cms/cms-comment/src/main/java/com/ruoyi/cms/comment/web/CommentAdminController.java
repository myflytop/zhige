package com.ruoyi.cms.comment.web;

import com.ruoyi.cms.comment.model.CmsComment;
import com.ruoyi.cms.comment.servie.impl.CmsCommentServiceImpl;
import com.ruoyi.cms.common.web.controller.CommonController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.text.Convert;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import java.util.List;

/**
 * 评论管理
 */
@Controller
@RequestMapping("/cms/comment")
public class CommentAdminController extends CommonController {
    @Autowired
    private CmsCommentServiceImpl cmsCommentService;

    private final  String prefix = "cms/comment";

    @GetMapping
    private String comment(){

        return prefix+"/comment";
    }


    @RequiresPermissions("cms:comment:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(CmsComment cmsComment)
    {
        startPage();
        List<CmsComment> list =cmsCommentService.listCmsComment(cmsComment);
        return getDataTable(list);
    }

    /**
     * 评论审核
     * @param ids
     * @return
     */
    @PostMapping("/updateCommentFettle")
    @ResponseBody
    public AjaxResult updateCommentFettle(String ids,Byte fettle ) {
        Long[] commentIds = Convert.toLongArray(ids);
        if (0>fettle||fettle>5)
        {
            return AjaxResult.error("参数错误");
        }
        return toAjax(cmsCommentService.updateCmsComments(commentIds,fettle));
    }


    /**
     * 批量删除文章
     * @param ids
     * @return
     */
    @PostMapping("/deleteCmsCommentByIds")
    @ResponseBody
    public AjaxResult deleteCmsCommentByIds(String ids ) {
        Long[] commentIds= Convert.toLongArray(ids);
        return toAjax(cmsCommentService.deleteCmsCommentByIds(commentIds));
    }





}
