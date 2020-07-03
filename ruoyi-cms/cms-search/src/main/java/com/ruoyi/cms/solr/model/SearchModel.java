package com.ruoyi.cms.solr.model;

import org.apache.solr.client.solrj.beans.Field;

import java.io.Serializable;
import java.util.Date;

public class SearchModel implements Serializable {

    //文章Id
    @Field("article_id")
    private Long articleId;

    //文章标题
    @Field("article_title")
    private String articleTitle;

    //文章url
    @Field("article_url")
    private String articleUrl;

    //缩略图路径
    @Field("article_img")
    private String articleImg;

    //文章简介
    @Field("article_summary")
    private String articleSummary;

    //内容
    @Field("article_content")
    private String articleContent;

    //创建时间
    @Field("article_time")
    private Date createTime;

    /*//文章类型
    private String articleType;

    //标签+分类
    private String tags;

    //关键词
    private String keywords;

    //评论数
    private long commentCount;

    //喜欢数
    private long likeCount;

    //评分
    private long score;

    //分享数
    private long shareCount;

    //收藏数
    private long collectionCount;

    //SEO描述
    private String description;

    //创建人
    private String createBy;*/

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

    public String getArticleImg() {
        return articleImg;
    }

    public void setArticleImg(String articleImg) {
        this.articleImg = articleImg;
    }

    public String getArticleSummary() {
        return articleSummary;
    }

    public void setArticleSummary(String articleSummary) {
        this.articleSummary = articleSummary;
    }

    public String getArticleContent() {
        return articleContent;
    }

    public void setArticleContent(String articleContent) {
        this.articleContent = articleContent;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}