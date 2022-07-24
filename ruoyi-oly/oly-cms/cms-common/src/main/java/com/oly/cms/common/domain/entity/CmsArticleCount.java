package com.oly.cms.common.domain.entity;

import com.ruoyi.common.annotation.Excel;

public class CmsArticleCount extends CmsArticle {
    private static final long serialVersionUID = 1L;

    /** 浏览数 */
    @Excel(name = "浏览数")
    private Long articleLook;

    /** 喜欢数 */
    @Excel(name = "喜欢数")
    private Long articleLike;

    /** 不喜欢数 */
    @Excel(name = "不喜欢数")
    private Long articleNasty;

    /** 讨论数 */
    @Excel(name = "讨论数")
    private Long articleDiscuss;

    /** 评分 */
    @Excel(name = "评分")
    private Double articleScore;

    /** 分享数 */
    @Excel(name = "分享数")
    private Long articleShare;

    /** 收藏数 */
    @Excel(name = "收藏数")
    private Long articleCollect;

    public void setArticleLook(Long articleLook) {
        this.articleLook = articleLook;
    }

    public Long getArticleLook() {
        return articleLook;
    }

    public void setArticleLike(Long articleLike) {
        this.articleLike = articleLike;
    }

    public Long getArticleLike() {
        return articleLike;
    }

    public void setArticleNasty(Long articleNasty) {
        this.articleNasty = articleNasty;
    }

    public Long getArticleNasty() {
        return articleNasty;
    }

    public void setArticleDiscuss(Long articleDiscuss) {
        this.articleDiscuss = articleDiscuss;
    }

    public Long getArticleDiscuss() {
        return articleDiscuss;
    }

    public void setArticleScore(Double articleScore) {
        this.articleScore = articleScore;
    }

    public Double getArticleScore() {
        return articleScore;
    }

    public void setArticleShare(Long articleShare) {
        this.articleShare = articleShare;
    }

    public Long getArticleShare() {
        return articleShare;
    }

    public void setArticleCollect(Long articleCollect) {
        this.articleCollect = articleCollect;
    }

    public Long getArticleCollect() {
        return articleCollect;
    }
}
