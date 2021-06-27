package com.oly.web.taglib;

import java.util.List;

import com.oly.comment.model.CmsComment;
import com.oly.common.model.support.PageData;
import com.oly.web.service.cache.BlogCommentCacheService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
//评论标签
@Service("commentTag")
public class CommentTag {

    @Autowired
    private BlogCommentCacheService cs;

    // 获取最新留言列表
    public List<CmsComment> listComment() {
        return cs.listCommentParent();
    }

    // 获取留言
    public PageData listPageCommentById(Long postId) {
        return cs.getCommentPostId(postId);
    }

}
