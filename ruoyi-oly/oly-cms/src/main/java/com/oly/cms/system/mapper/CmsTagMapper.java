package com.oly.cms.system.mapper;

import com.oly.cms.system.model.po.CmsTag;
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
	 * 获取单条
	 * 
	 * @param tagId
	 * @return
	 */
	CmsTag getCmsTagById(Long tagId);

	

	/**
	 * 批量获取
	 * 
	 * @param cmsTag
	 * @return
	 */
	List<CmsTag> listCmsTagByTag(CmsTag cmsTag);


	/**
	 * 检查标签名唯一
	 * 
	 * @param tagName
	 * @param tagId
	 * @return
	 */
	int checkTagNameUnique(@Param("tagName") String tagName, @Param("tagId") Long tagId);

	/**
	 * 检查标签路径唯一
	 * 
	 * @param tagUrl
	 * @param tagId
	 * @return
	 */
	int checkTagUrlUnique(@Param("tagUrl") String tagUrl, @Param("tagId") Long tagId);

	/**
	 * 获取标签列表 文章关联标签
	 * 
	 * @param articleId
	 * @return
	 */
	List<CmsTag> listCmsTagByArticleId(Long articleId);

	int updateTagVisible(@Param("tagIds") Long[] tagIds, @Param("visible") Byte visible);

}