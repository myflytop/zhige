package com.oly.cms.system.model.po;

import java.util.List;

import com.oly.common.model.entity.base.BaseCat;

public class CmsCat extends BaseCat {

    /**
     *
     */
    private static final long serialVersionUID = -1562626660558117930L;
    private List<CmsCat> childList;

    public List<CmsCat> getChildList() {
        return childList;
    }

    public void setChildList(List<CmsCat> childList) {
        this.childList = childList;
    }
}