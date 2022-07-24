package com.oly.cms.admin.service;

import java.util.List;

import com.oly.cms.common.domain.entity.CmsColumn;
import com.ruoyi.common.core.domain.Ztree;

public interface ICmsColumnService {
	/**
	 * 添加栏目
	 * 
	 * @param cmsColumn
	 * @return
	 */
	int insertCmsColumn(CmsColumn cmsColumn);

	/**
	 * 修改栏目
	 * 
	 * @param cmsColumn
	 * @return
	 */
	int updateCmsColumn(CmsColumn cmsColumn);

	/**
	 * 获取栏目列表
	 * 
	 * @param cmsColumn
	 * @return
	 */
	List<CmsColumn> listCmsColumn(CmsColumn cmsColumn);

	/**
	 * 根据parentid获取栏目列表
	 * 
	 * @param parentId
	 * @return
	 */
	List<CmsColumn> listCmsColumnById(Long parentId);

	/**
	 * Ztree 封装
	 * 
	 * @param cc
	 * @return
	 */
	public List<Ztree> columnTreeCatData(CmsColumn cc);

	/**
	 * 验证当前类目 栏目名是否唯一
	 * 
	 * @param cmsColumn
	 * @return
	 */
	public String checkColumnNameUnique(CmsColumn cmsColumn);

	/**
	 * 获取一条栏目 所有字段
	 * 
	 * @param columnId
	 * @return
	 */
	CmsColumn selectCmsColumnById(Long columnId);

	/**
	 * 删除单个栏目
	 * 
	 * @param columnId
	 * @return
	 */
	int deleteCmsColumnById(Long columnId);

	int updateColumnVisible(Long columnId, Integer visible);
}
