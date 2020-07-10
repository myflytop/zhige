package com.ruoyi.blog.mould;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * 文章基本展示需要的字段
 */
public class BlogArticleSort implements Serializable {

    //文章Id
    private Long articleId;

    private String articleTitle;

    private String articleUrl;

    private Byte articleTop;

    private String articleImg;

    private Byte articleType;

    /**状态 2标识 文章通过审核*/
    private Byte visible;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    public Byte getVisible() {
        return visible;
    }

    public void setVisible(Byte visible) {
        this.visible = visible;
    }

    public Byte getArticleType() {
        return articleType;
    }

    public void setArticleType(Byte articleType) {
        this.articleType = articleType;
    }

    public Long getArticleId() {
        return articleId;
    }

    public void setArticleId(Long articleId) {
        this.articleId = articleId;
    }

    public String getArticleTitle() {
        return articleTitle;
    }

    public void setArticleTitle(String articleTitle) {
        this.articleTitle = articleTitle;
    }

    public String getArticleUrl() {
        return articleUrl;
    }

    public void setArticleUrl(String articleUrl) {
        this.articleUrl = articleUrl;
    }

    public Byte getArticleTop() {
        return articleTop;
    }

    public void setArticleTop(Byte articleTop) {
        this.articleTop = articleTop;
    }

    public String getArticleImg() {
        return articleImg;
    }

    public void setArticleImg(String articleImg) {
        this.articleImg = articleImg;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }


}