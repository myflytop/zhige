package com.oly.cms.comment.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oly.cms.comment.mapper.CmsCommentHandMapper;
import com.oly.cms.comment.mapper.CmsCommentMapper;
import com.oly.cms.comment.model.CmsComment;
import com.oly.cms.comment.model.enums.CommentTypeEnum;
import com.oly.cms.comment.model.enums.CommentVisibleEnums;
import com.oly.cms.comment.model.properties.OlyCommentProperties;
import com.oly.cms.comment.model.vo.CmsCommentVo;
import com.oly.cms.comment.service.ICmsCommentService;
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
    private CmsCommentHandMapper cmsCommentHandMapper;

    @Autowired
    private ApplicationEventPublisher app;

    /**
     * 查询评论
     * 
     * @param id 评论主键
     * @return 评论
     */
    @Override
    public CmsCommentVo selectCmsCommentVoById(Long id) {
        return cmsCommentMapper.selectCmsCommentById(id);
    }

    /**
     * 查询评论列表
     * 
     * @param cmsComment 评论
     * @return 评论
     */
    @Override
    public List<CmsCommentVo> listCmsCommentVo(CmsComment cmsComment) {
        return cmsCommentMapper.listCmsCommentVo(cmsComment);
    }

    /**
     * 新增评论
     * 
     * @param cmsComment 评论
     * @return 结果
     */
    @Override
    @Transactional
    public int insertCmsComment(CmsComment cmsComment) {
        String value = configService.selectConfigDefauleValue(OlyCommentProperties.COMMENT_CONFIG_GROUP.defaultValue(),
                OlyCommentProperties.COMMENT_DEFAULT_VISIBLE);
        cmsComment.setVisible(CommentVisibleEnums.valueOf(value).ordinal());
        int re = cmsCommentMapper.insertCmsComment(cmsComment);
        if (CommentVisibleEnums.PASS.name().equals(value)) {
            if (cmsComment.getCommentType() == CommentTypeEnum.ARTICLE.ordinal()) {
                cmsCommentMapper.updateCmsArticleCountByLook(Long.parseLong(cmsComment.getTypeId()));
            }
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
        Long[] ids = Convert.toLongArray(commentIds);
        int re = 0;
        for (long id : ids) {
            this.deleteCmsCommentByCommentId(id);
            re += 1;
        }
        return re;
    }

    /**
     * 删除评论信息
     * 
     * @param commentId 评论主键
     * @return 结果
     */
    @Override
    @Transactional
    public int deleteCmsCommentByCommentId(Long commentId) {
        cmsCommentHandMapper.deleteCmsCommentHandByCommentId(commentId);
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
        int re = cmsCommentMapper.updateCmsCommentVisible(Convert.toLongArray(commentIds),
                commentVisibleEnums.ordinal());
        for (Long id : Convert.toLongArray(commentIds)) {
            cmsCommentMapper.updateCmsArticleCountByLook(id);
        }
        app.publishEvent(new CacheWebRefreshAllEvent(this, CacheConstant.COMMENT_CACHE_KEY_PREFIX));
        return re;
    }

    @Override
    public List<CmsCommentVo> listCmsCommentVoParent(CmsComment cmsComment) {
        cmsComment.setParentId(0L);
        return this.listCmsCommentVo(cmsComment);
    }

    @Override
    public List<CmsCommentVo> listCmsCommentVoChild(CmsComment cmsComment) {
        if (cmsComment.getParentId() == null || cmsComment.getParentId() == 0L) {
            throw new ServiceException("父级ID不能为O或者空");
        }
        return this.listCmsCommentVo(cmsComment);
    }
}
