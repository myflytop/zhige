package com.oly.cms.hand.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oly.cms.common.domain.entity.CmsArticleCount;
import com.oly.cms.general.model.record.CmsLookRecord;
import com.oly.cms.hand.mapper.CmsArticleRecordMapper;
import com.oly.cms.hand.model.record.CmsCollectRecord;
import com.oly.cms.hand.model.record.CmsLikeRecord;
import com.oly.cms.hand.model.record.CmsNastyRecord;
import com.oly.cms.hand.model.record.CmsScoreRecord;
import com.oly.cms.hand.model.record.CmsShareRecord;
import com.oly.cms.hand.service.ICmsArticleRecordService;

/**
 * 文章统计Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-04-06
 */
@Service
public class CmsArticleRecordServiceImpl implements ICmsArticleRecordService {
    @Autowired
    private CmsArticleRecordMapper cmsArticleRecordMapper;

    /**
     * 查询文章统计列表
     * 
     * @param cmsArticleCount 文章统计
     * @return 文章统计
     */
    @Override
    public List<CmsArticleCount> selectCmsArticleCountList(CmsArticleCount cmsArticleCount) {
        return cmsArticleRecordMapper.selectCmsArticleCountList(cmsArticleCount);
    }

    @Override
    public List<CmsCollectRecord> listCollectRecord(CmsCollectRecord collectRecord) {
        return cmsArticleRecordMapper.listCollectRecord(collectRecord);
    }

    @Override
    public List<CmsLikeRecord> listLikeRecord(CmsLikeRecord likeRecord) {
        return cmsArticleRecordMapper.listLikeRecord(likeRecord);
    }

    @Override
    public List<CmsLookRecord> listLookRecord(CmsLookRecord lookRecord) {
        return cmsArticleRecordMapper.listLookRecord(lookRecord);
    }

    @Override
    public List<CmsNastyRecord> listNastyRecord(CmsNastyRecord nastyRecord) {
        return cmsArticleRecordMapper.listNastyRecord(nastyRecord);
    }

    @Override
    public List<CmsScoreRecord> listScoreRecord(CmsScoreRecord scoreRecord) {
        return cmsArticleRecordMapper.listScoreRecord(scoreRecord);
    }

    @Override
    public List<CmsShareRecord> listShareRecord(CmsShareRecord shareRecord) {
        return cmsArticleRecordMapper.listShareRecord(shareRecord);
    }
}
