package com.ruoyi.cms.comment.servie.impl;

import com.github.pagehelper.PageHelper;

import com.github.pagehelper.util.StringUtil;
import com.ruoyi.cms.comment.mapper.CmsCommentMapper;
import com.ruoyi.cms.comment.model.CmsComment;
import com.ruoyi.cms.comment.model.CmsCommentRecord;
import com.ruoyi.cms.comment.model.CommentConstants;
import com.ruoyi.cms.comment.model.enums.CommentPreifxEnum;
import com.ruoyi.cms.comment.servie.ICmsCommentService;
import com.ruoyi.cms.common.mould.support.PageData;
import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.core.page.PageDomain;
import com.ruoyi.common.core.page.TableSupport;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.sql.SqlUtil;
import com.ruoyi.system.domain.SysConfig;
import com.ruoyi.system.service.impl.SysConfigServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

@Service
public class CmsCommentServiceImpl implements ICmsCommentService {
    @Autowired
    private CmsCommentMapper cmsCommentMapper;
    @Autowired
    private SysConfigServiceImpl sysConfigService;

    /**
     * 添加评论
     * @param commentId 评论ID
     * @return
     */
    @Override
    public CmsComment getCmsCommentById(Long commentId) {
        return cmsCommentMapper.getCmsCommentById(commentId);
    }

    /**
     * 获取评论
     * @param cmsComment 评论
     * @return
     */
    @Override
    public List<CmsComment> listCmsComment(CmsComment cmsComment) {
     return cmsCommentMapper.listCmsComment(cmsComment);
    }

    /**
     * 二级树请求封装
     * @param cmsComment 评论
     * @return
     */
    @Override
    public List<CmsComment> listParentCmsComment(CmsComment cmsComment) {
        Map<String, SysConfig> configList=sysConfigService.selectConfigMap(CommentPreifxEnum.COMMENT_PREIFX.getValue());
        cmsComment.setParentId(0l);
        List<CmsComment> cmsCommentList=cmsCommentMapper.listCmsComment(cmsComment);
        Iterator itf= cmsCommentList.iterator();
        while(itf.hasNext()){
            //获取二级评论
            canventCmsComment((CmsComment) itf.next(),configList);
        }
        return cmsCommentList;
    }

    @Override
    public PageData listCmsCommentPage(CmsComment cmsComment) {
        Map<String, SysConfig> configList=sysConfigService.selectConfigMap(CommentPreifxEnum.COMMENT_PREIFX.getValue());
        defaultStartPage(configList);
        List<CmsComment> cmsCommentList=cmsCommentMapper.listCmsComment(cmsComment);
        Iterator itf= cmsCommentList.iterator();
        while(itf.hasNext()){
            //获取二级评论
            canventCmsComment((CmsComment) itf.next(),configList);
        }
        PageData pageData=PageData.getData(cmsCommentList);
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
        return cmsCommentMapper.updateCmsComments(ids,visible);
    }


    /**
     * 检查是否插入
     * @param cmsCommentRecord
     * @return
     */
    @Override
    public int insertCmsCommentRecord(CmsCommentRecord cmsCommentRecord) {
        if (cmsCommentMapper.checkCmsCommentRecord(cmsCommentRecord)== 0)
        {
            return 0;
        }
        return cmsCommentMapper.insertCmsCommentRecord(cmsCommentRecord);
    }

    @Override
    public List<CmsCommentRecord> listCmsCommentRecord(CmsCommentRecord cmsCommentRecord) {
        return cmsCommentMapper.listCmsCommentRecord(cmsCommentRecord);
    }

    /*封装二级评论展示10条*/
    private void  canventCmsComment(CmsComment cmsComment,Map<String, SysConfig> configList){
          startPage(configList);
          cmsComment.setChildrenPageData(PageData.getData(cmsCommentMapper.listCmsCommentByParentId(cmsComment.getCommentId())));
    }

    /*请求第一页二级评论封装*/
    /**
     * 设置请求分页数据
     */
    private void startPage(Map<String, SysConfig> configList)
    {
        PageDomain pageDomain=TableSupport.getPageDomain("",CommentConstants.PAGE_TWO_SIZE,CommentConstants.ORDER_BY_COLUMN,CommentConstants.IS_ASC);
        Integer pageSize = pageDomain.getPageSize()==null?Integer.parseInt(configList.get(CommentPreifxEnum.COMMENT_TWO_SIZE.getValue()).getConfigValue()):pageDomain.getPageSize();
        String orderByColumn=pageDomain.getOrderByColumn()==null?configList.get(CommentPreifxEnum.COMMENT_ORDER_BY.getValue()).getConfigValue():pageDomain.getOrderByColumn();
        String isAsc=pageDomain.getIsAsc()==null?configList.get(CommentPreifxEnum.COMMENT_BY_ASC.getValue()).getConfigValue():pageDomain.getIsAsc();
        if (StringUtils.isNotNull(pageSize))
        {
            String orderBy ="";
            if(StringUtil.isNotEmpty(orderByColumn)&&StringUtil.isNotEmpty(isAsc))
            {
                SqlUtil.escapeOrderBySql(pageDomain.getOrderBy());
            }
            PageHelper.startPage(1, pageSize, orderBy);
        }
    }

    /**
     * 默认配置参数
     * @param configList
     */
    private void defaultStartPage(Map<String, SysConfig> configList) {
        startPageOne(configList.get(CommentPreifxEnum.COMMENT_ONE_SIZE.getValue()).getConfigValue(),
                configList.get(CommentPreifxEnum.COMMENT_ORDER_BY.getValue()).getConfigValue(),
                configList.get(CommentPreifxEnum.COMMENT_BY_ASC.getValue()).getConfigValue());
    }

    /**
     *
     * @param sizeString
     * @param orderString
     * @param ascString
     */
    private void startPageOne(String sizeString,String orderString,String ascString){
        PageDomain pageDomain = TableSupport.buildPageRequest();
        Integer pageNum = pageDomain.getPageNum()==null?1:pageDomain.getPageNum();
        Integer pageSize = pageDomain.getPageSize()==null?Integer.parseInt(sizeString):pageDomain.getPageSize();
        if ("".equals(pageDomain.getOrderBy()))
        {
            pageDomain.setIsAsc(ascString);
            pageDomain.setOrderByColumn(orderString);
        }
        if (StringUtils.isNotNull(pageNum) && StringUtils.isNotNull(pageSize))
        {
            String orderBy = SqlUtil.escapeOrderBySql(pageDomain.getOrderBy());
            PageHelper.startPage(pageNum, pageSize, orderBy);
        }

    }

}
