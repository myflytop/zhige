package com.oly.web.mould;

import com.oly.common.model.entity.base.BaseTag;
import com.oly.common.model.enums.CommonVisibleEnums;

public class BlogTag extends BaseTag {

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
