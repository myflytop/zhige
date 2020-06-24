package com.ruoyi.cms.system.model.po;


import com.ruoyi.cms.system.model.base.BaseModel;

import java.util.ArrayList;
import java.util.List;

public class CmsCat extends BaseModel {
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
 	// 子菜单列表
 	private List<CmsCat> children = new ArrayList<>();

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

	
	 public List<CmsCat> getChildren() {
		return children;
	}

	public void setChildren(List<CmsCat> children) {
		this.children = children;
	}

}