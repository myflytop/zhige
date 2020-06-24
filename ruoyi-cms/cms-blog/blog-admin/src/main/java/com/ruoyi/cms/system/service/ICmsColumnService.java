package com.ruoyi.cms.system.service;

import java.util.List;

import com.ruoyi.cms.system.model.po.CmsColumn;
import com.ruoyi.common.core.domain.Ztree;

public interface ICmsColumnService {
    /**
     * 添加栏目
    * @param cmsColumn
    * @return
    */
	int insertCmsColumn(CmsColumn cmsColumn);
	/**
    * 修改栏目
   * @param cmsColumn
   * @return
   */
	int updateCmsColumn(CmsColumn cmsColumn);	
	/**
	 * 删除栏目导航
	 * @param columnId
	 * @return
	 */
	int deleteCmsColumn(Long columnId);
	/**
	 * 获取栏目列表
	 * @param cmsColumn
	 * @return
	 */
	List<CmsColumn> listCmsColumn(CmsColumn cmsColumn);
	/**
	 *根据parentid获取栏目列表
	 * @param parentId
	 * @return
	 */
	List<CmsColumn> listCmsColumnById(Long parentId);
	
	/**
	 * Ztree 封装
	 * @return
	 */
	public List<Ztree> columnTreeCatData();
	
	/**
	 * 验证当前类目 栏目名是否唯一
	 * @param cms
	 * @return
	 */
	public String checkColumnNameUnique(CmsColumn cms);
	
	/**
	 * 验证当前类目 地址名是否唯一
	 * @param cms
	 * @return
	 */
	public String checkColumnUrlUnique(CmsColumn cms);
	
	/**
	 * 获取一条栏目 所有字段
	 * @param columnId
	 * @return
	 */
	CmsColumn getCmsColumnById(Long columnId);
	
	/**
	 * 获取类目名
	 * @param columnId
	 * @return
	 */
	String getCmsColumnNameById(Long columnId);
	
	/**
	 * 删除单个栏目
	 * @param columnId
	 * @return
	 */
	int deleteCmsColumnById(Long columnId);
	
	/**
	 * 前端获取导航
	 * @param cmsColumn
	 * @return
	 */
	List<CmsColumn> listCmsColumnView(CmsColumn cmsColumn);

	int countCmsColumnById(Long columnId);

    int updateTagVisible(Long columnId, Byte visible);
}
