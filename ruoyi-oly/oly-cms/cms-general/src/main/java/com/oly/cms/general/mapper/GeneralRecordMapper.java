package com.oly.cms.general.mapper;

import com.oly.cms.general.model.record.CmsLogRecord;
import com.oly.cms.general.model.record.CmsLookRecord;

public interface GeneralRecordMapper {
    /**
     * 新增内容请求记录
     *
     * @param cmsLogRecord 内容请求记录
     * @return 结果
     */
    int insertCmsLogRecord(CmsLogRecord cmsLogRecord);

    /**
     * 阅读记录
     * 
     * @param cmsLookRecord
     * @return
     */
    int insertCmsLookRecord(CmsLookRecord cmsLookRecord);

    /**
     * 
     * @param articleId
     * @return
     */
    int updateCmsArticleCountLook(Long articleId);

}
