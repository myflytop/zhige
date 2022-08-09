package com.oly.cms.comment.servie;

import java.util.List;

import com.oly.cms.comment.model.CmsCommentHand;

/**
 * 评论记录Service接口
 * 
 * @author zd
 * @date 2022-07-06
 */
public interface ICmsCommentHandService {
    /**
     * 查询评论记录
     * 
     * @param commentId 评论记录主键
     * @return 评论记录
     */
    CmsCommentHand selectCmsCommentHandByHandId(Long commentId);

    /**
     * 查询评论记录
     * 
     * @param cmsCommentHand 评论记录
     * @return 评论记录
     */
    CmsCommentHand selectCmsCommentHand(CmsCommentHand cmsCommentHand);

    /**
     * 查询评论记录列表
     * 
     * @param cmsCommentHand 评论记录
     * @return 评论记录集合
     */
    List<CmsCommentHand> listCmsCommentHand(CmsCommentHand cmsCommentHand);

    /**
     * 新增评论记录
     * 
     * @param cmsCommentHand 评论记录
     * @return 结果
     */
    int insertCmsCommentHand(CmsCommentHand cmsCommentHand);

    /**
     * 修改评论记录
     * 
     * @param cmsCommentHand 评论记录
     * @return 结果
     */
    int updateCmsCommentHand(CmsCommentHand cmsCommentHand);

    /**
     * 批量删除评论记录
     * 
     * @param handIds 需要删除的评论记录主键集合
     * @return 结果
     */
    int deleteCmsCommentHandByHandIds(String handIds);

    /**
     * 删除评论记录信息
     * 
     * @param handId 评论记录主键
     * @return 结果
     */
    int deleteCmsCommentHandByHandId(Long handId);
}
