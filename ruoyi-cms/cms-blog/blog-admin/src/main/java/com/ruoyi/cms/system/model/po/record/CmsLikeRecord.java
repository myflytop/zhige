package com.ruoyi.cms.system.model.po.record;

import com.ruoyi.cms.system.model.base.BaseArticleCountModel;

/**
 * 浏览记录表
 */
public class CmsLikeRecord extends BaseArticleCountModel {
    public Long getLikeId() {
        return likeId;
    }

    public void setLikeId(Long likeId) {
        this.likeId = likeId;
    }

    private Long likeId;
}
