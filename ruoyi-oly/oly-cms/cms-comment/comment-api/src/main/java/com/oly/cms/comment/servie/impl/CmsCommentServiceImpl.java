package com.oly.cms.comment.servie.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.stereotype.Service;

import com.oly.cms.comment.mapper.CmsCommentMapper;
import com.oly.cms.comment.model.CmsComment;
import com.oly.cms.comment.model.enums.CommentVisibleEnums;
import com.oly.cms.comment.model.properties.OlyCommentProperties;
import com.oly.cms.comment.servie.ICmsCommentService;
import com.oly.cms.common.constant.CacheConstant;
import com.oly.cms.common.event.CacheWebRefreshAllEvent;
import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.system.config.service.ISysConfigService;

/**
 * 评论Service业务层处理
 * 
 * @author zd
 * @date 2022-07-06
 */
@Service
public class CmsCommentServiceImpl implements ICmsCommentService {
    @Autowired
    private CmsCommentMapper cmsCommentMapper;

    @Autowired
    private ISysConfigService configService;

    @Autowired
    private ApplicationEventPublisher app;

    /**
     * 查询评论
     * 
     * @param commentId 评论主键
     * @return 评论
     */
    @Override
    public CmsComment selectCmsCommentByCommentId(Long commentId) {
        return cmsCommentMapper.selectCmsCommentByCommentId(commentId);
    }

    /**
     * 查询评论列表
     * 
     * @param cmsComment 评论
     * @return 评论
     */
    @Override
    public List<CmsComment> listCmsComment(CmsComment cmsComment) {
        return cmsCommentMapper.listCmsComment(cmsComment);
    }

    /**
     * 新增评论
     * 
     * @param cmsComment 评论
     * @return 结果
     */
    @Override
    public int insertCmsComment(CmsComment cmsComment) {
        String value = configService.selectConfigDefauleValue(OlyCommentProperties.COMMENT_CONFIG_GROUP.defaultValue(),
                OlyCommentProperties.COMMENT_DEFAULT_VISIBLE);
        cmsComment.setVisible(CommentVisibleEnums.valueOf(value).ordinal());
        int re = cmsCommentMapper.insertCmsComment(cmsComment);
        if (CommentVisibleEnums.PASS.name().equals(value)) {
            app.publishEvent(new CacheWebRefreshAllEvent(this, CacheConstant.COMMENT_CACHE_KEY_PREFIX));
        }
        return re;
    }

    /**
     * 修改评论
     * 
     * @param cmsComment 评论
     * @return 结果
     */
    @Override
    public int updateCmsComment(CmsComment cmsComment) {
        int re = cmsCommentMapper.updateCmsComment(cmsComment);
        app.publishEvent(new CacheWebRefreshAllEvent(this, CacheConstant.COMMENT_CACHE_KEY_PREFIX));
        return re;
    }

    /**
     * 批量删除评论
     * 
     * @param commentIds 需要删除的评论主键
     * @return 结果
     */
    @Override
    public int deleteCmsCommentByCommentIds(String commentIds) {
        return cmsCommentMapper.deleteCmsCommentByCommentIds(Convert.toLongArray(commentIds));
    }

    /**
     * 删除评论信息
     * 
     * @param commentId 评论主键
     * @return 结果
     */
    @Override
    public int deleteCmsCommentByCommentId(Long commentId) {
        return cmsCommentMapper.deleteCmsCommentByCommentId(commentId);
    }

    /**
     * 批量更新评论状态
     * 
     * @param commentIds
     * @param commentVisibleEnums
     * @return
     */
    @Override
    public int updateCmsCommentVisible(String commentIds, CommentVisibleEnums commentVisibleEnums) {
        return cmsCommentMapper.updateCmsCommentVisible(Convert.toLongArray(commentIds), commentVisibleEnums.ordinal());
    }

    @Override
    public List<CmsComment> listCmsCommentParent(CmsComment cmsComment) {
        cmsComment.setParentId(0L);
        return this.listCmsComment(cmsComment);
    }

    @Override
    public List<CmsComment> listCmsCommentChild(CmsComment cmsComment) {
        if (cmsComment.getParentId() == null || cmsComment.getParentId() == 0L) {
            throw new ServiceException("父级ID不能为O或者空");
        }
        return this.listCmsComment(cmsComment);
    }
}
