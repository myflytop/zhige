package com.ruoyi.blog.mould;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.cms.common.mould.base.BaseColumn;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
/*文章菜单*/
public class BlogMenu extends BaseColumn {
    private List<BlogMenu> childMenus;


    public List<BlogMenu> getChildMenus() {
        return childMenus;
    }

    public void setChildMenus(List<BlogMenu> childMenus) {
        this.childMenus = childMenus;
    }


}
