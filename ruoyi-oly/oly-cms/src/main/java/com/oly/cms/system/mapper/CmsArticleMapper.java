package com.oly.cms.system.mapper;

import java.util.List;

import com.oly.cms.system.model.vo.ArticleVo;
import org.apache.ibatis.annotations.Param;

import com.oly.cms.system.model.po.CmsArticle;

public interface CmsArticleMapper {

	/**
	 * 文章插入
	 * 
	 * @param cmsArticle
	 * @return
	 */
	int insertCmsArticle(CmsArticle cmsArticle);

	/**
	 * 通过id更新文章
	 * 
	 * @param cmsArticle
	 * @return
	 */
	int updateCmsArticleById(CmsArticle cmsArticle);

	/**
	 * 批量删除文章
	 * 
	 * @param articleIds
	 * @return
	 */
	int deleteCmsArticleByIds(Long[] articleIds);

	/**
	 * 文章链接=分类路径/文章路径 获取文章所有信息
	 * 
	 * @param artVo
	 * @return
	 */
	List<CmsArticle> listCmsArticle(ArticleVo artVo);

	/**
	 * 通过id获取文章
	 * 
	 * @param id
	 * @return
	 */
	CmsArticle getCmsArticleById(Long id);

	/**
	 * 验证文章是否唯一
	 * 
	 * @param articleUrl
	 * @param articleId
	 * @return
	 */
	int checkArticleUrlUnique(@Param("articleUrl") String articleUrl, @Param("articleId") Long articleId);

	/**
	 * 验证文章名是否唯一
	 * 
	 * @param articleTitle
	 * @param articleId
	 * @return
	 */
	int checkArticleTitleUnique(@Param("articleTitle") String articleTitle, @Param("articleId") Long articleId);

	/**
	 * 初始化文章相关统计 其他默认
	 * 
	 * @return
	 */
	int insertCmsArticleCount(long articleId);

	/**
	 * 
	 * 删除一条 文章与分类的关联
	 * 
	 * @param articleId
	 * @param catId
	 * @return
	 */
	int deleteAcOne(@Param("articleId") long articleId, @Param("catId") long catId);

	/**
	 * 批量修改文章顶置属性
	 * 
	 * @param articleIds
	 * @param articleTop
	 * @return
	 */
	int updateArticleTop(@Param("articleIds") Long[] articleIds, @Param("articleTop") Long articleTop);

	/**
	 * 通过分类查询
	 * 
	 * @param cmsArticle
	 * @return
	 */
	List<CmsArticle> listCmsArticleBasic(CmsArticle cmsArticle);

	/**
	 * 添加时无需文章id 修改时需要文章id
	 * 
	 * @param articleUrl
	 * @param articleTitle
	 * @return
	 */
	int checkUrlAndTitleUnique(@Param("articleUrl") String articleUrl, @Param("articleTitle") String articleTitle,
			@Param("articleId") Long articleId);

	/**
	 * 判断文章是否存在
	 * 
	 * @param article_id
	 * @return
	 */
	int getCountArticleId(Long article_id);

	int updateVisible(@Param("articleIds") Long[] ids, @Param("visible") Byte visible);
}