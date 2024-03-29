package com.oly.cms.comment.service;

import java.util.List;

import com.oly.cms.comment.model.CmsComment;
import com.oly.cms.comment.model.enums.CommentVisibleEnums;
import com.oly.cms.comment.model.vo.CmsCommentVo;

/**
 * <CmsCommentVo>
 * 评论Service接口
 * 
 * @author zd
 * @date 2022-07-06
 */
public interface ICmsCommentService {
    /**
     * 查询评论
     * 
     * @param id 评论主键
     * @return 评论
     */
    CmsCommentVo selectCmsCommentVoById(Long id);

    /**
     * 查询评论列表
     * 
     * @param cmsComment 评论
     * @return 评论集合
     */
    List<CmsCommentVo> listCmsCommentVo(CmsComment cmsComment);

    /**
     * 查询评论父级列表
     * 
     * @param cmsComment 评论
     * @return 评论集合
     */
    List<CmsCommentVo> listCmsCommentVoParent(CmsComment cmsCommentVo);

    /**
     * 查询评论子级列表
     * 
     * @param cmsComment 评论
     * @return 评论集合
     */
    List<CmsCommentVo> listCmsCommentVoChild(CmsComment cmsComment);

    /**
     * 新增评论
     * 
     * @param cmsComment 评论
     * @return 结果
     */
    int insertCmsComment(CmsComment cmsComment);

    /**
     * 修改评论
     * 
     * @param cmsComment 评论
     * @return 结果
     */
    int updateCmsComment(CmsComment cmsComment);

    /**
     * 批量更新评论状态
     * 
     * @param commentIds
     * @param commentVisibleEnums
     * @return
     */
    int updateCmsCommentVisible(String commentIds, CommentVisibleEnums commentVisibleEnums);

    /**
     * 批量删除评论
     * 
     * @param commentIds 需要删除的评论主键集合
     * @return 结果
     */
    int deleteCmsCommentByCommentIds(String commentIds);

    /**
     * 删除评论信息
     * 
     * @param commentId 评论主键
     * @return 结果
     */
    int deleteCmsCommentByCommentId(Long commentId);
}
