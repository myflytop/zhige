package com.ruoyi.cms.common.mould.base;

import com.ruoyi.common.annotation.Excel;

public class BaseArticle extends SeoBaseModel{
    private static final long serialVersionUID = -4796285731272251639L;
    //文章Id
    private Long articleId;
    //文章链接
    @Excel(name = "文章名")
    private String articleTitle;

    // 转载url
    @Excel(name = "转载路径")
    private String reprintUrl;

    // 固定链接
    @Excel(name = "固定链接")
    private String articleUrl;

    //文章类型
    @Excel(name = "文章类型")
    private Byte articleType;

    // 文章编辑器
    @Excel(name = "编辑器")
    private Byte articleBuild;

    // 顶置级别
    @Excel(name = "顶置级别")
    private Byte articleTop;

    //文章预览图
    @Excel(name = "预览图")
    private String articleImg;

    // 文章简介
    @Excel(name = "文章简介")
    private String articleSummary;

    //是否允许评论
    @Excel(name = "是否开启评论")
    private Boolean allowComment;

    //文章内容
    @Excel(name = "文章内容")
    private String articleContent;

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

    public String getReprintUrl() {
        return reprintUrl;
    }

    public void setReprintUrl(String reprintUrl) {
        this.reprintUrl = reprintUrl;
    }

    public String getArticleUrl() {
        return articleUrl;
    }

    public void setArticleUrl(String articleUrl) {
        this.articleUrl = articleUrl;
    }

    public Byte getArticleType() {
        return articleType;
    }

    public void setArticleType(Byte articleType) {
        this.articleType = articleType;
    }

    public Byte getArticleBuild() {
        return articleBuild;
    }

    public void setArticleBuild(Byte articleBuild) {
        this.articleBuild = articleBuild;
    }

    public Byte getArticleTop() {
        return articleTop;
    }

    public void setArticleTop(Byte articleTop) {
        this.articleTop = articleTop;
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

    public Boolean getAllowComment() {
        return allowComment;
    }

    public void setAllowComment(Boolean allowComment) {
        this.allowComment = allowComment;
    }

    public String getArticleContent() {
        return articleContent;
    }

    public void setArticleContent(String articleContent) {
        this.articleContent = articleContent;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("com.ruoyi.cms.common.mould.base.BaseArticle{");
        sb.append("articleId=").append(articleId);
        sb.append(", articleTitle='").append(articleTitle).append('\'');
        sb.append(", reprintUrl='").append(reprintUrl).append('\'');
        sb.append(", articleUrl='").append(articleUrl).append('\'');
        sb.append(", articleType=").append(articleType);
        sb.append(", articleBuild=").append(articleBuild);
        sb.append(", articleTop=").append(articleTop);
        sb.append(", articleImg='").append(articleImg).append('\'');
        sb.append(", articleSummary='").append(articleSummary).append('\'');
        sb.append(", allowComment=").append(allowComment);
        sb.append(", articleContent='").append(articleContent).append('\'');
        sb.append(", keywords='").append(getKeywords()).append('\'');
        sb.append(", description='").append(getDescription()).append('\'');
        sb.append(", visible=").append(getVisible());
        sb.append(", perms='").append(getPerms()).append('\'');
        sb.append(", createBy=").append(getCreateBy());
        sb.append(", createTime=").append(getCreateTime());
        sb.append(", updateBy=").append(getUpdateBy());
        sb.append(", updateTime=").append(getUpdateTime());
        sb.append(", remark='").append(getRemark()).append('\'');
        sb.append(", searchValue='").append(getSearchValue()).append('\'');
        sb.append(", params=").append(getParams());
        sb.append('}');
        return sb.toString();
    }
}
