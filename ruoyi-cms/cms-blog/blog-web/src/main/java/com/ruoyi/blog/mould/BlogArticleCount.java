package com.ruoyi.blog.mould;

import java.io.Serializable;

/**
 * 文章用户行为 喜欢。。。
 */
public class BlogArticleCount implements Serializable {
    private static final long serialVersionUID = 1L;
    /** 文章Id */
    private Long articleId;

    private Long articleLook;


    private Long articleLike;


    private Long articleNasty;


    private Long articleDiscuss;


    private Double articleScore;


    private Long articleShare;


    private Long articleCollect;

    public Long getArticleId() {
        return articleId;
    }

    public void setArticleId(Long articleId) {
        this.articleId = articleId;
    }

    public Long getArticleLook() {
        return articleLook;
    }

    public void setArticleLook(Long articleLook) {
        this.articleLook = articleLook;
    }

    public Long getArticleLike() {
        return articleLike;
    }

    public void setArticleLike(Long articleLike) {
        this.articleLike = articleLike;
    }

    public Long getArticleNasty() {
        return articleNasty;
    }

    public void setArticleNasty(Long articleNasty) {
        this.articleNasty = articleNasty;
    }

    public Long getArticleDiscuss() {
        return articleDiscuss;
    }

    public void setArticleDiscuss(Long articleDiscuss) {
        this.articleDiscuss = articleDiscuss;
    }

    public Double getArticleScore() {
        return articleScore;
    }

    public void setArticleScore(Double articleScore) {
        this.articleScore = articleScore;
    }

    public Long getArticleShare() {
        return articleShare;
    }

    public void setArticleShare(Long articleShare) {
        this.articleShare = articleShare;
    }

    public Long getArticleCollect() {
        return articleCollect;
    }

    public void setArticleCollect(Long articleCollect) {
        this.articleCollect = articleCollect;
    }
}
