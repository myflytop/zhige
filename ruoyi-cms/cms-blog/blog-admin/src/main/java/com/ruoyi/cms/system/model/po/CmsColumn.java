package com.ruoyi.cms.system.model.po;

import com.ruoyi.cms.system.model.base.BaseModel;

import java.util.ArrayList;
import java.util.List;

/**
 * 前端栏目导航
 * 
 * @author bobey
 *
 */
public class CmsColumn extends BaseModel {

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

	// 子菜单列表
	private List<CmsColumn> children = new ArrayList<CmsColumn>();

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

	public List<CmsColumn> getChildren() {
		return children;
	}

	public void setChildren(List<CmsColumn> children) {
		this.children = children;
	}

	public String getAncestors() {
		return ancestors;
	}

	public void setAncestors(String ancestors) {
		this.ancestors = ancestors;
	}


	
	
	
}
