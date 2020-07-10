package com.ruoyi.cms.system.model.po.record;

import com.ruoyi.cms.system.model.base.BaseArticleCountModel;

/**
 * 分享记录表
 */
public class CmsShareRecord extends BaseArticleCountModel {
    private Long shareId;
    //分享的地址
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
