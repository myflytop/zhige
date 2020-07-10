package com.ruoyi.cms.common.mould.base;

import java.util.ArrayList;
import java.util.List;

public class BaseColumn extends SeoBaseModel {

    private static final long serialVersionUID = 7493265520804374133L;

    // 栏目ID
    private Long columnId;

    // 栏目icon
    private String columnIcon;

    // 名称
    private String columnName;

    // 打开方式
    private Byte openType;

    // 打开链接
    private String columnUrl;

    // 排序
    private Integer orderNo;

    // 父级栏目ID
    private Long parentId;

    // 是否父元素
    private Byte parent;

    // 权限字符串
    private String perms;

    //祖级列表
    private String ancestors;

    //站内导航还是站外
    private Byte columnLocate;

    public Long getColumnId() {
        return columnId;
    }

    public void setColumnId(Long columnId) {
        this.columnId = columnId;
    }

    public String getColumnIcon() {
        return columnIcon;
    }

    public void setColumnIcon(String columnIcon) {
        this.columnIcon = columnIcon;
    }

    public String getColumnName() {
        return columnName;
    }

    public void setColumnName(String columnName) {
        this.columnName = columnName;
    }

    public Byte getOpenType() {
        return openType;
    }

    public void setOpenType(Byte openType) {
        this.openType = openType;
    }


    public Integer getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(Integer orderNo) {
        this.orderNo = orderNo;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public Byte getParent() {
        return parent;
    }

    public void setParent(Byte parent) {
        this.parent = parent;
    }

    public String getPerms() {
        return perms;
    }

    public void setPerms(String perms) {
        this.perms = perms;
    }

    public String getColumnUrl() {
        return columnUrl;
    }

    public void setColumnUrl(String columnUrl) {
        this.columnUrl = columnUrl==null?null:columnUrl.trim();
    }



    public String getAncestors() {
        return ancestors;
    }

    public void setAncestors(String ancestors) {
        this.ancestors = ancestors;
    }

    public Byte getColumnLocate() {
        return columnLocate;
    }

    public void setColumnLocate(Byte columnLocate) {
        this.columnLocate = columnLocate;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("com.ruoyi.cms.common.mould.base.BaseColumn{");
        sb.append("columnId=").append(columnId);
        sb.append(", columnIcon='").append(columnIcon).append('\'');
        sb.append(", columnName='").append(columnName).append('\'');
        sb.append(", openType=").append(openType);
        sb.append(", columnUrl='").append(columnUrl).append('\'');
        sb.append(", orderNo=").append(orderNo);
        sb.append(", parentId=").append(parentId);
        sb.append(", parent=").append(parent);
        sb.append(", perms='").append(perms).append('\'');
        sb.append(", ancestors='").append(ancestors).append('\'');
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
        sb.append(", =columnLocate").append(getColumnLocate());
        sb.append('}');
        return sb.toString();
    }
}
