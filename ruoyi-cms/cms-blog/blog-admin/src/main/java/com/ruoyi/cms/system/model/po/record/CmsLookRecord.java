package com.ruoyi.cms.system.model.po.record;

import com.ruoyi.cms.system.model.base.BaseArticleCountModel;

/**
 * 点赞记录表
 */
public class CmsLookRecord extends BaseArticleCountModel {
    public Long getLookId() {
        return lookId;
    }

    public void setLookId(Long lookId) {
        this.lookId = lookId;
    }

    private Long lookId;
}
