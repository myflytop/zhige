package com.oly.cms.system.service.impl;

import com.oly.cms.system.mapper.CmsLogRecordMapper;
import com.oly.cms.system.model.po.record.CmsLogRecord;
import com.oly.cms.system.service.ICmsLogRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class CmsLogRecordServiceImpl implements ICmsLogRecordService {

    @Autowired
    private CmsLogRecordMapper cmsLogRecordMapper;

    @Override
    public List<CmsLogRecord> listCmsLogRecord(CmsLogRecord cmsLogRecord) {
        return cmsLogRecordMapper.listCmsLogRecord(cmsLogRecord);
    }

    @Override
    public int deleteCmsLogRecordById(Long logId) {
        return cmsLogRecordMapper.deleteCmsLogRecordById(logId);
    }

    @Override
    public int deleteCmsLogRecordByIds(String[] logIds) {
        return cmsLogRecordMapper.deleteCmsLogRecordByIds(logIds);
    }
}
