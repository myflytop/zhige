package com.ruoyi.cms.common.mould.base;

import java.util.ArrayList;
import java.util.List;

public class BaseCat extends SeoBaseModel {
    private static final long serialVersionUID = 1L;
    //分类id
    private Long catId;
    //分类名
    private String catName;
    //祖级列表
    private String ancestors;
    //分类图标
    private String catIcon;
    //固定链接
    private String catUrl;
    //排序
    private Byte orderNo;
    //父亲id
    private Long parentId;
    // 权限字符串
    private String perms;
    // 是否父元素
    private Byte parent;

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

    public Byte getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(Byte orderNo) {
        this.orderNo = orderNo;
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
        this.catUrl =catUrl==null ? null : catUrl.trim();
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


    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("com.ruoyi.cms.common.mould.base.BaseCat{");
        sb.append("catId=").append(catId);
        sb.append(", catName='").append(catName).append('\'');
        sb.append(", ancestors='").append(ancestors).append('\'');
        sb.append(", catIcon='").append(catIcon).append('\'');
        sb.append(", catUrl='").append(catUrl).append('\'');
        sb.append(", orderNo=").append(orderNo);
        sb.append(", parentId=").append(parentId);
        sb.append(", perms='").append(perms).append('\'');
        sb.append(", parent=").append(parent);
        sb.append(", keywords='").append(getKeywords()).append('\'');
        sb.append(", description='").append(getDescription()).append('\'');
        sb.append(", visible=").append(getVisible());
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
