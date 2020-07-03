package com.ruoyi.blog.mould.pam;



import java.io.Serializable;

import java.util.Map;

/**
 * 文章请求参数
 */
public class BlogArticleSearchParam implements Serializable {
    private static final long serialVersionUID = 1L;
    /*标题*/
    private String articleTitle;
    /*编辑器*/
    private Byte articleBuild;
    /*文章类型*/
    private Byte articleType;
    /*创建人*/
    private Long createBy;
    /*类别*/
    private Long catId;
   /* 标签*/
    private Long tagId;
    /*顶置类型*/
    private Byte articleTop;
    /* 请求参数 */
    private Map<String, Object> params;

    public String getArticleTitle() {
        return articleTitle;
    }

    public void setArticleTitle(String articleTitle) {
        this.articleTitle = articleTitle;
    }

    public Byte getArticleBuild() {
        return articleBuild;
    }

    public void setArticleBuild(Byte articleBuild) {
        this.articleBuild = articleBuild;
    }

    public Byte getArticleType() {
        return articleType;
    }

    public void setArticleType(Byte articleType) {
        this.articleType = articleType;
    }

    public Long getCreateBy() {
        return createBy;
    }

    public void setCreateBy(Long createBy) {
        this.createBy = createBy;
    }

    public Long getCatId() {
        return catId;
    }

    public void setCatId(Long catId) {
        this.catId = catId;
    }

    public Long getTagId() {
        return tagId;
    }

    public void setTagId(Long tagId) {
        this.tagId = tagId;
    }

    public Byte getArticleTop() {
        return articleTop;
    }

    public void setArticleTop(Byte articleTop) {
        this.articleTop = articleTop;
    }

    public Map<String, Object> getParams() {
        return params;
    }

    public void setParams(Map<String, Object> params) {
        this.params = params;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("BlogSearchParam{");
        sb.append("articleTitle='").append(articleTitle).append('\'');
        sb.append(", articleBuild=").append(articleBuild);
        sb.append(", articleType=").append(articleType);
        sb.append(", createBy=").append(createBy);
        sb.append(", catId=").append(catId);
        sb.append(", tagId=").append(tagId);
        sb.append(", articleTop=").append(articleTop);
        sb.append(", params=").append(params);
        sb.append('}');
        return sb.toString();
    }
}
