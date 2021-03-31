package com.oly.web.mould;

import java.util.List;

import com.oly.common.model.entity.base.BaseColumn;
import com.oly.common.model.enums.CommonVisibleEnums;

/*文章菜单*/
public class BlogMenu extends BaseColumn {
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
    private List<BlogMenu> childMenus;

    public List<BlogMenu> getChildMenus() {
        return childMenus;
    }

    public void setChildMenus(List<BlogMenu> childMenus) {
        this.childMenus = childMenus;
    }
  


}
