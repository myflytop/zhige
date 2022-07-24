package com.oly.cms.common.domain.entity;

import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.oly.cms.common.domain.SeoBaseModel;

public class CmsColumn extends SeoBaseModel {

    private static final long serialVersionUID = 7493265520804374133L;

    /* 栏目ID */
    private Long columnId;

    /* 栏目icon */
    private String columnIcon;

    /* 名称 */
    private String columnName;

    /* 打开方式 */
    private Integer openType;

    /* 打开链接 */
    private String columnUrl;

    /* 父级栏目ID */
    private Long parentId;

    /* 是否父元素 */
    private Integer parent;

    /* 祖级列表 */
    private String ancestors;

    /* 站内导航还是站外 */
    private Integer columnLocate;

    private List<CmsColumn> childList;

    public List<CmsColumn> getChildList() {
        return childList;
    }

    public void setChildList(List<CmsColumn> childList) {
        this.childList = childList;
    }

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

    @NotBlank(message = "菜单名不能为空")
    @Length(min = 2, max = 8, message = "菜单名限制2到8个字符")
    public String getColumnName() {
        return columnName;
    }

    public void setColumnName(String columnName) {
        this.columnName = columnName;
    }

    @NotNull(message = "打开方式不能为空")
    public Integer getOpenType() {
        return openType;
    }

    public void setOpenType(Integer openType) {
        this.openType = openType;
    }

    @NotNull(message = "父级ID不能为空")
    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    @NotNull(message = "节点不能为空")
    public Integer getParent() {
        return parent;
    }

    public void setParent(Integer parent) {
        this.parent = parent;
    }

    @Length(max = 128, message = "菜单链接最多限制128个字符")
    public String getColumnUrl() {
        return columnUrl;
    }

    public void setColumnUrl(String columnUrl) {
        this.columnUrl = columnUrl == null ? null : columnUrl.trim();
    }

    public String getAncestors() {
        return ancestors;
    }

    public void setAncestors(String ancestors) {
        this.ancestors = ancestors;
    }

    @NotNull(message = "导航位置不能为空")
    public Integer getColumnLocate() {
        return columnLocate;
    }

    public void setColumnLocate(Integer columnLocate) {
        this.columnLocate = columnLocate;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("com.oly.cms.common.mould.base.BaseColumn{");
        sb.append("columnId=").append(columnId);
        sb.append(", columnIcon='").append(columnIcon).append('\'');
        sb.append(", columnName='").append(columnName).append('\'');
        sb.append(", openType=").append(openType);
        sb.append(", columnUrl='").append(columnUrl).append('\'');
        sb.append(", orderNum=").append(getOrderNum());
        sb.append(", parentId=").append(parentId);
        sb.append(", parent=").append(parent);
        sb.append(", perms='").append(getPerms()).append('\'');
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
