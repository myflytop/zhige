package com.oly.cms.system.model.po.record;

import com.oly.cms.system.model.base.BaseArticleCountModel;

/**
 * 讨厌记录表
 */
public class CmsNastyRecord extends BaseArticleCountModel {
    /**
     *
     */
    private static final long serialVersionUID = 1413234941819158006L;

    public Long getNastyId() {
        return nastyId;
    }

    public void setNastyId(Long nastyId) {
        this.nastyId = nastyId;
    }

    private Long nastyId;
}
