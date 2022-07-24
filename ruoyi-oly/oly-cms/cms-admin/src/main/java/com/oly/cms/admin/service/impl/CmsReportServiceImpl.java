package com.oly.cms.admin.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oly.cms.admin.mapper.CmsReportMapper;
import com.oly.cms.admin.model.po.record.CmsLogRecord;
import com.oly.cms.admin.model.vo.ArticleVo;
import com.oly.cms.admin.service.ICmsReportService;
import com.oly.cms.comment.model.CmsComment;
import com.oly.cms.common.domain.entity.CmsCat;
import com.oly.cms.common.domain.entity.CmsContact;
import com.oly.cms.common.domain.entity.CmsTag;
import com.oly.cms.common.domain.entity.CmsUnion;

@Service
public class CmsReportServiceImpl implements ICmsReportService {

    @Autowired
    private CmsReportMapper cmsReportMapper;

    @Override
    public int countCmsArticle(ArticleVo artVo) {

        return cmsReportMapper.countCmsArticle(artVo);
    }

    @Override
    public int countCmsLogRecord(CmsLogRecord cmsLogRecord) {

        return cmsReportMapper.countCmsLogRecord(cmsLogRecord);
    }

    @Override
    public int countCmsCat(CmsCat cmsCat) {

        return cmsReportMapper.countCmsCat(cmsCat);
    }

    @Override
    public int countCmsTag(CmsTag cmsTag) {

        return cmsReportMapper.countCmsTag(cmsTag);
    }

    @Override
    public int countCmsComment(CmsComment cmsComment) {

        return cmsReportMapper.countCmsComment(cmsComment);
    }

    @Override
    public int countCmsContact(CmsContact cmsContact) {

        return cmsReportMapper.countCmsContact(cmsContact);
    }

    @Override
    public int countCmsUnion(CmsUnion cmsUnion) {

        return cmsReportMapper.countCmsUnion(cmsUnion);
    }

}
