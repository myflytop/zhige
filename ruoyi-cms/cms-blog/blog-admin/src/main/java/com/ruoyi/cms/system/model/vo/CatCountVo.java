package com.ruoyi.cms.system.model.vo;

import com.ruoyi.cms.system.model.po.CmsCat;

public class CatCountVo extends CmsCat {
    private Long catCount;

    public void setCatCount(Long  catCount) {

        this.catCount = catCount==null?0: catCount;
    }

    public Long getCatCount() {
        return catCount;
    }
}
