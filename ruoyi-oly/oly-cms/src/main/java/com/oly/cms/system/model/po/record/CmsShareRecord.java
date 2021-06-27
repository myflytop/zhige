package com.oly.cms.system.model.po.record;

import com.oly.cms.system.model.base.BaseArticleCountModel;

/**
 * 分享记录表
 */
public class CmsShareRecord extends BaseArticleCountModel {
    /**
     *
     */
    private static final long serialVersionUID = -386764297935005206L;
    private Long shareId;
    // 分享的地址
    private String shareUrl;

    public Long getShareId() {
        return shareId;
    }

    public void setShareId(Long shareId) {
        this.shareId = shareId;
    }

    public String getShareUrl() {
        return shareUrl;
    }

    public void setShareUrl(String shareUrl) {
        this.shareUrl = shareUrl;
    }
}
