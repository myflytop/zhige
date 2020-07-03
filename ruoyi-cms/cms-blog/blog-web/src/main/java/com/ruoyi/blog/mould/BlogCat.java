package com.ruoyi.blog.mould;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.cms.common.mould.base.BaseCat;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 文章分类
 */
public class BlogCat extends BaseCat {

    private long catCount;
    // 子菜单列表
    private List<BlogCat> children = new ArrayList<>();


    public long getCatCount() {
        return catCount;
    }

    public void setCatCount(long catCount) {
        this.catCount = catCount;
    }

    public List<BlogCat> getChildren() {
        return children;
    }

    public void setChildren(List<BlogCat> children) {
        this.children = children;
    }


}
