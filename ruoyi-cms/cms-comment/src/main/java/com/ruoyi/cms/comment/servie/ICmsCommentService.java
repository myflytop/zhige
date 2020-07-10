package com.ruoyi.cms.comment.servie;

import com.ruoyi.cms.comment.model.CmsComment;
import com.ruoyi.cms.comment.model.CmsCommentRecord;
import com.ruoyi.cms.common.mould.support.PageData;

import java.util.List;

public interface ICmsCommentService {
    /**
     * 查询评论
     * @param commentId 评论ID
     * @return 评论
     */
    public CmsComment getCmsCommentById(Long commentId);

    /**
     * 查询评论列表
     *
     * @param cmsComment 评论
     * @return 评论集合
     */
    public List<CmsComment> listCmsComment(CmsComment cmsComment);

    /**
     * 查询父级别评论列表
     *
     * @param cmsComment 评论
     * @return 评论集合
     */
    List<CmsComment> listParentCmsComment(CmsComment cmsComment);

    /**
     * 评论分页
     *
     * @param cmsComment 评论
     * @return 评论集合
     */
     PageData listCmsCommentPage(CmsComment cmsComment);


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
     * 批量更新
     * @param ids
     * @param fettle
     * @return
     */
    int updateCmsComments(Long[] ids, Byte fettle);

    /**
     * 插入评论支持反对
     * @param cmsCommentRecord
     * @return
     */
    int insertCmsCommentRecord(CmsCommentRecord cmsCommentRecord);
    List<CmsCommentRecord> listCmsCommentRecord(CmsCommentRecord cmsCommentRecord);


}
