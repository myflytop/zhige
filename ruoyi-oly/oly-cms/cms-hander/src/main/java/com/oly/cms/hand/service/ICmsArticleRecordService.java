package com.oly.cms.hand.service;

import java.util.List;

import com.oly.cms.common.domain.entity.CmsArticleCount;
import com.oly.cms.general.model.record.CmsLookRecord;
import com.oly.cms.hand.model.record.CmsCollectRecord;
import com.oly.cms.hand.model.record.CmsLikeRecord;
import com.oly.cms.hand.model.record.CmsNastyRecord;
import com.oly.cms.hand.model.record.CmsScoreRecord;
import com.oly.cms.hand.model.record.CmsShareRecord;

/**
 * 文章统计Service接口
 * 
 * @author zg
 * @date 2020-04-06
 */
public interface ICmsArticleRecordService {
    /**
     * 查询文章统计列表
     * 
     * @param cmsArticleCount 文章统计
     * @return 文章统计集合
     */
    public List<CmsArticleCount> selectCmsArticleCountList(CmsArticleCount cmsArticleCount);

    public List<CmsCollectRecord> listCollectRecord(CmsCollectRecord collectRecord);

    public List<CmsLikeRecord> listLikeRecord(CmsLikeRecord likeRecord);

    public List<CmsLookRecord> listLookRecord(CmsLookRecord lookRecord);

    public List<CmsNastyRecord> listNastyRecord(CmsNastyRecord nastyRecord);

    public List<CmsScoreRecord> listScoreRecord(CmsScoreRecord scoreRecord);

    public List<CmsShareRecord> listShareRecord(CmsShareRecord shareRecord);
}
