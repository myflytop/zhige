package com.oly.cms.common.domain.entity;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.oly.cms.common.domain.SeoBaseModel;

public class CmsTag extends SeoBaseModel {
    private static final long serialVersionUID = 1L;
    /* 标签id */
    private Long tagId;
    /* 标签名 */
    private String tagName;
    /* 标签链接 */
    private String tagUrl;
    /* 标签图标(可以是图片地址) */
    private String tagIco;
    /* 标签类型 */
    private Integer tagType;
    /* 关联文章数量 */
    private Long tagCount;

    /* 关联文章数量 文章通过审核 */
    private Long tagPassCount;

    public void setTagCount(Long tagCount) {
        this.tagCount = tagCount == null ? 0 : tagCount;
    }

    public Long getTagCount() {
        return tagCount;
    }

    public String getTagIco() {

        return tagIco;
    }

    public void setTagIco(String tagIco) {
        this.tagIco = tagIco;
    }

    public void setTagId(Long tagId) {
        this.tagId = tagId;
    }

    public void setTagName(String tagName) {
        this.tagName = tagName;
    }

    public void setTagUrl(String tagUrl) {
        this.tagUrl = tagUrl;
    }

    public Long getTagId() {
        return tagId;
    }

    @NotBlank(message = "标签名不能为空")
    @Length(min = 2, max = 8, message = "标签名限制2到8个字符")
    public String getTagName() {
        return tagName;
    }

    @Length(min = 0, max = 64, message = "标签路径限制64个字符")
    public String getTagUrl() {
        return tagUrl;
    }

    @NotNull(message = "标签类型不能为空")
    public Integer getTagType() {
        return tagType;
    }

    public void setTagType(Integer tagType) {
        this.tagType = tagType;
    }

    public Long getTagPassCount() {
        return tagPassCount;
    }

    public void setTagPassCount(Long tagPassCount) {
        this.tagPassCount = tagPassCount;
    }

}
