package com.oly.cms.system.model.po.record;

import com.oly.cms.system.model.base.BaseArticleCountModel;

/**
 * 收藏记录表
 */
public class CmsCollectRecord extends BaseArticleCountModel {
    /**
     *
     */
    private static final long serialVersionUID = 1L;
    private Long collectId;

    public Long getCollectId() {
        return collectId;
    }

    public void setCollectId(Long collectId) {
        this.collectId = collectId;
    }
}
