package com.oly.web.service.cache;

import java.util.List;

import com.github.pagehelper.PageHelper;
import com.oly.comment.model.CmsComment;
import com.oly.comment.model.properties.OlyCommentProperties;
import com.oly.comment.servie.impl.CmsCommentServiceImpl;
import com.oly.common.model.support.PageData;
import com.oly.web.service.search.BlogArticleServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;

@Service
@CacheConfig(cacheNames = "oly-web")
public class BlogCommentCacheService {

    @Autowired
    private CmsCommentServiceImpl cmsCommentService;

    @Autowired
    private BlogArticleServiceImpl articleSearch;

    @Autowired
    protected BlogConfigCacheService commonService;

    // 获取最新留言列表
    public List<CmsComment> listCommentParent() {
        PageHelper.startPage(1, 20, "create_time desc");
        return cmsCommentService.listCommentParent();
    }

    // 获取留言
    public CmsComment getCommentById(Long commentId) {
        return cmsCommentService.getCmsCommentById(commentId);
    }

    // 获取评论
    public PageData getCommentPostId(Long postId) {
        String allowCommentAll = commonService.getSysConfigDefauleValue(OlyCommentProperties.COMMENT_OPEN);
        boolean bb = articleSearch.allowComment(postId);
        if ("true".equals(allowCommentAll) && bb) {
            return PageData.getData(cmsCommentService.listCommentPageOne(postId));
        }
        return new PageData();
    }

}
