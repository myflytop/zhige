package com.oly.cms.general.service;

import com.oly.cms.general.model.po.WebLogRecord;
import com.oly.cms.general.model.record.CmsLookRecord;

public interface IGeneralRecordService {

    /**
     * 新增内容请求记录
     *
     * @param webLogRecord 内容请求记录
     * @return 结果
     */
    int insertWebLogRecord(WebLogRecord webLogRecord);

    /**
     * 阅读记录
     * 
     * @param cmsLookRecord
     * @return
     */
    int insertCmsLookRecord(CmsLookRecord cmsLookRecord);

}
