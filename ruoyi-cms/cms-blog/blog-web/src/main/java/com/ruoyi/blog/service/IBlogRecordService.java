package com.ruoyi.blog.service;


import com.ruoyi.blog.mould.enums.RecordTableEnum;
import com.ruoyi.blog.mould.pam.BlogRecordParam;

public interface IBlogRecordService {
    int insertLookRecord(BlogRecordParam recordParam);
    int insertLikeRecord(BlogRecordParam recordParam);
    int insertNastyRecord(BlogRecordParam recordParam);
    int insertScoreRecord(BlogRecordParam recordParam);
    int insertShareRecord(BlogRecordParam recordParam);
    int insertCollectRecord(BlogRecordParam recordParam);

    int countRecord(RecordTableEnum recordTable, Long articleId, Long userId);
}
