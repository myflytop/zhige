package com.oly.cms.comment.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oly.cms.comment.mapper.CmsCommentHandMapper;
import com.oly.cms.comment.model.CmsCommentHand;
import com.oly.cms.comment.model.enums.CommentCountFieldEnum;
import com.oly.cms.comment.model.enums.CommentHandVisibleEnums;
import com.oly.cms.comment.service.ICmsCommentHandService;
import com.ruoyi.common.core.text.Convert;

/**
 * 评论记录Service业务层处理
 * 
 * @author zd
 * @date 2022-07-06
 */
@Service
public class CmsCommentHandServiceImpl implements ICmsCommentHandService {
    @Autowired
    private CmsCommentHandMapper cmsCommentHandMapper;

    /**
     * 查询评论记录
     * 
     * @param commentId 评论记录主键
     * @return 评论记录
     */
    @Override
    public CmsCommentHand selectCmsCommentHandByHandId(Long commentId) {
        return cmsCommentHandMapper.selectCmsCommentHandByHandId(commentId);
    }

    /**
     * 查询评论记录列表
     * 
     * @param cmsCommentHand 评论记录
     * @return 评论记录
     */
    @Override
    public List<CmsCommentHand> listCmsCommentHand(CmsCommentHand cmsCommentHand) {
        return cmsCommentHandMapper.listCmsCommentHand(cmsCommentHand);
    }

    /**
     * 新增评论操作记录
     * 
     * @param cmsCommentHand 评论操作记录
     * @return 结果
     */
    @Override
    @Transactional
    public int insertCmsCommentHand(CmsCommentHand cmsCommentHand) {
        int re = cmsCommentHandMapper.insertCmsCommentHand(cmsCommentHand);
        if (cmsCommentHand.getVisible().intValue() == CommentHandVisibleEnums.LIKE.ordinal()) {
            cmsCommentHandMapper.updateCmsCommentCountPlus(cmsCommentHand.getCommentId(),
                    CommentCountFieldEnum.LIKE_COUNT.getValue());
        } else {
            cmsCommentHandMapper.updateCmsCommentCountPlus(cmsCommentHand.getCommentId(),
                    CommentCountFieldEnum.NASTY_COUNT.getValue());
        }
        return re;
    }

    /**
     * 修改评论记录
     * 
     * @param cmsCommentHand 评论记录
     * @return 结果
     */
    @Override
    @Transactional
    public int updateCmsCommentHand(CmsCommentHand cmsCommentHand) {
        int re = cmsCommentHandMapper.updateCmsCommentHand(cmsCommentHand);
        if (cmsCommentHand.getVisible().intValue() == CommentHandVisibleEnums.LIKE.ordinal()) {
            cmsCommentHandMapper.updateCmsCommentCountPlus(cmsCommentHand.getCommentId(),
                    CommentCountFieldEnum.LIKE_COUNT.getValue());
        } else if (cmsCommentHand.getVisible().intValue() == CommentHandVisibleEnums.NASTY.ordinal()) {
            cmsCommentHandMapper.updateCmsCommentCountPlus(cmsCommentHand.getCommentId(),
                    CommentCountFieldEnum.NASTY_COUNT.getValue());
        } else if (cmsCommentHand.getVisible().intValue() == CommentHandVisibleEnums.C_LIKE.ordinal()) {
            cmsCommentHandMapper.updateCmsCommentCountMinus(cmsCommentHand.getCommentId(),
                    CommentCountFieldEnum.LIKE_COUNT.getValue());
        } else {
            cmsCommentHandMapper.updateCmsCommentCountMinus(cmsCommentHand.getCommentId(),
                    CommentCountFieldEnum.NASTY_COUNT.getValue());
        }
        return re;
    }

    /**
     * 批量删除评论记录
     * 
     * @param handIds 需要删除的评论记录主键
     * @return 结果
     */
    @Override
    public int deleteCmsCommentHandByHandIds(String handIds) {
        return cmsCommentHandMapper.deleteCmsCommentHandByHandIds(Convert.toLongArray(handIds));
    }

    /**
     * 查询评论记录
     * 
     * @param cmsCommentHand 评论记录
     * @return 评论记录
     */
    @Override
    public CmsCommentHand selectCmsCommentHand(CmsCommentHand cmsCommentHand) {

        return cmsCommentHandMapper.selectCmsCommentHand(cmsCommentHand);
    }
}
