package com.oly.cms.system.model.po;

import java.util.List;

import com.oly.common.model.entity.base.BaseColumn;


public class CmsColumn extends BaseColumn {

	private static final long serialVersionUID = 1L;
	private List<CmsColumn> childList;

	public List<CmsColumn> getChildList() {
		return childList;
	}

	public void setChildList(List<CmsColumn> childList) {
		this.childList = childList;
	}
}
