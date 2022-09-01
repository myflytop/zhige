package com.oly.cms.hand.service.cache;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.oly.cms.comment.model.CmsComment;
import com.oly.cms.comment.model.enums.CommentTypeEnum;
import com.oly.cms.common.constant.CacheConstant;
import com.oly.cms.common.model.support.PageData;
import com.oly.cms.hand.service.impl.HandCommentServiceImpl;

@Service
@CacheConfig(cacheNames = CacheConstant.COMMENT_CACHE_KEY_PREFIX)
public class HandCommentCacheService {

    @Autowired
    private HandCommentServiceImpl commentService;

    @Cacheable(keyGenerator = "myKeyGenerator")
    public List<CmsComment> listCommentByTypeId(String typeId, int pageNum, int pageSize) {
        return commentService.listCommentByTypeId(typeId, pageNum, pageSize);
    }

    @Cacheable(keyGenerator = "myKeyGenerator")
    public List<CmsComment> listCommentOneByTypeId(String typeId, int pageNum, int pageSize) {
        return commentService.listCommentOneByTypeId(typeId, pageNum, pageSize);
    }

    @Cacheable(keyGenerator = "myKeyGenerator")
    public List<CmsComment> listCommentTwoByParentId(long parentId, int pageNum, int pageSize) {
        return commentService.listCommentTwoByParentId(parentId, pageNum, pageSize);
    }

    @Cacheable(keyGenerator = "myKeyGenerator")
    public PageData pageCommentByTypeId(String typeId, int pageNum, int pageSize) {
        return commentService.pageCommentByTypeId(typeId, pageNum, pageSize);
    }

    @Cacheable(keyGenerator = "myKeyGenerator")
    public PageData pageOneCommentByTypeId(String typeId, int pageNum, int pageSize) {
        return commentService.pageCommentByTypeId(typeId, pageNum, pageSize);
    }

    @Cacheable(keyGenerator = "myKeyGenerator")
    public PageData pageTwoCommentByParentId(long parentId, int pageNum, int pageSize) {
        return commentService.pageTwoCommentByParentId(parentId, pageNum, pageSize);
    }

    @Cacheable(keyGenerator = "myKeyGenerator")
    public List<CmsComment> recentlyComment(int commentType, int pageNum, int pageSize) {
        return commentService.recentlyComment(commentType, pageNum, pageSize);
    }

    public boolean commentSupport(CommentTypeEnum commentTypeEnum) {
        return commentService.commentSupport(commentTypeEnum);
    }

}
