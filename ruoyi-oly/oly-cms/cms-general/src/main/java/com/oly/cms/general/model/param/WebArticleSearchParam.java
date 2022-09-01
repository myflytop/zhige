package com.oly.cms.general.model.param;

import java.io.Serializable;

/**
 * 文章请求参数
 */
public class WebArticleSearchParam implements Serializable {
    private static final long serialVersionUID = 1L;
    /* 标题 */
    private String articleTitle;
    /* 编辑器 */
    private Integer articleBuild;
    /* 文章类型 */
    private Integer articleType;
    /* 创建人 */
    private Long createBy;
    /* 类别 */
    private Long catId;
    /* 标签 */
    private Long tagId;
    /* 顶置类型 */
    private Integer articleTop;
    /* 主题名 */
    private String themeName;
    /* 开始时间 如2022-08 */
    private String crTime;

    public String getArticleTitle() {
        return articleTitle;
    }

    public void setArticleTitle(String articleTitle) {
        this.articleTitle = articleTitle;
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

    /**
     * @return the articleBuild
     */
    public Integer getArticleBuild() {
        return articleBuild;
    }

    /**
     * @param articleBuild the articleBuild to set
     */
    public void setArticleBuild(Integer articleBuild) {
        this.articleBuild = articleBuild;
    }

    /**
     * @return the articleType
     */
    public Integer getArticleType() {
        return articleType;
    }

    /**
     * @param articleType the articleType to set
     */
    public void setArticleType(Integer articleType) {
        this.articleType = articleType;
    }

    /**
     * @return the articleTop
     */
    public Integer getArticleTop() {
        return articleTop;
    }

    /**
     * @param articleTop the articleTop to set
     */
    public void setArticleTop(Integer articleTop) {
        this.articleTop = articleTop;
    }

    /**
     * @return the themeName
     */
    public String getThemeName() {
        return themeName;
    }

    /**
     * @param themeName the themeName to set
     */
    public void setThemeName(String themeName) {
        this.themeName = themeName;
    }

    public String getCrTime() {
        return crTime;
    }

    public void setCrTime(String crTime) {
        this.crTime = crTime;
    }

}
