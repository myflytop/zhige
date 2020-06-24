package com.ruoyi.cms.system.service;

import com.ruoyi.cms.system.model.po.record.CmsLogRecord;

import java.util.List;

public interface ICmsLogRecordService {
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
