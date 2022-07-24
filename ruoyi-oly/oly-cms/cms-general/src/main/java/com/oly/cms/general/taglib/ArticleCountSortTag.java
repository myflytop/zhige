package com.oly.cms.general.taglib;

import java.util.List;

import com.oly.cms.general.model.vo.WebArticleCountVo;
import com.oly.cms.general.service.cache.GeneralWebArticleCountVoCacheService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 获取文章基本信息 排序
 */
@Service("articleCountSortTag")
public class ArticleCountSortTag {

    @Autowired
    private GeneralWebArticleCountVoCacheService webArticleSortService;

    public List<WebArticleCountVo> listCmsArticleCountOrderByLook(int pageNum, int pageSize, String themeName) {

        return webArticleSortService.listWebArticleCountVoOrderByLook(pageNum, pageSize, themeName);
    }

    public List<WebArticleCountVo> listCmsArticleCountOrderByLike(int pageNum, int pageSize, String themeName) {

        return webArticleSortService.listWebArticleCountVoOrderByLike(pageNum, pageSize, themeName);
    }

    public List<WebArticleCountVo> listCmsArticleCountOrderByScore(int pageNum, int pageSize, String themeName) {

        return webArticleSortService.listWebArticleCountVoOrderByScore(pageNum, pageSize, themeName);
    }

    public List<WebArticleCountVo> listCmsArticleCountOrderByCollect(int pageNum, int pageSize, String themeName) {

        return webArticleSortService.listWebArticleCountVoOrderByCollect(pageNum, pageSize, themeName);
    }

    public List<WebArticleCountVo> listCmsArticleCountOrderByShare(int pageNum, int pageSize, String themeName) {

        return webArticleSortService.listWebArticleCountVoOrderByShare(pageNum, pageSize, themeName);
    }

    public List<WebArticleCountVo> listCmsArticleCountOrderByNasty(int pageNum, int pageSize, String themeName) {

        return webArticleSortService.listWebArticleCountVoOrderByNasty(pageNum, pageSize, themeName);
    }

}
