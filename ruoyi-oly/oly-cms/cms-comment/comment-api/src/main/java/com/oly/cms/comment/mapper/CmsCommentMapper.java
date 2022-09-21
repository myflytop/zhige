package com.oly.cms.comment.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.oly.cms.comment.model.CmsComment;
import com.oly.cms.comment.model.vo.CmsCommentVo;

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
   * @param id 评论主键
   * @return 评论
   */
  CmsCommentVo selectCmsCommentById(Long id);

  /**
   * 
   * @param cmsComment
   * @return
   */
  List<CmsCommentVo> listCmsCommentVo(CmsComment cmsComment);

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

}
