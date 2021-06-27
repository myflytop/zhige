package com.oly.web.model.po;

import java.util.ArrayList;
import java.util.List;

import com.oly.common.model.entity.base.BaseCat;

/**
 * 文章分类
 */
public class BlogCat extends BaseCat {

    private static final long serialVersionUID = 1L;
  
    // 子分类列表
    private List<BlogCat> childCats = new ArrayList<>();

   

    public List<BlogCat> getChildCats() {
        return childCats;
    }

    public void setChildCats(List<BlogCat> childCats) {
        this.childCats = childCats;
    }
}
