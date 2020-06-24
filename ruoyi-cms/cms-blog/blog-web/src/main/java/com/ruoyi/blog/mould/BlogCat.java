package com.ruoyi.blog.mould;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 文章分类
 */
public class BlogCat {
    //分类id
    private Long catId;
    //分类名
    private String catName;
    //分类图标
    private String catIcon;
    //固定链接
    private String catUrl;
    //排序
    private Byte orderNo;
    //父亲id
    private Long parentId;
    // 是否父元素
    private Byte parent;
    /** 创建者 */
    private Long createBy;
    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;
    /**状态*/
    private Byte visible;
    /** 备注 */
    private String remark;
    private long catCount;
    // 子菜单列表
    private List<BlogCat> children = new ArrayList<>();


    public long getCatCount() {
        return catCount;
    }

    public void setCatCount(long catCount) {
        this.catCount = catCount;
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
        this.catName = catName;
    }

    public String getCatIcon() {
        return catIcon;
    }

    public void setCatIcon(String catIcon) {
        this.catIcon = catIcon;
    }

    public String getCatUrl() {
        return catUrl;
    }

    public void setCatUrl(String catUrl) {
        this.catUrl = catUrl;
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

    public Byte getParent() {
        return parent;
    }

    public void setParent(Byte parent) {
        this.parent = parent;
    }

    public Long getCreateBy() {
        return createBy;
    }

    public void setCreateBy(Long createBy) {
        this.createBy = createBy;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Byte getVisible() {
        return visible;
    }

    public void setVisible(Byte visible) {
        this.visible = visible;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public List<BlogCat> getChildren() {
        return children;
    }

    public void setChildren(List<BlogCat> children) {
        this.children = children;
    }


}
