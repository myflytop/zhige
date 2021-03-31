package com.oly.web.mould;

import java.util.List;

import com.oly.common.model.entity.base.BaseArticle;

/**
 * 所有文章字段
 */
public class BlogArticle extends BaseArticle {

    /**
     *
     */
    private static final long serialVersionUID = 653673311404721257L;

    private List<BlogCat> blogCats;

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
