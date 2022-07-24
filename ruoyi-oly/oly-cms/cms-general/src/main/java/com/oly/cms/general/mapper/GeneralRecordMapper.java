package com.oly.cms.general.mapper;

import com.oly.cms.general.model.po.WebLogRecord;
import com.oly.cms.general.model.record.CmsLookRecord;

public interface GeneralRecordMapper {
    /**
     * 新增内容请求记录
     *
     * @param webLogRecord 内容请求记录
     * @return 结果
     */
    int insertCmsLogRecord(WebLogRecord webLogRecord);

    /**
     * 阅读记录
     * 
     * @param cmsLookRecord
     * @return
     */
    int insertCmsLookRecord(CmsLookRecord cmsLookRecord);

    int updateCmsArticleCountLook(Long articleId);

}
