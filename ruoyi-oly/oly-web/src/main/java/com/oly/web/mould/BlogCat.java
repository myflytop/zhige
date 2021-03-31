package com.oly.web.mould;

import java.util.ArrayList;
import java.util.List;

import com.oly.common.model.entity.base.BaseCat;
import com.oly.common.model.enums.CommonVisibleEnums;

/**
 * 文章分类
 */
public class BlogCat extends BaseCat {

    private Byte visible;

    /**
     *
     */
    private static final long serialVersionUID = 1L;
    @Override
    public Byte getVisible() {
        if(visible==null)
        {
            return visible;
        }
        if(visible==CommonVisibleEnums.HIDE.ordinal()){
            visible=(byte)CommonVisibleEnums.SHOW.ordinal();
        }
        return visible;
    }

    @Override
    public void setVisible(Byte visible) {
        this.visible = visible;
    }
    // 子分类列表
    private List<BlogCat> children = new ArrayList<>();

   

    public List<BlogCat> getChildren() {
        return children;
    }

    public void setChildren(List<BlogCat> children) {
        this.children = children;
    }
}
