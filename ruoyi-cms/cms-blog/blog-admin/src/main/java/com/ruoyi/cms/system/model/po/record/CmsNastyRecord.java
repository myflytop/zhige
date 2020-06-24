package com.ruoyi.cms.system.model.po.record;

import com.ruoyi.cms.system.model.base.BaseArticleCountModel;

/**
 * 讨厌记录表
 */
public class CmsNastyRecord extends BaseArticleCountModel {
    public Long getNastyId() {
        return nastyId;
    }

    public void setNastyId(Long nastyId) {
        this.nastyId = nastyId;
    }

    private Long nastyId;
}
