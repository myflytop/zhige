package com.ruoyi.cms.system.mapper;

import java.util.List;

import com.ruoyi.cms.system.model.vo.CatCountVo;
import org.apache.ibatis.annotations.Param;

import com.ruoyi.cms.system.model.po.CmsCat;

public interface CmsCatMapper {
	 /**
     * 添加类目
    * @param cmsCat
    * @return
    */
	int insertCmsCat(CmsCat cmsCat);

	/**
	 * 批量添加类目
	 * @param cmsCats
	 * @return
	 */
	int insertCmsCats(List<CmsCat> cmsCats);

	/**
    * 修改类目
   * @param cmsCat
   * @return
   */
	int updateCmsCat(CmsCat cmsCat);
	 
	/**
	 * 删除单个类目导航
	 * @param catId
	 * @return
	 */
	int deleteCmsCatById(Long catId);
	
	/**
	 * 获取类目列表 所有字段
	 * @param cmsCat
	 * @return
	 */
	List<CmsCat> listCmsCatByCat(CmsCat cmsCat);
	
	/**
	 * 获取一条类目 所有字段
	 * @param catId
	 * @return
	 */	
	CmsCat getCmsCatById(Long catId);
	
	/**
	 * 获取类目子列表 所有字段
	 * @param parentId
	 * @return
	 */
	List<CmsCat> listCmsCatByParentId(Long parentId);
	
	/**
	 * 获取类目名
	 * @param catId
	 * @return
	 */
	String getCatNameById(Long catId);
	
	/**
	 * 统计是否存在子节点的
	 * @param parentId
	 * @return
	 */
	int countCatByParentId(Long parentId);

	/**
	 * 验证同类目下类目名唯一
	 * @param parentId
	 * @param catName
	 * @param catId 首次null
	 * @return
	 */
	int checkCatNameUnique(@Param("parentId") Long parentId, @Param("catName") String catName, @Param("catId") Long catId);
	
	/**
	 * 验证路径
	 * @param catId
	 * @param catUrl
	 * @return
	 */
	int checkCatUrlUnique(@Param("catId") Long catId, @Param("catUrl") String catUrl);

	/**
	 * 获取类目列表通过文章id
	 * 文章关联类目
	 * @param articleId
	 * @return
	 */
	List<CmsCat> listCmsCatByArticleTagId(Long articleId);


    /**
     * 获取文章关联catId
     * @param articleId
     * @return
     */
	int[] listCatIds(long articleId);

	/**
	 * 检查文章与标签是否有关联
	 * @param tagId
	 * @return
	 */
	int checkCatArticle(long tagId);

	/**
     * 获取文章关联catId_catName
     * @param articleId
     * @return
     */
	String[] listCats(long articleId);
	/**
	 * 批量删除 文章关联的类目
	 * @param articleIds
	 * @return
	 */
	int deleteArticleCatByIds(@Param("articleIds") Long[] articleIds);
	/**
	 * 删除一条文章关联的类目
	 * @param articleId
	 * @param catId
	 * @return
	 */
	int removeArticleCat(@Param("articleId") long articleId, @Param("catId") int catId);
	/**
	 * 添加一条文章关联的类目
	 * @param articleId
	 * @param catId
	 * @return
	 */
	int insertArticleCat(@Param("articleId") long articleId, @Param("catId") int catId);

	/**
	 * 获取分类
	 * @param cat
	 * @return
	 */
	List<CmsCat> listCmsCatView(CmsCat cat);

	/**
	 * 更新祖级
	 * @param parentId
	 * @return
	 */
	int updateAncestors(@Param("parentId") long parentId,@Param("ancestors") String ancestors);

	/**
	 * 通过父类id获取 子节点id
	 * @param cmsCatId
	 * @return
	 */
	List<Long> listCatIdsById(long cmsCatId);

	/**
	 * 统计关联节点
	 * @param catId
	 * @return
	 */
	int countArticleByCatId(Long catId);

    int updateTagVisible(@Param("catId") Long catId,@Param("visible") Byte visible);

    List<CmsCat> listCmsCatNoHide();

	List<CatCountVo> listCatCountVoByCat(CmsCat cmsCat);

	List<CatCountVo> listCattCountVoNoHide();
}