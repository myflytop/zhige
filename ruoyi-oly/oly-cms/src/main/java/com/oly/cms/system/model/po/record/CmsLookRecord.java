package com.oly.cms.system.model.po.record;

import com.oly.cms.system.model.base.BaseArticleCountModel;

/**
 * 点赞记录表
 */
public class CmsLookRecord extends BaseArticleCountModel {
    /**
     *
     */
    private static final long serialVersionUID = 1L;

    public Long getLookId() {
        return lookId;
    }

    public void setLookId(Long lookId) {
        this.lookId = lookId;
    }

    private Long lookId;
}
