package com.oly.web.model.po;

import java.util.List;

import com.oly.common.model.entity.base.BaseColumn;

/*文章菜单*/
public class BlogMenu extends BaseColumn {

    private static final long serialVersionUID = 1L;
 
    private List<BlogMenu> childMenus;

    public List<BlogMenu> getChildMenus() {
        return childMenus;
    }

    public void setChildMenus(List<BlogMenu> childMenus) {
        this.childMenus = childMenus;
    }
  


}
