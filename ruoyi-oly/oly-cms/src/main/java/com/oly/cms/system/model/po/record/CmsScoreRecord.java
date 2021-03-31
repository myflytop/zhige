package com.oly.cms.system.model.po.record;

import com.oly.cms.system.model.base.BaseArticleCountModel;

/**
 * 评分记录表
 */
public class CmsScoreRecord extends BaseArticleCountModel {
    /**
     *
     */
    private static final long serialVersionUID = -2765810317266397606L;
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
