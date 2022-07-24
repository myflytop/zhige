package com.oly.cms.admin.mapper;

import org.apache.ibatis.annotations.Param;

/**
 * 文章关联相关
 */
public interface CmsArticleLiquidMapper {

    int insertArticleCat(Long articleId, Long catId);

    int insertArticleTag(Long articleId, Long tagId);

    int insertCmsArticleTags(@Param("articleId") Long articleId, @Param("tags") Integer[] tags);

    /**
     * 添加文章与标签关联
     * 
     * @param articleId
     * @param tagId
     * @return
     */
    int insertTagArticle(@Param("articleId") Long articleId, @Param("tagId") Long tagId);

    /**
     * 删除文章与标签关联
     * 
     * @param articleId
     * @param tagId
     * @return
     */
    int deleteTagArticle(@Param("articleId") Long articleId, @Param("tagId") Long tagId);

    int insertCmsArticleCats(@Param("articleId") Long articleId, @Param("cats") Integer[] cats);

    /**
     * 添加文章与分类关联
     * 
     * @param articleId
     * @param catId
     * @return
     */
    int insertCatArticle(@Param("articleId") Long articleId, @Param("catId") Long catId);

    /**
     * 删除文章与分类关联
     * 
     * @param articleId
     * @param catId
     * @return
     */
    int deleteCatArticle(@Param("articleId") Long articleId, @Param("catId") Long catId);

    int insertCmsArticleThemes(@Param("articleId") Long articleId, @Param("themeNames") String[] themeNames);

    int insertCmsArticleTheme(@Param("articleId") Long articleId, @Param("themeName") String themeName);

    int deleteCmsArticleTheme(@Param("articleId") Long articleId, @Param("themeName") String themeName);

    int deleteCmsArticleThemeByArticleId(Long articleId);

    int deleteCmsArticleThemeByTheme(String themeName);

    int removeCmsArticleTagsByArticleId(Long articleId);

    int removeCmsArticleCatsByArticleId(Long articleId);

    int insertCmsArticleCount(Long articleId);

    /**
     * 批量删除文章与分类关联
     * 
     * @param articleIds
     * @return
     */
    int deleteArticleCatByIds(Long[] articleIds);

    /**
     * 批量删除文章与标签关联
     * 
     * @param articleIds
     * @return
     */
    int deleteArticleTagByIds(Long[] articleIds);

    int deleteCmsCommentByIds(Long[] articleIds);

    int deleteCmsCommentRecordByIds(Long[] articleIds);

    int deleteCmsLookRecordByIds(Long[] articleIds);

    int deleteCmsShareRecordByIds(Long[] articleIds);

    int deleteCmsLikeRecordByIds(Long[] articleIds);

    int deleteCmsNastyRecordByIds(Long[] articleIds);

    int deleteCmsCollectRecordByIds(Long[] articleIds);

    int deleteCmsScoreRecordByIds(Long[] articleIds);

    int deleteCmsArticleCountByIds(Long[] articleIds);

    /**
     * 
     * @param cats
     * @return
     */
    Integer[] filterCats(Integer[] cats);

    /**
     * 
     * @param tags
     * @return
     */
    Integer[] filterTags(Integer[] tags);

    /**
     * 统计文章关联标签数
     * 
     * @param articleId
     * @return
     */
    int countArticleTag(long articleId);

    /**
     * 统计文章关联分类数
     * 
     * @param articleId
     * @return
     */
    int countArticleCat(long articleId);

    /**
     * 通过标签ID更新关联文章数量
     * 
     * @param tagIds
     * @return
     */
    int updateCmsTagCountByIds(Integer[] tagIds);

    /**
     * 通过分类ID更新关联文章数量
     * 
     * @param catIds
     * @return
     */
    int updateCmsCatCountByIds(Integer[] catIds);

    /**
     * 获取关联列表
     * 
     * @param articleIds
     * @return
     */
    Integer[] selectTagIdsByArticleIds(Long[] articleIds);

    /**
     * 获取关联列表
     * 
     * @param articleIds
     * @return
     */
    Integer[] selectCatIdsByArticleIds(Long[] articleIds);
}
