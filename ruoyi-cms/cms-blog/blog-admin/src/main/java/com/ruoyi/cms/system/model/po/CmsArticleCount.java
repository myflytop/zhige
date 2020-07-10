package com.ruoyi.cms.system.model.po;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 文章统计对象 cms_article_count
 * 
 * @author ruoyi
 * @date 2020-04-06
 */
public class CmsArticleCount extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 文章Id */
    private Long articleId;
    /** 浏文章标题 */
    @Excel(name = "标题")
    private String articleTitle;

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

    public String getArticleTitle() {
        return articleTitle;
    }

    public void setArticleTitle(String articleTitle) {
        this.articleTitle = articleTitle;
    }

    public void setArticleId(Long articleId)
    {
        this.articleId = articleId;
    }

    public Long getArticleId() 
    {
        return articleId;
    }
    public void setArticleLook(Long articleLook) 
    {
        this.articleLook = articleLook;
    }

    public Long getArticleLook() 
    {
        return articleLook;
    }
    public void setArticleLike(Long articleLike) 
    {
        this.articleLike = articleLike;
    }

    public Long getArticleLike() 
    {
        return articleLike;
    }
    public void setArticleNasty(Long articleNasty)
    {
        this.articleNasty = articleNasty;
    }

    public Long getArticleNasty()
    {
        return articleNasty;
    }
    public void setArticleDiscuss(Long articleDiscuss) 
    {
        this.articleDiscuss = articleDiscuss;
    }

    public Long getArticleDiscuss() 
    {
        return articleDiscuss;
    }
    public void setArticleScore(Double articleScore) 
    {
        this.articleScore = articleScore;
    }

    public Double getArticleScore() 
    {
        return articleScore;
    }
    public void setArticleShare(Long articleShare) 
    {
        this.articleShare = articleShare;
    }

    public Long getArticleShare() 
    {
        return articleShare;
    }
    public void setArticleCollect(Long articleCollect) 
    {
        this.articleCollect = articleCollect;
    }

    public Long getArticleCollect() 
    {
        return articleCollect;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("articleId", getArticleId())
            .append("articleLook", getArticleLook())
            .append("articleLike", getArticleLike())
            .append("articleNasty", getArticleNasty())
            .append("articleDiscuss", getArticleDiscuss())
            .append("articleScore", getArticleScore())
            .append("articleShare", getArticleShare())
            .append("articleCollect", getArticleCollect())
            .toString();
    }
}
