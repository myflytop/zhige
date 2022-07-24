package com.oly.cms.hand.model.record;

import com.oly.cms.common.domain.BaseRecordModel;

/**
 * 分享记录表
 */
public class CmsShareRecord extends BaseRecordModel {

    private static final long serialVersionUID = -386764297935005206L;

    // 分享的地址
    private String shareUrl;

    public String getShareUrl() {
        return shareUrl;
    }

    public void setShareUrl(String shareUrl) {
        this.shareUrl = shareUrl;
    }
}
