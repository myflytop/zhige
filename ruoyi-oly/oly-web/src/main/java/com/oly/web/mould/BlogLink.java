package com.oly.web.mould;

import com.oly.common.model.entity.base.BaseLink;
import com.oly.common.model.enums.CommonVisibleEnums;

/*文章链接*/
public class BlogLink extends BaseLink {

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
   

}
