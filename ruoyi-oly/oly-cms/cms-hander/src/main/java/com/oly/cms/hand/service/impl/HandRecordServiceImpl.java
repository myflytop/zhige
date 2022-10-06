package com.oly.cms.hand.service.impl;

import com.oly.cms.general.model.enums.CountColumnEnum;
import com.oly.cms.hand.mapper.HandRecordMapper;
import com.oly.cms.hand.model.enums.RecordTableEnum;
import com.oly.cms.hand.model.param.WebRecordParam;
import com.oly.cms.hand.service.IHandRecordService;
import com.ruoyi.common.core.text.Convert;
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
        webRecordMapper.insertRecord(recordParam);
        return webRecordMapper.updateCmsArticleCount(CountColumnEnum.LIKE.name().toLowerCase(),
                recordParam.getArticleId());

    }

    @Transactional
    @Override
    public int insertNastyRecord(WebRecordParam recordParam) {
        recordParam.setRecordTable(RecordTableEnum.NASTY_RECORD.getValue());
        webRecordMapper.insertRecord(recordParam);
        return webRecordMapper.updateCmsArticleCount(CountColumnEnum.NASTY.name().toLowerCase(),
                recordParam.getArticleId());
    }

    @Transactional
    @Override
    public int insertScoreRecord(WebRecordParam recordParam) {

        recordParam.setRecordTable(RecordTableEnum.SCORE_RECORD.getValue());
        webRecordMapper.insertRecord(recordParam);
        return webRecordMapper.updateCmsArticleCount(CountColumnEnum.SCORE.name().toLowerCase(),
                recordParam.getArticleId());

    }

    @Transactional
    @Override
    public int insertShareRecord(WebRecordParam recordParam) {
        recordParam.setRecordTable(RecordTableEnum.SHARE_RECORD.getValue());
        webRecordMapper.insertRecord(recordParam);
        return webRecordMapper.updateCmsArticleCount(CountColumnEnum.SHARE.name().toLowerCase(),
                recordParam.getArticleId());
    }

    @Transactional
    @Override
    public int insertCollectRecord(WebRecordParam recordParam) {
        recordParam.setRecordTable(RecordTableEnum.COLLECT_RECORD.getValue());
        webRecordMapper.insertRecord(recordParam);
        return webRecordMapper.updateCmsArticleCount(CountColumnEnum.COLLECT.name().toLowerCase(),
                recordParam.getArticleId());
    }

    @Override
    public String selectRecordVisible(RecordTableEnum recordTable, Long articleId, Long userId) {
        return webRecordMapper.selectRecordVisible(recordTable.getValue(), articleId, userId);
    }

    @Transactional
    @Override
    public int updateCmsArticleRecord(WebRecordParam recordParam) {
        webRecordMapper.updateCmsArticleRecord(recordParam);
        return webRecordMapper.updateCmsArticleCount(Convert.toStrArray("_", recordParam.getRecordTable())[1],
                recordParam.getArticleId());
    }
}
