package com.oly.cms.hand.model.record;

import com.oly.cms.common.domain.BaseRecordModel;

/**
 * 评分记录表
 */
public class CmsScoreRecord extends BaseRecordModel {

    private static final long serialVersionUID = -2765810317266397606L;
    private Byte score;

    public Byte getScore() {
        return score;
    }

    public void setScore(Byte score) {
        this.score = score;
    }
}
