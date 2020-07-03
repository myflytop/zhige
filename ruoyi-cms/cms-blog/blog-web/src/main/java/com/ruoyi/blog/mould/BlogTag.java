package com.ruoyi.blog.mould;

import com.ruoyi.cms.common.mould.base.BaseTag;

public class BlogTag extends BaseTag {

    //标签数量统计
    private Long tagCount;

    public Long getTagCount() {
        return tagCount;
    }

    public void setTagCount(Long tagCount) {
        this.tagCount = tagCount;
    }
}
