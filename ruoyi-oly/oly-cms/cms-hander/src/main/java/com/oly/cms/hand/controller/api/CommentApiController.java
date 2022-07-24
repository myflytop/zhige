package com.oly.cms.hand.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.oly.cms.hand.service.tadlib.CommentTag;
import com.ruoyi.common.core.domain.AjaxResult;

@CrossOrigin
@RestController
@RequestMapping("/api/comment")
public class CommentApiController {

    @Autowired
    private CommentTag commentTag;

    @GetMapping("/pageComment")
    public AjaxResult pageComment(String typeId, int pageNum, int pageSize) {
        return AjaxResult.success(commentTag.pageCommentByTypeId(typeId, pageNum, pageSize));
    }

    @GetMapping("/parentPage")
    public AjaxResult listCommentOne(String typeId, int pageNum, int pageSize) {
        return AjaxResult.success(commentTag.pageCommentByTypeId(typeId, pageNum, pageSize));
    }

    @GetMapping("/childPage")
    public AjaxResult listCommentTwo(long parentId, int pageNum, int pageSize) {
        return AjaxResult.success(commentTag.pageTwoCommentByParentId(parentId, pageNum, pageSize));
    }

}
