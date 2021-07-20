package com.oly.web.model;

import com.oly.web.model.po.BlogArticle;

public class TaokeBlogPost {

    private Long articleId;

    private TaokeModel taokeModel;

    private BlogArticle blogArticle;

    /**
     * @return the articleId
     */
    public Long getArticleId() {
        return articleId;
    }

    /**
     * @param articleId the articleId to set
     */
    public void setArticleId(Long articleId) {
        this.articleId = articleId;
    }

    public BlogArticle getBlogArticle() {
        return blogArticle;
    }

    public void setBlogArticle(BlogArticle blogArticle) {
        this.blogArticle = blogArticle;
    }

    public TaokeBlogPost() {
    }

    public TaokeModel getTaokeModel() {
        return taokeModel;
    }

    public void setTaokeModel(TaokeModel taokeModel) {
        this.taokeModel = taokeModel;
    }
}
