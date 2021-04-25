package com.oly.common.model.entity.base;

public class BaseCat extends SeoBaseModel {
    private static final long serialVersionUID = 1L;
    // 分类id
    private Long catId;
    // 分类名
    private String catName;
    // 祖级列表
    private String ancestors;
    // 分类图标
    private String catIcon;
    // 固定链接
    private String catUrl;
    // 父亲id
    private Long parentId;
    // 权限字符串
    private String perms;
    // 是否父元素
    private Byte parent;
    // 关联文章数
    private Long catCount;
     // 分类类型
     private Byte catType;


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

    public String getCatName() {
        return catName;
    }

    public void setCatName(String catName) {
        this.catName = catName == null ? null : catName.trim();
    }

    public String getCatIcon() {
        return catIcon;
    }

    public void setCatIcon(String catIcon) {
        this.catIcon = catIcon == null ? null : catIcon.trim();
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public String getCatUrl() {
        return catUrl;
    }

    public void setCatUrl(String catUrl) {
        this.catUrl = catUrl == null ? null : catUrl.trim();
    }

    public Byte getParent() {
        return parent;
    }

    public void setParent(Byte parent) {
        this.parent = parent;
    }

    public String getAncestors() {
        return ancestors;
    }

    public void setAncestors(String ancestors) {
        this.ancestors = ancestors;
    }

    public String getPerms() {
        return perms;
    }

    public void setPerms(String perms) {
        this.perms = perms;
    }

    public Byte getCatType() {
        return catType;
    }

    public void setCatType(Byte catType) {
        this.catType = catType;
    }
    
}
