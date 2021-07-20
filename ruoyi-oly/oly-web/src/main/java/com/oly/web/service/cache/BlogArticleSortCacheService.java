package com.oly.web.service.cache;

import java.util.List;

import com.oly.common.constant.CacheConstant;
import com.oly.common.model.properties.OlyWebConfigProetries;
import com.oly.web.model.po.BlogArticleCountSort;
import com.oly.web.service.impl.BlogArticleSortServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

@Service

public class BlogArticleSortCacheService {

    @Autowired
    private BlogArticleSortServiceImpl blogSortService;

    @Autowired
    private BlogConfigCacheService commonService;

    public List<BlogArticleCountSort> listBlogArticleCount(String supportType) {
        return blogSortService.listArticlesCountSort(supportType);
    }

    // 只涉及文章表和统计表
    @Cacheable(value = CacheConstant.POST_CACHE_KEY_PREFIX, key = "methodName+ '_'+#p0+'_'+#p1")
    public List<BlogArticleCountSort> listBlogArticleCountOrderByLook(int pageSize, String themeName) {
        return blogSortService.listArticlesCountSort(pageSize, "article_look desc", getSupportType(themeName));
    }

    // 只涉及文章表和统计表
    @Cacheable(value = CacheConstant.POST_CACHE_KEY_PREFIX, key = "methodName+ '_'+#p0+'_'+#p1")
    public List<BlogArticleCountSort> listBlogArticleCountOrderByLike(int pageSize, String themeName) {

        return blogSortService.listArticlesCountSort(pageSize, "article_like desc", getSupportType(themeName));
    }

    // 只涉及文章表和统计表
    @Cacheable(value = CacheConstant.POST_CACHE_KEY_PREFIX, key = "methodName+ '_'+#p0+'_'+#p1")
    public List<BlogArticleCountSort> listBlogArticleCountOrderByScore(int pageSize, String themeName) {
        return blogSortService.listArticlesCountSort(pageSize, "article_score desc", getSupportType(themeName));
    }

    // 只涉及文章表和统计表
    @Cacheable(value = CacheConstant.POST_CACHE_KEY_PREFIX, key = "methodName+ '_'+#p0+'_'+#p1")
    public List<BlogArticleCountSort> listBlogArticleCountOrderByCollect(int pageSize, String themeName) {

        return blogSortService.listArticlesCountSort(pageSize, "article_collect desc", getSupportType(themeName));
    }

    // 只涉及文章表和统计表
    @Cacheable(value = CacheConstant.POST_CACHE_KEY_PREFIX, key = "methodName+ '_'+#p0+'_'+#p1")
    public List<BlogArticleCountSort> listBlogArticleCountOrderByShare(int pageSize, String themeName) {

        return blogSortService.listArticlesCountSort(pageSize, "article_share desc", getSupportType(themeName));
    }

    private String getSupportType(String themeName) {

        return commonService.getBackConfigDefauleValue(themeName, OlyWebConfigProetries.ARTICLE_TYPES);
    }

}
