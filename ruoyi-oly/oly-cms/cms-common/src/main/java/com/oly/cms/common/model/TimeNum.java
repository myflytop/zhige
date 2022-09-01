package com.oly.cms.common.model;

import java.io.Serializable;

public class TimeNum implements Serializable {
    private static final long serialVersionUID = 1L;
    private String ym;
    private Integer num;

    public String getYm() {
        return ym;
    }

    public void setYm(String ym) {
        this.ym = ym;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

}
