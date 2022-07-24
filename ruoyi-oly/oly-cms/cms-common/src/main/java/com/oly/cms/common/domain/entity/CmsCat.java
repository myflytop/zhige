package com.oly.cms.common.domain.entity;

import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.oly.cms.common.domain.SeoBaseModel;

public class CmsCat extends SeoBaseModel {
    private static final long serialVersionUID = 1L;
    /* 分类id */
    private Long catId;
    /* 分类名 */
    private String catName;
    /* 祖级列表 */
    private String ancestors;
    /* 分类图标 */
    private String catIcon;
    /* 固定链接 */
    private String catUrl;
    /* 父亲id */
    private Long parentId;
    /* 节点类型 */
    private Integer parent;
    /* 关联文章数 */
    private Long catCount;
    /* 关联文章数 文章通过审核 */
    private Long catPassCount;
    /* 分类类型 */
    private Integer catType;

    private List<CmsCat> childList;

    public List<CmsCat> getChildList() {
        return childList;
    }

    public void setChildList(List<CmsCat> childList2) {
        this.childList = childList2;
    }

    public void setCatCount(Long catCount) {

        this.catCount = catCount == null ? 0 : catCount;
    }

    public Long getCatCount() {
        return catCount;
    }

    public Long getCatId() {
        return catId;
    }

    public void setCatId(Long catId) {
        this.catId = catId;
    }

    @NotBlank(message = "分类名不能为空")
    @Length(min = 2, max = 8, message = "分类名限制2到8个字符")
    public String getCatName() {
        return catName;
    }

    public void setCatName(String catName) {
        this.catName = catName == null ? null : catName.trim();
    }

    @Length(max = 128, message = "分类ICO最多限制128个字符")
    public String getCatIcon() {
        return catIcon;
    }

    public void setCatIcon(String catIcon) {
        this.catIcon = catIcon == null ? null : catIcon.trim();
    }

    @NotNull(message = "父节点ID不能为空")
    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    @Length(max = 64, message = "分类链接最多限制64个字符")
    public String getCatUrl() {
        return catUrl;
    }

    public void setCatUrl(String catUrl) {
        this.catUrl = catUrl == null ? null : catUrl.trim();
    }

    @NotNull(message = "节点类型不能为空")
    public Integer getParent() {
        return parent;
    }

    public void setParent(Integer parent) {
        this.parent = parent;
    }

    public String getAncestors() {
        return ancestors;
    }

    public void setAncestors(String ancestors) {
        this.ancestors = ancestors;
    }

    @NotNull(message = "分类类型不能为空")
    public Integer getCatType() {

        return catType;
    }

    public void setCatType(Integer catType) {
        this.catType = catType;
    }

    public Long getCatPassCount() {
        return catPassCount;
    }

    public void setCatPassCount(Long catPassCount) {
        this.catPassCount = catPassCount;
    }
}
