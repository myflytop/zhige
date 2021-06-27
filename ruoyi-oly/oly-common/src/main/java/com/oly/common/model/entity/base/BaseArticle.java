package com.oly.common.model.entity.base;

import com.ruoyi.common.annotation.Excel;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class BaseArticle extends SeoBaseModel {
    private static final long serialVersionUID = -4796285731272251639L;
 
    /** 文章id */
    @Excel(name = "文章id")
    private Long articleId;

    /** 文章标题 */
    @Excel(name = "文章标题")
    private String articleTitle;

    /** 文章类型 */
    @Excel(name = "文章类型")
    private Integer articleType;

    /** 文章内容 */
    @Excel(name = "文章内容")
    private String articleContent;

    /** 编译器 */
    @Excel(name = "编译器")
    private Integer articleBuild;

    /** 顶置级别 */
    @Excel(name = "顶置级别")
    private Integer articleTop;

    /** 预览缩略图 */
    @Excel(name = "预览缩略图")
    private String articleImg;

    /** 文章预览 */
    @Excel(name = "文章预览")
    private String articleSummary;

    /** 是否允许回复 0关闭 1开启 */
    @Excel(name = "是否允许回复 0关闭 1开启")
    private Boolean allowComment;

    /** 转载url */
    @Excel(name = "转载url")
    private String reprintUrl;

    /** 文章链接别名 */
    @Excel(name = "文章链接别名")
    private String articleUrl;

    /** 文章目录 */
    @Excel(name = "文章目录")
    private String articleToc;

    /** md源码 */
    @Excel(name = "md源码")
    private String articleMd;

    public void setArticleId(Long articleId) 
    {
        this.articleId = articleId;
    }

    public Long getArticleId() 
    {
        return articleId;
    }
    public void setArticleTitle(String articleTitle) 
    {
        this.articleTitle = articleTitle;
    }

    public String getArticleTitle() 
    {
        return articleTitle;
    }
    public void setArticleType(Integer articleType) 
    {
        this.articleType = articleType;
    }

    public Integer getArticleType() 
    {
        return articleType;
    }
    public void setArticleContent(String articleContent) 
    {
        this.articleContent = articleContent;
    }

    public String getArticleContent() 
    {
        return articleContent;
    }
    public void setArticleBuild(Integer articleBuild) 
    {
        this.articleBuild = articleBuild;
    }

    public Integer getArticleBuild() 
    {
        return articleBuild;
    }
    public void setArticleTop(Integer articleTop) 
    {
        this.articleTop = articleTop;
    }

    public Integer getArticleTop() 
    {
        return articleTop;
    }
    public void setArticleImg(String articleImg) 
    {
        this.articleImg = articleImg;
    }

    public String getArticleImg() 
    {
        return articleImg;
    }
    public void setArticleSummary(String articleSummary) 
    {
        this.articleSummary = articleSummary;
    }

    public String getArticleSummary() 
    {
        return articleSummary;
    }

    public void setAllowComment(Boolean allowComment) 
    {
        this.allowComment = allowComment;
    }

    public Boolean getAllowComment() 
    {
        return allowComment;
    }
    public void setReprintUrl(String reprintUrl) 
    {
        this.reprintUrl = reprintUrl;
    }

    public String getReprintUrl() 
    {
        return reprintUrl;
    }
    public void setArticleUrl(String articleUrl) 
    {
        this.articleUrl = articleUrl;
    }

    public String getArticleUrl() 
    {
        return articleUrl;
    }
    public void setArticleToc(String articleToc) 
    {
        this.articleToc = articleToc;
    }

    public String getArticleToc() 
    {
        return articleToc;
    }
    public void setArticleMd(String articleMd) 
    {
        this.articleMd = articleMd;
    }

    public String getArticleMd() 
    {
        return articleMd;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("articleId", getArticleId())
            .append("articleTitle", getArticleTitle())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("articleType", getArticleType())
            .append("articleContent", getArticleContent())
            .append("articleBuild", getArticleBuild())
            .append("articleTop", getArticleTop())
            .append("articleImg", getArticleImg())
            .append("articleSummary", getArticleSummary())
            .append("visible", getVisible())
            .append("allowComment", getAllowComment())
            .append("reprintUrl", getReprintUrl())
            .append("articleUrl", getArticleUrl())
            .append("keywords", getKeywords())
            .append("description", getDescription())
            .append("articleToc", getArticleToc())
            .append("articleMd", getArticleMd())
            .toString();
    }
}