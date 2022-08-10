package com.oly.cms.admin.mapper;

import java.util.List;

import com.oly.cms.general.model.record.CmsLogRecord;

public interface CmsLogRecordMapper {
    List<CmsLogRecord> listCmsLogRecord(CmsLogRecord cmsLogRecord);

    /**
     * 删除内容请求记录
     *
     * @param logId 内容请求记录ID
     * @return 结果
     */
    public int deleteCmsLogRecordById(Long logId);

    /**
     * 批量删除内容请求记录
     *
     * @param logIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteCmsLogRecordByIds(String[] logIds);
}
