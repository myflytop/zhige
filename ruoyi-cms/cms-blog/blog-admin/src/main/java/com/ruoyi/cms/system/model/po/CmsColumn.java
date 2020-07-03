package com.ruoyi.cms.system.model.po;

import com.ruoyi.cms.common.mould.base.BaseColumn;

import java.util.List;

/**
 * 前端栏目导航
 * 
 * @author bobey
 *
 */
public class CmsColumn extends BaseColumn {

private List<CmsColumn> childList;

	public List<CmsColumn> getChildList() {
		return childList;
	}

	public void setChildList(List<CmsColumn> childList) {
		this.childList = childList;
	}
}
