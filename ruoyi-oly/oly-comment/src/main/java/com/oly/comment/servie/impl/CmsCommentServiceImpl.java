package com.oly.comment.servie.impl;

import java.util.Iterator;
import java.util.List;

import com.github.pagehelper.PageHelper;
import com.oly.comment.mapper.CmsCommentMapper;
import com.oly.comment.model.CmsComment;
import com.oly.comment.model.CmsCommentRecord;
import com.oly.comment.model.properties.OlyCommentProperties;
import com.oly.comment.servie.ICmsCommentService;
import com.oly.common.model.properties.PropertyEnum;
import com.oly.common.model.support.PageData;
import com.oly.framework.web.service.OlyCommonService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CmsCommentServiceImpl implements ICmsCommentService {
    @Autowired
    private CmsCommentMapper cmsCommentMapper;
    @Autowired
    private OlyCommonService olyCommonService;

    /**
     * 添加评论
     * 
     * @param commentId 评论ID
     * @return
     */
    @Override
    public CmsComment getCmsCommentById(Long commentId) {
        return cmsCommentMapper.getCmsCommentById(commentId);
    }

    /**
     * 获取评论
     * 
     * @param cmsComment 评论
     * @return
     */
    @Override
    public List<CmsComment> listCmsComment(CmsComment cmsComment) {
        return cmsCommentMapper.listCmsComment(cmsComment);
    }

    /**
     *
     * @param cmsComment 评论
     * @return
     */
    @Override
    public int insertCmsComment(CmsComment cmsComment) {
        cmsComment.setFettle((byte) PropertyEnum.convertTo(
                olyCommonService.selectConfigDefauleValue(OlyCommentProperties.COMMENT_DEFAULT_VISIBLE),
                OlyCommentProperties.COMMENT_DEFAULT_VISIBLE));
        return cmsCommentMapper.insertCmsComment(cmsComment);
    }

    @Transactional
    @Override
    public int deleteCmsCommentByIds(Long[] commentIds) {
        cmsCommentMapper.deleteCmsCommentRecordsByIds(commentIds);
        return cmsCommentMapper.deleteCmsCommentByIds(commentIds);
    }

    @Override
    public int updateCmsComments(Long[] ids, Byte visible) {
        return cmsCommentMapper.updateCmsComments(ids, visible);
    }

    /**
     * 检查回复记录是否已经插入
     * 
     * @param cmsCommentRecord
     * @return
     */
    @Override
    public int insertCmsCommentRecord(CmsCommentRecord cmsCommentRecord) {
        if (cmsCommentMapper.checkCmsCommentRecord(cmsCommentRecord) == 0) {
            return 0;
        }
        return cmsCommentMapper.insertCmsCommentRecord(cmsCommentRecord);
    }

    @Override
    public List<CmsCommentRecord> listCmsCommentRecord(CmsCommentRecord cmsCommentRecord) {
        return cmsCommentMapper.listCmsCommentRecord(cmsCommentRecord);
    }

    @Override
    public boolean getAllowCommentByArticleId(Long articleId) {
        return cmsCommentMapper.getAllowCommentByArticleId(articleId);
    }

    @Override
    public List<CmsComment> listCommentPageOne(Long articleId) {
        List<CmsComment> cmsCommentList = cmsCommentMapper.listCmsCommentPageOne(articleId);
        Iterator<CmsComment> itf = cmsCommentList.iterator();
        while (itf.hasNext()) {
            // 获取二级评论
            canventTwoCommentNumOne((CmsComment) itf.next());
        }
        return cmsCommentList;
    }

    @Override
    public List<CmsComment> listCommentPageTwo(Long parentId) {
        List<CmsComment> cmsCommentList = cmsCommentMapper.listCmsCommentByParentId(parentId);
        return cmsCommentList;
    }

    @Override
    public List<CmsComment> listCommentParent() {
        return cmsCommentMapper.listCommentParent();
    }

    /* 封装二级评论展示10条 */
    private void canventTwoCommentNumOne(CmsComment cmsComment) {
        PageHelper.startPage(1, 20);
        cmsComment.setChildrenPageData(
                PageData.getData(cmsCommentMapper.listCmsCommentByParentId(cmsComment.getCommentId())));
    }

}
