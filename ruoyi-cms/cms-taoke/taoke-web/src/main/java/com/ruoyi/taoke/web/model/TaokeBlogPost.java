package com.ruoyi.taoke.web.model;

import com.ruoyi.blog.mould.BlogArticle;

public class TaokeBlogPost {
    private TaokeModel taokeModel;

    private BlogArticle blogArticle;

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
