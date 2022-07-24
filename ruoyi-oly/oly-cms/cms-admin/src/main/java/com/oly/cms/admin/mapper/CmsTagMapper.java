package com.oly.cms.admin.mapper;

import com.oly.cms.common.domain.entity.CmsTag;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CmsTagMapper {
	/**
	 * 插入单条
	 * 
	 * @param cmsTag
	 * @return
	 */
	int insertCmsTag(CmsTag cmsTag);

	/**
	 * 插入批量
	 * 
	 * @param cmsTags
	 * @return
	 */
	int insertCmsTags(List<CmsTag> cmsTags);

	/**
	 * 通过id删除
	 * 
	 * @param tagId
	 * @return
	 */
	int deleteCmsTagById(Long tagId);

	/**
	 * 单条更新
	 * 
	 * @param cmsTag
	 * @return
	 */
	int updateCmsTagById(CmsTag cmsTag);

	/**
	 * 批量更新状态
	 * 
	 * @param tagIds
	 * @param visible
	 * @return
	 */
	int updateTagVisible(@Param("tagIds") Long[] tagIds, @Param("visible") Integer visible);

}