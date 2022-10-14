package com.oly.cms.hand.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.oly.cms.comment.model.CmsComment;
import com.oly.cms.comment.model.enums.CommentTypeEnum;
import com.oly.cms.comment.model.enums.CommentVisibleEnums;
import com.oly.cms.comment.model.properties.OlyCommentProperties;
import com.oly.cms.comment.model.vo.CmsCommentVo;
import com.oly.cms.comment.service.ICmsCommentService;
import com.oly.cms.common.model.support.PageData;
import com.oly.cms.hand.service.IHandCommentService;
import com.ruoyi.system.config.service.ISysConfigService;

@Service
public class HandCommentServiceImpl implements IHandCommentService {

    @Autowired
    private ICmsCommentService cmsCommentService;

    @Autowired
    private ISysConfigService configService;

    @Override
    public List<CmsCommentVo> listCommentByTypeId(String typeId, int pageNum, int pageSize) {
        CmsComment cmsComment = new CmsComment();
        cmsComment.setVisible(CommentVisibleEnums.PASS.ordinal());
        cmsComment.setTypeId(typeId);
        PageHelper.startPage(pageNum, pageSize, "order_num,create_time desc");
        return cmsCommentService.listCmsCommentVo(cmsComment);
    }

    @Override
    public List<CmsCommentVo> listCommentOneByTypeId(String typeId, int pageNum, int pageSize) {
        CmsComment cmsComment = new CmsComment();
        cmsComment.setVisible(CommentVisibleEnums.PASS.ordinal());
        cmsComment.setTypeId(typeId);
        cmsComment.setParentId(0L);
        PageHelper.startPage(pageNum, pageSize, "order_num,create_time desc");
        return cmsCommentService.listCmsCommentVo(cmsComment);
    }

    @Override
    public List<CmsCommentVo> listCommentTwoByParentId(long parentId, int pageNum, int pageSize) {
        CmsComment cmsComment = new CmsComment();
        cmsComment.setVisible(CommentVisibleEnums.PASS.ordinal());
        cmsComment.setParentId(parentId);
        PageHelper.startPage(pageNum, pageSize, "order_num,create_time desc");
        return cmsCommentService.listCmsCommentVo(cmsComment);

    }

    public List<CmsCommentVo> recentlyComment(int commentType, int pageNum, int pageSize) {
        CmsComment cmsComment = new CmsComment();
        cmsComment.setVisible(CommentVisibleEnums.PASS.ordinal());
        cmsComment.setCommentType(commentType);
        cmsComment.setParentId(0L);
        PageHelper.startPage(pageNum, pageSize, "create_time desc");
        return cmsCommentService.listCmsCommentVo(cmsComment);
    }

    @Override
    public PageData pageCommentByTypeId(String typeId, int pageNum, int pageSize) {
        List<CmsCommentVo> parentList = this.listCommentOneByTypeId(typeId, pageNum, pageSize);
        for (CmsComment parenComment : parentList) {
            parenComment.setChildPage(this.pageTwoCommentByParentId(parenComment.getCommentId(), pageNum, pageSize));
        }
        PageData pageData = PageData.getData(parentList);
        return pageData;
    }

    @Override
    public PageData pageOneCommentByTypeId(String typeId, int pageNum, int pageSize) {

        return PageData.getData(this.listCommentByTypeId(typeId, pageNum, pageSize));
    }

    @Override
    public PageData pageTwoCommentByParentId(long parentId, int pageNum, int pageSize) {

        return PageData.getData(this.listCommentTwoByParentId(parentId, pageNum, pageSize));
    }

    @Override
    public boolean commentSupport(CommentTypeEnum commentTypeEnum) {
        return "true".equals(configService.selectConfigDefaultValue(
                OlyCommentProperties.COMMENT_CONFIG_GROUP.defaultValue(),
                OlyCommentProperties.getEnum("COMMENT_OPEN_" + commentTypeEnum.name())));

    }
}
