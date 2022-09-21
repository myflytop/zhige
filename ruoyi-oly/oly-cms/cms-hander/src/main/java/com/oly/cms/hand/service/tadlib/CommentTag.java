package com.oly.cms.hand.service.tadlib;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oly.cms.comment.model.enums.CommentTypeEnum;
import com.oly.cms.comment.model.vo.CmsCommentVo;
import com.oly.cms.common.model.support.PageData;
import com.oly.cms.hand.service.cache.HandCommentCacheService;

@Service("commentTag")
public class CommentTag {

    @Autowired
    private HandCommentCacheService webCommentCacheService;

    public List<CmsCommentVo> listComment() {

        return null;
    }

    public List<CmsCommentVo> recentlyComment(int commentType, int pageNum, int pageSize) {

        return webCommentCacheService.recentlyComment(commentType, pageNum, pageSize);
    }

    public List<CmsCommentVo> listCommentByTypeId(String typeId, int pageNum, int pageSize) {
        return webCommentCacheService.listCommentByTypeId(typeId, pageNum, pageSize);
    }

    public List<CmsCommentVo> listCommentTypeId(String typeId, int pageNum, int pageSize) {
        return webCommentCacheService.listCommentOneByTypeId(typeId, pageNum, pageSize);
    }

    List<CmsCommentVo> listCommentByParentId(long parentId, int pageNum, int pageSize) {
        return webCommentCacheService.listCommentTwoByParentId(parentId, pageNum, pageSize);
    }

    public PageData pageCommentByTypeId(String typeId, int pageNum, int pageSize) {
        return webCommentCacheService.pageCommentByTypeId(typeId, pageNum, pageSize);
    }

    public PageData pageOneCommentByTypeId(String typeId, int pageNum, int pageSize) {
        return webCommentCacheService.pageCommentByTypeId(typeId, pageNum, pageSize);
    }

    public PageData pageTwoCommentByParentId(long parentId, int pageNum, int pageSize) {
        return webCommentCacheService.pageTwoCommentByParentId(parentId, pageNum, pageSize);
    }

    /**
     * 验证对应类型全局评论是否打开
     * 
     * @param commentTypeEnum
     * @return
     */
    public boolean commentSupport(CommentTypeEnum commentTypeEnum) {
        return webCommentCacheService.commentSupport(commentTypeEnum);
    }

}
