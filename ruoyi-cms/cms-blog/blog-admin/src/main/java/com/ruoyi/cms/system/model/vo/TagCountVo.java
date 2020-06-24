package com.ruoyi.cms.system.model.vo;

import com.ruoyi.cms.system.model.po.CmsTag;

public class TagCountVo extends CmsTag {
    private Long tagCount;

    public void setTagCount(Long tagCount) {
        this.tagCount = tagCount==null?0:tagCount;
    }

    public Long getTagCount() {
        return tagCount;
    }

}
