package com.oly.cms.admin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.oly.cms.common.domain.entity.CmsCat;

public interface CmsCatMapper {
	/**
	 * 添加类目
	 * 
	 * @param cmsCat
	 * @return
	 */
	int insertCmsCat(CmsCat cmsCat);

	/**
	 * 修改类目
	 * 
	 * @param cmsCat
	 * @return
	 */
	int updateCmsCat(CmsCat cmsCat);

	/**
	 * 删除单个分类
	 * 
	 * @param catId
	 * @return
	 */
	int deleteCmsCatById(Long catId);

	/**
	 * 更新祖级
	 * 
	 * @param parentId
	 * @return
	 */
	int updateAncestors(@Param("parentId") long parentId, @Param("ancestors") String ancestors);

	/**
	 * 通过父类id获取 子节点id
	 * 
	 * @param cmsCatId
	 * @return
	 */
	List<Long> listCatIdsById(long cmsCatId);

	/**
	 * 统计关联节点
	 * 
	 * @param catId
	 * @return
	 */
	int countArticleByCatId(Long catId);

	int updateTagVisible(@Param("catId") Long catId, @Param("visible") Integer visible);

}