package com.oly.cms.admin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.oly.cms.common.domain.entity.CmsColumn;

public interface CmsColumnMapper {
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
	 * 删除单个栏目导航
	 * 
	 * @param columnId
	 * @return
	 */
	int deleteCmsColumnById(Long columnId);

	List<Long> listColumnIdsById(Long catId);

	int updateAncestors(@Param("parentId") Long parentId, @Param("ancestors") String ancestors);

	int updateColumnVisible(@Param("columnId") Long columnId, @Param("visible") Integer visible);
}
