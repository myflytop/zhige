package com.ruoyi.cms.system.model.po.record;

import com.ruoyi.cms.system.model.base.BaseArticleCountModel;

/**
 * 评分记录表
 */
public class CmsScoreRecord extends BaseArticleCountModel {
    private Long scoreId;
    private Byte score;

    public Long getScoreId() {
        return scoreId;
    }

    public void setScoreId(Long scoreId) {
        this.scoreId = scoreId;
    }

    public Byte getScore() {
        return score;
    }

    public void setScore(Byte score) {
        this.score = score;
    }
}
