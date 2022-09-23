package com.oly.cms.hand.service.impl;

import com.oly.cms.general.model.enums.CountColumnEnum;
import com.oly.cms.hand.mapper.HandRecordMapper;
import com.oly.cms.hand.model.enums.RecordTableEnum;
import com.oly.cms.hand.model.param.WebRecordParam;
import com.oly.cms.hand.service.IHandRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 游客模式 默认用户id为0
 */
@Service
public class HandRecordServiceImpl implements IHandRecordService {
    @Autowired
    private HandRecordMapper webRecordMapper;

    @Transactional
    @Override
    public int insertLikeRecord(WebRecordParam recordParam) {
        recordParam.setRecordTable(RecordTableEnum.LIKE_RECORD.getValue());
        recordParam.setScore(null);
        recordParam.setShareUrl(null);
        webRecordMapper.insertRecord(recordParam);
        return webRecordMapper.updateCmsArticleCount(CountColumnEnum.LIKE.getValue(), recordParam.getArticleId());

    }

    @Transactional
    @Override
    public int insertNastyRecord(WebRecordParam recordParam) {
        recordParam.setRecordTable(RecordTableEnum.NASTY_RECORD.getValue());
        recordParam.setScore(null);
        recordParam.setShareUrl(null);
        webRecordMapper.insertRecord(recordParam);
        return webRecordMapper.updateCmsArticleCount(CountColumnEnum.NASTY.getValue(), recordParam.getArticleId());
    }

    @Transactional
    @Override
    public int insertScoreRecord(WebRecordParam recordParam) {

        recordParam.setRecordTable(RecordTableEnum.SCORE_RECORD.getValue());
        recordParam.setShareUrl(null);
        webRecordMapper.insertRecord(recordParam);
        return webRecordMapper.updateCmsArticleCount(CountColumnEnum.SCORE.getValue(), recordParam.getArticleId());

    }

    @Transactional
    @Override
    public int insertShareRecord(WebRecordParam recordParam) {
        recordParam.setRecordTable(RecordTableEnum.SHARE_RECORD.getValue());
        recordParam.setScore(null);
        webRecordMapper.insertRecord(recordParam);
        return webRecordMapper.updateCmsArticleCount(CountColumnEnum.SHARE.getValue(), recordParam.getArticleId());
    }

    @Transactional
    @Override
    public int insertCollectRecord(WebRecordParam recordParam) {

        recordParam.setRecordTable(RecordTableEnum.COLLECT_RECORD.getValue());
        recordParam.setScore(null);
        recordParam.setShareUrl(null);
        webRecordMapper.insertRecord(recordParam);
        return webRecordMapper.updateCmsArticleCount(CountColumnEnum.COLLECT.getValue(), recordParam.getArticleId());
    }

    @Override
    public int getCountRecord(RecordTableEnum recordTable, Long articleId, Long userId) {
        return webRecordMapper.getCountRecord(recordTable.getValue(), articleId, userId);
    }
}
