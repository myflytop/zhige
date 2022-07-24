package com.oly.cms.general.service.impl;

import com.oly.cms.general.mapper.GeneralRecordMapper;
import com.oly.cms.general.model.po.WebLogRecord;
import com.oly.cms.general.model.record.CmsLookRecord;
import com.oly.cms.general.service.IGeneralRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class GeneralRecordServiceImpl implements IGeneralRecordService {

    @Autowired
    private GeneralRecordMapper webRecordMapper;

    @Override
    public int insertWebLogRecord(WebLogRecord webLogRecord) {
        return webRecordMapper.insertCmsLogRecord(webLogRecord);
    }

    @Override
    @Transactional
    public int insertCmsLookRecord(CmsLookRecord cmsLookRecord) {
        webRecordMapper.insertCmsLookRecord(cmsLookRecord);
        return webRecordMapper.updateCmsArticleCountLook(cmsLookRecord.getArticleId());
    }

}
