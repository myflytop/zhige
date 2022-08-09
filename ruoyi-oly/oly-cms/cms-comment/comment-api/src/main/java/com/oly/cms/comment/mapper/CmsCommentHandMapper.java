package com.oly.cms.comment.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.oly.cms.comment.model.CmsCommentHand;

/**
 * 评论记录Mapper接口
 * 
 * @author zd
 * @date 2022-07-06
 */
public interface CmsCommentHandMapper {
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
     * 删除评论记录
     * 
     * @param handId 评论记录主键
     * @return 结果
     */
    int deleteCmsCommentHandByHandId(Long handId);

    /**
     * 批量删除评论记录
     * 
     * @param commentIds 需要删除的数据主键集合
     * @return 结果
     */
    int deleteCmsCommentHandByHandIds(String[] handIds);

    /**
     * 删除评论记录
     * 
     * @param commentId 评论记录主键
     * @return 结果
     */
    int deleteCmsCommentHandByCommentId(Long commentId);

    int updateCmsCommentCountPlus(@Param("commentId") Long commentId, @Param("field") String field);

    int updateCmsCommentCountMinus(@Param("commentId") Long commentId, @Param("field") String field);
}
