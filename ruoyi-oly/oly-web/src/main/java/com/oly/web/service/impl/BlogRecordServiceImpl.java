package com.oly.web.service.impl;

import com.oly.web.mapper.BlogRecordMapper;
import com.oly.web.model.enums.CountColumnEnum;
import com.oly.web.model.enums.RecordTableEnum;
import com.oly.web.model.pam.BlogRecordParam;
import com.oly.web.service.IBlogRecordService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 游客模式 默认用户id为0
 */
@Service
public class BlogRecordServiceImpl implements IBlogRecordService {
    @Autowired
    BlogRecordMapper blogRecordMapper;

    @Transactional
    @Override
    public int insertLookRecord(BlogRecordParam recordParam) {
        recordParam.setRecordTable(RecordTableEnum.LOOK_RECORD.getValue());
        recordParam.setScore(null);
        recordParam.setShareUrl(null);
        blogRecordMapper.insertRecord(recordParam);
        return blogRecordMapper.updateBlogPostCount(CountColumnEnum.LOOK.getValue(), recordParam.getArticleId());

    }

    @Transactional
    @Override
    public int insertLikeRecord(BlogRecordParam recordParam) {

        if (blogRecordMapper.countRecord(RecordTableEnum.LIKE_RECORD.getValue(), recordParam.getArticleId(),
                recordParam.getUserId()) == 0
                && blogRecordMapper.countRecord(RecordTableEnum.NASTY_RECORD.getValue(), recordParam.getArticleId(),
                        recordParam.getUserId()) == 0) {
            recordParam.setRecordTable(RecordTableEnum.LIKE_RECORD.getValue());
            recordParam.setScore(null);
            recordParam.setShareUrl(null);
            blogRecordMapper.insertRecord(recordParam);
            return blogRecordMapper.updateBlogPostCount(CountColumnEnum.LIKE.getValue(), recordParam.getArticleId());
        }
        return 0;
    }

    @Transactional
    @Override
    public int insertNastyRecord(BlogRecordParam recordParam) {
        recordParam.setRecordTable(RecordTableEnum.NASTY_RECORD.getValue());
        recordParam.setScore(null);
        recordParam.setShareUrl(null);
        blogRecordMapper.insertRecord(recordParam);
        return blogRecordMapper.updateBlogPostCount(CountColumnEnum.NASTY.getValue(), recordParam.getArticleId());
    }

    @Transactional
    @Override
    public int insertScoreRecord(BlogRecordParam recordParam) {
        if (blogRecordMapper.countRecord(RecordTableEnum.SCORE_RECORD.getValue(), recordParam.getArticleId(),
                recordParam.getUserId()) == 0) {
            recordParam.setRecordTable(RecordTableEnum.SCORE_RECORD.getValue());
            recordParam.setShareUrl(null);
            blogRecordMapper.insertRecord(recordParam);
            return blogRecordMapper.updateBlogPostCount(CountColumnEnum.SCORE.getValue(), recordParam.getArticleId());
        }
        return 0;
    }

    @Transactional
    @Override
    public int insertShareRecord(BlogRecordParam recordParam) {
        if (blogRecordMapper.countRecord(RecordTableEnum.SHARE_RECORD.getValue(), recordParam.getArticleId(),
                recordParam.getUserId()) == 0) {
            recordParam.setRecordTable(RecordTableEnum.SHARE_RECORD.getValue());
            recordParam.setScore(null);
            blogRecordMapper.insertRecord(recordParam);
            return blogRecordMapper.updateBlogPostCount(CountColumnEnum.SHARE.getValue(), recordParam.getArticleId());
        }
        return 0;
    }

    @Transactional
    @Override
    public int insertCollectRecord(BlogRecordParam recordParam) {
        if (blogRecordMapper.countRecord(RecordTableEnum.COLLECT_RECORD.getValue(), recordParam.getArticleId(),
                recordParam.getUserId()) == 0) {
            recordParam.setRecordTable(RecordTableEnum.COLLECT_RECORD.getValue());
            recordParam.setScore(null);
            recordParam.setShareUrl(null);
            blogRecordMapper.insertRecord(recordParam);
            return blogRecordMapper.updateBlogPostCount(CountColumnEnum.COLLECT.getValue(), recordParam.getArticleId());
        }
        return 0;
    }

    @Override
    public int countRecord(RecordTableEnum recordTable, Long articleId, Long userId) {
        return blogRecordMapper.countRecord(recordTable.getValue(), articleId, userId);
    }
}
