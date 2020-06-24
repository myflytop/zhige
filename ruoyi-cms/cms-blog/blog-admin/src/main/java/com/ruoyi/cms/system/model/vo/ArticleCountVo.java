package com.ruoyi.cms.system.model.vo;

public class ArticleCountVo  {
    private Long articleId;
    private Long articleLook;
    private Long articleLike;
    private Long articleDislike;
    private Long articleDiscuss;
    private Double articleScore;

    public void setArticleId(Long articleId) {
        this.articleId = articleId;
    }

    public void setArticleLook(Long articleLook) {
        this.articleLook = articleLook;
    }

    public void setArticleLike(Long articleLike) {
        this.articleLike = articleLike;
    }

    public void setArticleDislike(Long articleDislike) {
        this.articleDislike = articleDislike;
    }

    public void setArticleDiscuss(Long articleDiscuss) {
        this.articleDiscuss = articleDiscuss;
    }

    public void setArticleScore(Double articleScore) {
        this.articleScore = articleScore;
    }

    public Long getArticleId() {
        return articleId;
    }

    public Long getArticleLook() {
        return articleLook;
    }

    public Long getArticleLike() {
        return articleLike;
    }

    public Long getArticleDislike() {
        return articleDislike;
    }

    public Long getArticleDiscuss() {
        return articleDiscuss;
    }

    public Double getArticleScore() {
        return articleScore;
    }
}
