package com.ruoyi.cms.system.mapper;

import com.ruoyi.cms.system.model.po.CmsArticleCount;
import com.ruoyi.cms.system.model.po.record.*;

import java.util.List;


public interface CmsArticleCountMapper 
{

    /**
     * 查询文章统计列表
     * 
     * @param cmsArticleCount 文章统计
     * @return 文章统计集合
     */
    public List<CmsArticleCount> selectCmsArticleCountList(CmsArticleCount cmsArticleCount);

    /**
     * 批量删除文章统计
     * 
     * @param articleIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteCmsArticleCountByIds(String[] articleIds);
  List<CmsCollectRecord> listCollectRecord(CmsCollectRecord collectRecord);
  List<CmsLikeRecord> listLikeRecord(CmsLikeRecord likeRecord);
  List<CmsLookRecord> listLookRecord(CmsLookRecord lookRecord);
  List<CmsNastyRecord> listNastyRecord(CmsNastyRecord nastyRecord);
  List<CmsScoreRecord> listScoreRecord(CmsScoreRecord scoreRecord);
  List<CmsShareRecord> listShareRecord( CmsShareRecord shareRecord);

}
