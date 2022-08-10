package com.oly.cms.general.service;

import com.oly.cms.general.model.record.CmsLogRecord;
import com.oly.cms.general.model.record.CmsLookRecord;

public interface IGeneralRecordService {

    /**
     * 新增内容请求记录
     *
     * @param webLogRecord 内容请求记录
     * @return 结果
     */
    int insertWebLogRecord(CmsLogRecord CmsLogRecord);

    /**
     * 阅读记录
     * 
     * @param cmsLookRecord
     * @return
     */
    int insertCmsLookRecord(CmsLookRecord cmsLookRecord);

}
