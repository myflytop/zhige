package com.oly.web.taglib;

import java.util.List;

import com.oly.web.model.po.BlogArticleCountSort;
import com.oly.web.service.cache.BlogArticleSortCacheService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 获取文章基本信息 排序
 */
@Service("articleCountSortTag")
public class ArticleCountSortTag {

    @Autowired
    private BlogArticleSortCacheService blogArticleSortService;

    public List<BlogArticleCountSort> listBlogArticleCountOrderByLook(int pageSize, String themeName) {

        return blogArticleSortService.listBlogArticleCountOrderByLook(pageSize,themeName);
    }

    public List<BlogArticleCountSort> listBlogArticleCountOrderByLike(int pageSize, String themeName) {

        return blogArticleSortService.listBlogArticleCountOrderByLike(pageSize,themeName);
    }

    public List<BlogArticleCountSort> listBlogArticleCountOrderByScore(int pageSize, String themeName) {

        return blogArticleSortService.listBlogArticleCountOrderByScore(pageSize,themeName);
    }

    public List<BlogArticleCountSort> listBlogArticleCountOrderByCollect(int pageSize, String themeName) {

        return blogArticleSortService.listBlogArticleCountOrderByCollect(pageSize,themeName);
    }

    public List<BlogArticleCountSort> listBlogArticleCountOrderByShare(int pageSize, String themeName) {

        return blogArticleSortService.listBlogArticleCountOrderByShare(pageSize,themeName);
    }

}
