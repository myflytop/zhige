package com.oly.cms.hand.mapper;

import java.util.List;

import com.oly.cms.common.domain.entity.CmsArticleCount;
import com.oly.cms.general.model.record.CmsLookRecord;
import com.oly.cms.hand.model.record.CmsCollectRecord;
import com.oly.cms.hand.model.record.CmsLikeRecord;
import com.oly.cms.hand.model.record.CmsNastyRecord;
import com.oly.cms.hand.model.record.CmsScoreRecord;
import com.oly.cms.hand.model.record.CmsShareRecord;

public interface CmsArticleRecordMapper {

  /**
   * 查询文章统计列表
   * 
   * @param cmsArticleCount 文章统计
   * @return 文章统计集合
   */
  List<CmsArticleCount> selectCmsArticleCountList(CmsArticleCount cmsArticleCount);

  List<CmsCollectRecord> listCollectRecord(CmsCollectRecord collectRecord);

  List<CmsLikeRecord> listLikeRecord(CmsLikeRecord likeRecord);

  List<CmsLookRecord> listLookRecord(CmsLookRecord lookRecord);

  List<CmsNastyRecord> listNastyRecord(CmsNastyRecord nastyRecord);

  List<CmsScoreRecord> listScoreRecord(CmsScoreRecord scoreRecord);

  List<CmsShareRecord> listShareRecord(CmsShareRecord shareRecord);

}
