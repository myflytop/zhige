package com.ruoyi.cms.system.model.po;


import com.ruoyi.cms.common.mould.base.BaseCat;
import com.ruoyi.cms.common.mould.base.SeoBaseModel;

import java.util.ArrayList;
import java.util.List;

public class CmsCat extends BaseCat {

    private List<CmsCat> childList;

    public List<CmsCat> getChildList() {
        return childList;
    }

    public void setChildList(List<CmsCat> childList) {
        this.childList = childList;
    }
}