package com.oly.cms.admin.service;

import java.util.List;

import com.oly.cms.common.domain.entity.CmsArticle;
import com.oly.cms.admin.model.vo.ArticleVo;

public interface ICmsArticleService {
    /**
     * 插入文章
     * 
     * @param articleVo
     * @return
     */
    int insertCmsArticle(ArticleVo articleVo);

    /**
     * 根据批量删除文章
     * 
     * @param articleIds
     * @return
     */
    int deleteCmsArticleByIds(Long[] articleIds);

    /**
     * 更新文章顶置
     * 
     * @param articleIds
     * @param articleTop
     * @return
     */
    int updateArticleTop(Long[] articleIds, int articleTop);

    /**
     * 根据文章id获取文章
     * 
     * @param id
     * @return
     */
    CmsArticle selectCmsArticleById(Long id);

    /**
     * 获取文章列表
     * 
     * @param artVo
     * @return
     */
    List<CmsArticle> listCmsArticle(ArticleVo artVo);

    /**
     * 更新文章通过文章id
     * 
     * @param cmsArticle
     * @return
     */
    int updateCmsArticleById(CmsArticle cmsArticle);

    /**
     * 检查是否cmsArticle唯一
     * 
     * @param cmsArticle
     * @return
     */
    String checkArticleUnique(CmsArticle cmsArticle);

    int addCatArticle(Long articleId, Long catId);

    int removeCatArticle(Long articleId, Long catId);

    int addTagArticle(Long articleId, Long tagId);

    int removeTagArticle(Long articleId, Long tagId);

    int updateVisible(Long[] ids, Integer visible);

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

    public int buildArticleIndex(String themeName);

}
