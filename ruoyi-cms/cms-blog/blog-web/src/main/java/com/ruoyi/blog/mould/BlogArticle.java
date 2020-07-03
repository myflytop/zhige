package com.ruoyi.blog.mould;


import com.ruoyi.cms.common.mould.base.BaseArticle;

import java.util.List;

/**
 * 所有文章字段
 */
public class BlogArticle extends BaseArticle {

    private  List<BlogCat> blogCats;

    private List<BlogTag> blogTags;

    private BlogArticleCount blogArticleCount;

    public BlogArticleCount getBlogArticleCount() {
        return blogArticleCount;
    }

    public void setBlogArticleCount(BlogArticleCount blogArticleCount) {
        this.blogArticleCount = blogArticleCount;
    }

    public List<BlogCat> getBlogCats() {
        return blogCats;
    }

    public void setBlogCats(List<BlogCat> blogCats) {
        this.blogCats = blogCats;
    }

    public List<BlogTag> getBlogTags() {
        return blogTags;
    }

    public void setBlogTags(List<BlogTag> blogTags) {
        this.blogTags = blogTags;
    }



}
