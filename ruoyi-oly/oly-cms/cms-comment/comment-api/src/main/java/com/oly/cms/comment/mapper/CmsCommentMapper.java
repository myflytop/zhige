package com.oly.cms.comment.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.oly.cms.comment.model.CmsComment;

/**
 * 评论Mapper接口
 * 
 * @author zd
 * @date 2022-07-06
 */
public interface CmsCommentMapper {
  /**
   * 查询评论
   * 
   * @param commentId 评论主键
   * @return 评论
   */
  CmsComment selectCmsCommentByCommentId(Long commentId);

  /**
   * 查询评论列表
   * 
   * @param cmsComment 评论
   * @return 评论集合
   */
  List<CmsComment> listCmsComment(CmsComment cmsComment);

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
   * @param visible
   * @return
   */
  public int updateCmsCommentVisible(@Param("commentIds") Long[] commentIds, @Param("visible") Integer visible);

  /**
   * 删除评论
   * 
   * @param commentId 评论主键
   * @return 结果
   */
  int deleteCmsCommentByCommentId(Long commentId);

  /**
   * 批量删除评论
   * 
   * @param commentIds 需要删除的数据主键集合
   * @return 结果
   */
  int deleteCmsCommentByCommentIds(Long[] commentIds);

}
