package com.oly.cms.admin.mapper;

import com.oly.cms.admin.model.po.record.CmsLogRecord;
import com.oly.cms.admin.model.vo.ArticleVo;
import com.oly.cms.comment.model.CmsComment;
import com.oly.cms.common.domain.entity.CmsCat;
import com.oly.cms.common.domain.entity.CmsContact;
import com.oly.cms.common.domain.entity.CmsTag;
import com.oly.cms.common.domain.entity.CmsUnion;

public interface CmsReportMapper {
    /**
     * 统计文章
     * 
     * @param artVo
     * @return
     */
    int countCmsArticle(ArticleVo artVo);

    /**
     * 统计记录
     * 
     * @param cmsLogRecord
     * @return
     */
    int countCmsLogRecord(CmsLogRecord cmsLogRecord);

    /**
     * 统计分类
     * 
     * @param cmsCat
     * @return
     */
    int countCmsCat(CmsCat cmsCat);

    /**
     * 统计标签
     * 
     * @param cmsTag
     * @return
     */
    int countCmsTag(CmsTag cmsTag);

    /**
     * 评论统计
     * 
     * @param cmsComment
     * @return
     */
    int countCmsComment(CmsComment cmsComment);

    /**
     * 统计反馈
     * 
     * @param cmsContact
     * @return
     */
    int countCmsContact(CmsContact cmsContact);

    /**
     * 联盟统计
     * 
     * @param cmsUnion
     * @return
     */
    int countCmsUnion(CmsUnion cmsUnion);

}
