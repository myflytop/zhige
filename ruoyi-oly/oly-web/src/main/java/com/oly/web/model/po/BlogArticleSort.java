package com.oly.web.model.po;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * 文章基本展示需要的字段
 */
public class BlogArticleSort implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 1L;



    private Byte articleTop;


    private Byte articleType;

    /** 状态 2标识 文章通过审核 */
    private Byte visible;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    public static long getSerialversionuid() {
        return serialVersionUID;
    }

    public Byte getArticleTop() {
        return articleTop;
    }

    public void setArticleTop(Byte articleTop) {
        this.articleTop = articleTop;
    }

    public Byte getArticleType() {
        return articleType;
    }

    public void setArticleType(Byte articleType) {
        this.articleType = articleType;
    }

    public Byte getVisible() {
        return visible;
    }

    public void setVisible(Byte visible) {
        this.visible = visible;
    }

    
}