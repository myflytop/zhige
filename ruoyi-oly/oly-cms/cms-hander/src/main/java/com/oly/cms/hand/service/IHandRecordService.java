package com.oly.cms.hand.service;

import com.oly.cms.hand.model.enums.RecordTableEnum;
import com.oly.cms.hand.model.param.WebRecordParam;

public interface IHandRecordService {

    int insertLikeRecord(WebRecordParam recordParam);

    int insertNastyRecord(WebRecordParam recordParam);

    int insertScoreRecord(WebRecordParam recordParam);

    int insertShareRecord(WebRecordParam recordParam);

    int insertCollectRecord(WebRecordParam recordParam);

    int getCountRecord(RecordTableEnum recordTable, Long articleId, Long userId);
}
