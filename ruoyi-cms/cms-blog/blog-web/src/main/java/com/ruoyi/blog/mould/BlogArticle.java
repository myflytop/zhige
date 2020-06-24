package com.ruoyi.blog.mould;


import java.util.List;

/**
 * 所有文章字段
 */
public class BlogArticle extends BlogArticleSort {

    private String articleSummary;

    private Boolean allowComment;

    private String keyword;

    private String articleContent;

    private Byte articleBuild;

    private String reprintUrl;

    private Long createBy;

    private  List<BlogCat> blogCats;

    private List<BlogTag> blogTags;

    private BlogArticleCount blogArticleCount;

    public BlogArticleCount getBlogArticleCount() {
        return blogArticleCount;
    }

    public void setBlogArticleCount(BlogArticleCount blogArticleCount) {
        this.blogArticleCount = blogArticleCount;
    }

    public Byte getArticleBuild() {
        return articleBuild;
    }

    public void setArticleBuild(Byte articleBuild) {
        this.articleBuild = articleBuild;
    }

    public String getReprintUrl() {
        return reprintUrl;
    }

    public void setReprintUrl(String reprintUrl) {
        this.reprintUrl = reprintUrl;
    }

    public String getArticleSummary() {
        return articleSummary;
    }

    public void setArticleSummary(String articleSummary) {
        this.articleSummary = articleSummary;
    }

    public Boolean getAllowComment() {
        return allowComment;
    }

    public void setAllowComment(Boolean allowComment) {
        this.allowComment = allowComment;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getArticleContent() {
        return articleContent;
    }

    public void setArticleContent(String articleContent) {
        this.articleContent = articleContent;
    }

    public Long getCreateBy() {
        return createBy;
    }

    public void setCreateBy(Long createBy) {
        this.createBy = createBy;
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
