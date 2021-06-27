package com.oly.comment.servie;

import com.oly.comment.model.CmsComment;
import com.oly.comment.model.CmsCommentRecord;
import java.util.List;

public interface ICmsCommentService {
    /**
     * 查询评论
     * 
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
     * 新增评论
     * 
     * @param cmsComment 评论
     * @return 结果
     */
    int insertCmsComment(CmsComment cmsComment);

    /**
     * 批量删除评论
     * 
     * @param commentIds 需要删除的数据ID
     * @return 结果
     */
    int deleteCmsCommentByIds(Long[] commentIds);

    List<CmsComment> listCommentParent();

    /**
     * 批量更新
     * 
     * @param ids
     * @param fettle
     * @return
     */
    int updateCmsComments(Long[] ids, Byte fettle);

    /**
     * 插入评论操作
     * 
     * @param cmsCommentRecord
     * @return
     */
    int insertCmsCommentRecord(CmsCommentRecord cmsCommentRecord);

    List<CmsCommentRecord> listCmsCommentRecord(CmsCommentRecord cmsCommentRecord);

    List<CmsComment> listCommentPageOne(Long articleId);

    List<CmsComment> listCommentPageTwo(Long parentId);

    boolean getAllowCommentByArticleId(Long articleId);

}
