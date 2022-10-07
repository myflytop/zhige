package com.oly.cms.common.domain.entity;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import com.oly.cms.common.domain.SeoBaseModel;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.URL;

public class CmsArticle extends SeoBaseModel {
    private static final long serialVersionUID = -4796285731272251639L;

    /** 文章id */
    private Long articleId;

    /** 文章标题 */
    private String articleTitle;

    /** 文章类型 */
    private Integer articleType;

    /** 文章内容 */
    private String articleContent;

    /** 编译器 */
    private Integer articleBuild;

    /** 顶置级别 */
    private Integer articleTop;

    /** 预览缩略图 */
    private String articleImg;

    /** 文章预览 */
    private String articleSummary;

    /** 是否允许回复 0关闭 1开启 */
    private Boolean allowComment;

    /** 转载url */
    private String reprintUrl;

    /** 文章链接别名 */
    private String articleUrl;

    /** md源码 */
    private String articleMd;

    public void setArticleId(Long articleId) {
        this.articleId = articleId;
    }

    public Long getArticleId() {
        return articleId;
    }

    public void setArticleTitle(String articleTitle) {
        this.articleTitle = articleTitle;
    }

    @NotBlank(message = "文章标题不能为空")
    @Length(min = 2, max = 32, message = "文章标题限制2到32个字符")
    public String getArticleTitle() {
        return articleTitle;
    }

    public void setArticleType(Integer articleType) {
        this.articleType = articleType;
    }

    @NotNull(message = "文章类型不能为空")
    public Integer getArticleType() {
        return articleType;
    }

    public void setArticleContent(String articleContent) {
        this.articleContent = articleContent;
    }

    @NotBlank(message = "文章内容不能为空")
    @Length(min = 16, message = "文章内容限制至少16个字符")
    public String getArticleContent() {
        return articleContent;
    }

    public void setArticleBuild(Integer articleBuild) {
        this.articleBuild = articleBuild;
    }

    @NotNull(message = "编辑器类型不能为空")
    public Integer getArticleBuild() {
        return articleBuild;
    }

    public void setArticleTop(Integer articleTop) {
        this.articleTop = articleTop;
    }

    public Integer getArticleTop() {
        return articleTop;
    }

    public void setArticleImg(String articleImg) {
        this.articleImg = articleImg;
    }

    public String getArticleImg() {
        return articleImg;
    }

    public void setArticleSummary(String articleSummary) {
        this.articleSummary = articleSummary;
    }

    @Length(min = 0, max = 256, message = "文章预览限制最多个字符")
    public String getArticleSummary() {
        return articleSummary;
    }

    public void setAllowComment(Boolean allowComment) {
        this.allowComment = allowComment;
    }

    @NotNull(message = "评论不能为空")
    public Boolean getAllowComment() {
        return allowComment;
    }

    public void setReprintUrl(String reprintUrl) {
        this.reprintUrl = reprintUrl;
    }

    @URL(message = "转载必须为链接")
    @Length(min = 0, max = 128, message = "转载链接限制最多128个字符")
    public String getReprintUrl() {
        return reprintUrl;
    }

    public void setArticleUrl(String articleUrl) {
        this.articleUrl = articleUrl;
    }

    @NotBlank(message = "固定链接不能为空")
    @Length(min = 0, max = 128, message = "固定链接限制最多128个字符")
    public String getArticleUrl() {
        return articleUrl;
    }

    public void setArticleMd(String articleMd) {
        this.articleMd = articleMd;
    }

    public String getArticleMd() {
        return articleMd;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE).append("articleId", getArticleId())
                .append("articleTitle", getArticleTitle()).append("createBy", getCreateBy())
                .append("createTime", getCreateTime()).append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime()).append("articleType", getArticleType())
                .append("articleContent", getArticleContent()).append("articleBuild", getArticleBuild())
                .append("articleTop", getArticleTop()).append("articleImg", getArticleImg())
                .append("articleSummary", getArticleSummary()).append("visible", getVisible())
                .append("allowComment", getAllowComment()).append("reprintUrl", getReprintUrl())
                .append("articleUrl", getArticleUrl()).append("keywords", getKeywords())
                .append("description", getDescription()).append("articleMd", getArticleMd()).toString();
    }
}