package com.ruoyi.cms.system.mapper;

import com.ruoyi.cms.system.model.po.CmsCat;
import com.ruoyi.cms.system.model.po.CmsTag;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 文章关联相关
 */
public interface CmsArticleLiquidMapper {


    int insertArticleCat(Long articleId,Long catId);

    int insertArticleTag(Long articleId,Long tagId);

    int insertCmsArticleTags(@Param("articleId")Long articleId, @Param("tags")Integer[] tags);

    int insertCmsArticleCats(@Param("articleId")Long articleId, @Param("cats")Integer[] cats);

    int removeCmsArticleTagsByArticleId(Long articleId);

    int removeCmsArticleCatsByArticleId(Long articleId);


    int insertCmsArticleCount(Long articleId);

    /**
     * 批量删除文章与分类关联
     * @param articleIds
     * @return
     */
    int deleteArticleCatByIds(Long[] articleIds);

    /**
     * 批量删除文章与标签关联
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
     * 添加文章与分类关联
     * @param articleId
     * @param catId
     * @return
     */
    int  insertCatArticle(@Param("articleId")Long articleId,@Param("catId") Long catId);

    /**
     * 删除文章与分类关联
     * @param articleId
     * @param catId
     * @return
     */
    int deleteCatArticle(@Param("articleId")Long articleId,@Param("catId") Long catId);

    /**
     * 添加文章与标签关联
     * @param articleId
     * @param tagId
     * @return
     */
    int  insertTagArticle(@Param("articleId")Long articleId,@Param("tagId") Long tagId);

    /**
     * 删除文章与标签关联
     * @param articleId
     * @param tagId
     * @return
     */
    int deleteTagArticle(@Param("articleId")Long articleId,@Param("tagId") Long tagId);


    Integer[] filterCats(Integer[] cats);

    Integer[] filterTags(Integer[] tags);

}
