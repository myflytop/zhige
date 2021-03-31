package com.oly.cms.system.service;

import java.util.List;

import com.oly.cms.system.model.po.CmsArticle;
import com.oly.cms.system.model.vo.ArticleVo;

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
     *
     * @param articleIds
     * @param articleTop
     * @return
     */
    int updateArticleTop(Long[] articleIds, Long articleTop);

    /**
     * 根据文章id获取文章
     * 
     * @param id
     * @return
     */
    CmsArticle getCmsArticleById(Long id);

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
     * 检查非空路径是否唯一
     * 
     * @param articleUrl
     * @param articleId
     * @return
     */
    String checkArticleUrl(String articleUrl, Long articleId);

    /**
     * 检查文章标题
     * 
     * @param articleTitle
     * @param articleId
     * @return
     */
    String checkArticleTitle(String articleTitle, Long articleId);

    int addCatArticle(Long articleId, Long catId);

    int removeCatArticle(Long articleId, Long catId);

    int addTagArticle(Long articleId, Long tagId);

    int removeTagArticle(Long articleId, Long tagId);

    int updateVisible(Long[] ids, Byte visible);

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

}
