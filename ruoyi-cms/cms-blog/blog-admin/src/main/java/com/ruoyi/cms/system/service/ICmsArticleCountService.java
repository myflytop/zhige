package com.ruoyi.cms.system.service;


import com.ruoyi.cms.system.model.po.CmsArticleCount;
import com.ruoyi.cms.system.model.po.record.*;

import java.util.List;

/**
 * 文章统计Service接口
 * 
 * @author ruoyi
 * @date 2020-04-06
 */
public interface ICmsArticleCountService 
{
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
    public List<CmsShareRecord> listShareRecord( CmsShareRecord shareRecord);
}
