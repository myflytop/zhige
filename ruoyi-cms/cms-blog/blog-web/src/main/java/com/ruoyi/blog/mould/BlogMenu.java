package com.ruoyi.blog.mould;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
/*文章菜单*/
public class BlogMenu implements Serializable {
    private static final long serialVersionUID = 1L;
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

    //状态
    private Byte visible;

    private String remark;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
    public Date getCreateTime()
    {
        return createTime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Byte getVisible() {
        return visible;
    }

    public void setVisible(Byte visible) {
        this.visible = visible;
    }



    private List<BlogMenu> childMenus;

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

    public String getColumnUrl() {
        return columnUrl;
    }

    public void setColumnUrl(String columnUrl) {
        this.columnUrl = columnUrl;
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

    public List<BlogMenu> getChildMenus() {
        return childMenus;
    }

    public void setChildMenus(List<BlogMenu> childMenus) {
        this.childMenus = childMenus;
    }


}
