package com.oly.cms.hand.model.param;

import com.oly.cms.common.domain.BaseRecordModel;

/**
 * 记录参数基本
 */
public class WebRecordParam extends BaseRecordModel {
    private Long userId;
    private Byte score;
    private String shareUrl;
    private String recordTable;

    public String getRecordTable() {
        return recordTable;
    }

    public void setRecordTable(String recordTable) {
        this.recordTable = recordTable;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Byte getScore() {
        return score;
    }

    public void setScore(Byte score) {
        this.score = score;
    }

    public String getShareUrl() {
        return shareUrl;
    }

    public void setShareUrl(String shareUrl) {
        this.shareUrl = shareUrl;
    }

}
