package com.oly.cms.general.taglib;

import java.util.List;

import com.oly.cms.common.domain.entity.CmsArticleCount;
import com.oly.cms.general.service.cache.GeneralArticleSortCacheService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 获取文章基本信息 排序
 */
@Service("articleCountSortTag")
public class ArticleCountSortTag {

    @Autowired
    private GeneralArticleSortCacheService webArticleSortService;

    public List<CmsArticleCount> listCmsArticleCountOrderByLook(int pageNum, int pageSize, String themeName) {

        return webArticleSortService.listCmsArticleCountOrderByLook(pageNum, pageSize, themeName);
    }

    public List<CmsArticleCount> listCmsArticleCountOrderByLike(int pageNum, int pageSize, String themeName) {

        return webArticleSortService.listCmsArticleCountOrderByLike(pageNum, pageSize, themeName);
    }

    public List<CmsArticleCount> listCmsArticleCountOrderByScore(int pageNum, int pageSize, String themeName) {

        return webArticleSortService.listCmsArticleCountOrderByScore(pageNum, pageSize, themeName);
    }

    public List<CmsArticleCount> listCmsArticleCountOrderByCollect(int pageNum, int pageSize, String themeName) {

        return webArticleSortService.listCmsArticleCountOrderByCollect(pageNum, pageSize, themeName);
    }

    public List<CmsArticleCount> listCmsArticleCountOrderByShare(int pageNum, int pageSize, String themeName) {

        return webArticleSortService.listCmsArticleCountOrderByShare(pageNum, pageSize, themeName);
    }

    public List<CmsArticleCount> listCmsArticleCountOrderByNasty(int pageNum, int pageSize, String themeName) {

        return webArticleSortService.listCmsArticleCountOrderByNasty(pageNum, pageSize, themeName);
    }

}
