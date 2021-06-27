package com.oly.cms.system.service.impl;

import java.util.List;

import com.oly.cms.system.mapper.CmsArticleCountMapper;
import com.oly.cms.system.model.po.CmsArticleCount;
import com.oly.cms.system.model.po.record.CmsCollectRecord;
import com.oly.cms.system.model.po.record.CmsLikeRecord;
import com.oly.cms.system.model.po.record.CmsLookRecord;
import com.oly.cms.system.model.po.record.CmsNastyRecord;
import com.oly.cms.system.model.po.record.CmsScoreRecord;
import com.oly.cms.system.model.po.record.CmsShareRecord;
import com.oly.cms.system.service.ICmsArticleCountService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 文章统计Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-04-06
 */
@Service
public class CmsArticleCountServiceImpl implements ICmsArticleCountService {
    @Autowired
    private CmsArticleCountMapper cmsArticleCountMapper;

    /**
     * 查询文章统计列表
     * 
     * @param cmsArticleCount 文章统计
     * @return 文章统计
     */
    @Override
    public List<CmsArticleCount> selectCmsArticleCountList(CmsArticleCount cmsArticleCount) {
        return cmsArticleCountMapper.selectCmsArticleCountList(cmsArticleCount);
    }

    @Override
    public List<CmsCollectRecord> listCollectRecord(CmsCollectRecord collectRecord) {
        return cmsArticleCountMapper.listCollectRecord(collectRecord);
    }

    @Override
    public List<CmsLikeRecord> listLikeRecord(CmsLikeRecord likeRecord) {
        return cmsArticleCountMapper.listLikeRecord(likeRecord);
    }

    @Override
    public List<CmsLookRecord> listLookRecord(CmsLookRecord lookRecord) {
        return cmsArticleCountMapper.listLookRecord(lookRecord);
    }

    @Override
    public List<CmsNastyRecord> listNastyRecord(CmsNastyRecord nastyRecord) {
        return cmsArticleCountMapper.listNastyRecord(nastyRecord);
    }

    @Override
    public List<CmsScoreRecord> listScoreRecord(CmsScoreRecord scoreRecord) {
        return cmsArticleCountMapper.listScoreRecord(scoreRecord);
    }

    @Override
    public List<CmsShareRecord> listShareRecord(CmsShareRecord shareRecord) {
        return cmsArticleCountMapper.listShareRecord(shareRecord);
    }
}
