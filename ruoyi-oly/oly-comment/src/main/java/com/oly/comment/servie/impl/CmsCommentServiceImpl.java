package com.oly.comment.servie.impl;

import java.util.Iterator;
import java.util.List;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.util.StringUtil;
import com.oly.comment.mapper.CmsCommentMapper;
import com.oly.comment.model.CmsComment;
import com.oly.comment.model.CmsCommentRecord;
import com.oly.comment.model.CommentConstants;
import com.oly.comment.servie.ICmsCommentService;
import com.oly.common.model.properties.OlyCommentProperties;
import com.oly.common.model.support.PageData;
import com.oly.framework.web.service.OlyCommonService;
import com.ruoyi.common.core.page.PageDomain;
import com.ruoyi.common.core.page.TableSupport;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.sql.SqlUtil;

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
     * 二级树请求封装
     * 
     * @param cmsComment 评论
     * @return
     */
    @Override
    public List<CmsComment> listParentCmsComment(CmsComment cmsComment) {
        cmsComment.setParentId(0l);
        List<CmsComment> cmsCommentList = cmsCommentMapper.listCmsComment(cmsComment);
        Iterator itf = cmsCommentList.iterator();
        while (itf.hasNext()) {
            // 获取二级评论
            canventCmsComment((CmsComment) itf.next());
        }
        return cmsCommentList;
    }

    @Override
    public PageData listCmsCommentPage(CmsComment cmsComment) {

        startPageOne(olyCommonService.selectConfigDefauleValue(OlyCommentProperties.COMMENT_ONE_SIZE),
                olyCommonService.selectConfigDefauleValue(OlyCommentProperties.COMMENT_ORDER_BY),
                olyCommonService.selectConfigDefauleValue(OlyCommentProperties.COMMENT_ORDER));
        List<CmsComment> cmsCommentList = cmsCommentMapper.listCmsComment(cmsComment);
        Iterator itf = cmsCommentList.iterator();
        while (itf.hasNext()) {
            // 获取二级评论
            canventCmsComment((CmsComment) itf.next());
        }
        PageData pageData = PageData.getData(cmsCommentList);
        return pageData;
    }

    /**
     *
     * @param cmsComment 评论
     * @return
     */
    @Override
    public int insertCmsComment(CmsComment cmsComment) {

        return cmsCommentMapper.insertCmsComment(cmsComment);
    }

    @Override
    public int updateCmsComment(CmsComment cmsComment) {
        return cmsCommentMapper.updateCmsComment(cmsComment);
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
     * 检查是否插入
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

    /* 封装二级评论展示10条 */
    private void canventCmsComment(CmsComment cmsComment) {
        startPageTwo();
        cmsComment.setChildrenPageData(
                PageData.getData(cmsCommentMapper.listCmsCommentByParentId(cmsComment.getCommentId())));
    }

    /* 请求第一页二级评论封装 */
    /**
     * 设置请求分页数据
     */
    private void startPageTwo() {
        PageDomain pageDomain = TableSupport.getPageDomain("", CommentConstants.PAGE_TWO_SIZE,
                CommentConstants.ORDER_BY_COLUMN, CommentConstants.IS_ASC);
        Integer pageSize = pageDomain.getPageSize() == null
                ? Integer.parseInt(olyCommonService.selectConfigDefauleValue(OlyCommentProperties.COMMENT_TWO_SIZE))
                : pageDomain.getPageSize();
        String orderByColumn = pageDomain.getOrderByColumn() == null
                ? olyCommonService.selectConfigDefauleValue(OlyCommentProperties.COMMENT_ORDER_BY)
                : pageDomain.getOrderByColumn();
        String isAsc = pageDomain.getIsAsc() == null
                ? olyCommonService.selectConfigDefauleValue(OlyCommentProperties.COMMENT_ORDER)
                : pageDomain.getIsAsc();
        if (StringUtils.isNotNull(pageSize)) {
            String orderBy = "";
            if (StringUtil.isNotEmpty(orderByColumn) && StringUtil.isNotEmpty(isAsc)) {
                SqlUtil.escapeOrderBySql(pageDomain.getOrderBy());
            }
            PageHelper.startPage(1, pageSize, orderBy);
        }
    }

    /**
     *
     * @param sizeString
     * @param orderString
     * @param ascString
     */
    private void startPageOne(String sizeString, String orderString, String ascString) {
        PageDomain pageDomain = TableSupport.buildPageRequest();
        Integer pageNum = pageDomain.getPageNum() == null ? 1 : pageDomain.getPageNum();
        Integer pageSize = pageDomain.getPageSize() == null ? Integer.parseInt(sizeString) : pageDomain.getPageSize();
        if ("".equals(pageDomain.getOrderBy())) {
            pageDomain.setIsAsc(ascString);
            pageDomain.setOrderByColumn(orderString);
        }
        if (StringUtils.isNotNull(pageNum) && StringUtils.isNotNull(pageSize)) {
            String orderBy = SqlUtil.escapeOrderBySql(pageDomain.getOrderBy());
            PageHelper.startPage(pageNum, pageSize, orderBy);
        }

    }

}
