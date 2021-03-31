package com.oly.cms.system.model.po.record;

import com.oly.cms.system.model.base.BaseArticleCountModel;

/**
 * 浏览记录表
 */
public class CmsLikeRecord extends BaseArticleCountModel {
    /**
     *
     */
    private static final long serialVersionUID = 3249244931727919099L;

    public Long getLikeId() {
        return likeId;
    }

    public void setLikeId(Long likeId) {
        this.likeId = likeId;
    }

    private Long likeId;
}
