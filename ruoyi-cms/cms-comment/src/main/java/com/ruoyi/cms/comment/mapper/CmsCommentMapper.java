package com.ruoyi.cms.comment.mapper;

import com.ruoyi.cms.comment.model.CmsComment;
import com.ruoyi.cms.comment.model.CmsCommentRecord;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CmsCommentMapper {

    /**
     * 查询评论
     * @param commentId 评论ID
     * @return 评论
     */
    CmsComment getCmsCommentById(Long commentId);

    /**
     * 查询评论列表
     *
     * @param cmsComment 评论
     * @return 评论集合
     */
   List<CmsComment> listCmsComment(CmsComment cmsComment);

    /**
     * 新增评论
     * @param cmsComment 评论
     * @return 结果
     */
    int insertCmsComment(CmsComment cmsComment);

    /**
     * 修改评论
     * @param cmsComment 评论
     * @return 结果
     */
    int updateCmsComment(CmsComment cmsComment);


    /**
     * 批量删除评论
     * @param commentIds 需要删除的数据ID
     * @return 结果
     */
    int deleteCmsCommentByIds(Long[] commentIds);

    /**
     * 通过父节点获取子节点
     * @param commentId
     * @return
     */
    List<CmsComment> listCmsCommentByParentId(Long commentId);

    /**
     * 批量修改评论状态
     * @param ids
     * @param fettle
     * @return
     */
    int updateCmsComments(@Param("ids") Long[] ids, @Param("fettle") Byte fettle);

    int deleteCmsCommentRecordsByIds(Long[] commentIds);

    int insertCmsCommentRecord(CmsCommentRecord cmsCommentRecord);

     List<CmsCommentRecord> listCmsCommentRecord(CmsCommentRecord cmsCommentRecord);
    /**
     * 检测用户是否记录过
     * @param cmsCommentRecord
     * @return
     */
    int checkCmsCommentRecord(CmsCommentRecord cmsCommentRecord);
}
