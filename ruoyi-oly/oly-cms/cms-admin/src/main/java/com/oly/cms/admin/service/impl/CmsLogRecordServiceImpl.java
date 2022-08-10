package com.oly.cms.admin.service.impl;

import com.oly.cms.admin.mapper.CmsLogRecordMapper;
import com.oly.cms.admin.service.ICmsLogRecordService;
import com.oly.cms.general.model.record.CmsLogRecord;

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
