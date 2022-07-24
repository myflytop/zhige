package com.oly.cms.admin.model.po.record;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 文章关联主题对象 cms_atricle_theme
 * 
 * @author ruoyi
 * @date 2022-05-24
 */
public class CmsAtricleTheme extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** 文章ID */
    private Long articleId;

    /** 主题名 */
    private String themeName;

    public void setArticleId(Long articleId) {
        this.articleId = articleId;
    }

    public Long getArticleId() {
        return articleId;
    }

    public void setThemeName(String themeName) {
        this.themeName = themeName;
    }

    public String getThemeName() {
        return themeName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE).append("articleId", getArticleId())
                .append("themeName", getThemeName()).toString();
    }
}
