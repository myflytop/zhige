package com.oly.web.service.cache;

import java.util.List;

import com.oly.common.constant.CacheConstant;
import com.oly.web.model.PageArticleTimeLine;
import com.oly.web.model.pam.BlogArticleSearchParam;
import com.oly.web.model.po.BlogArticle;
import com.oly.web.service.search.BlogArticleServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

@Service
@CacheConfig(cacheNames = "oly-web")
public class BlogArticleCacheService {

    @Autowired
    private BlogArticleServiceImpl articleServiceImpl;

    @Cacheable(key = "'" + CacheConstant.POST_CACHE_KEY_PREFIX + "getArticleId_'+#p0")
    public BlogArticle getBlogArticleHtmlById(Long articleId) {

        return articleServiceImpl.getBlogArticleHtmlById(articleId);
    }

    @Cacheable(key = "'" + CacheConstant.POST_CACHE_KEY_PREFIX + "getArticleUrl_'+#p0")
    public BlogArticle getBlogArticleByUrl(String articleUrl) {

        return articleServiceImpl.getBlogArticleByUrl(articleUrl);
    }

    @Cacheable(key = "'" + CacheConstant.POSTS_CACHE_KEY_PREFIX
            + "listArticleByCatId_'+#p0+'size_'+#p1+'themeName_'+#p2")
    public List<BlogArticle> listBlogArticlesByCatId(Long catId, Integer pageSize, String themeName) {

        return articleServiceImpl.listBlogArticlesByCatId(catId, pageSize, themeName);
    }

    @Cacheable(key = "'" + CacheConstant.POSTS_CACHE_KEY_PREFIX
            + "listArticleByTagId_'+#p0+'size_'+#p1+'_themeName'+#p2")
    public List<BlogArticle> listBlogArticlesByTagId(Long tagId, Integer pageSize, String themeName) {
        return articleServiceImpl.listBlogArticlesByTagId(tagId, pageSize, themeName);
    }

    @Cacheable(key = "'" + CacheConstant.POSTS_CACHE_KEY_PREFIX
            + "listArticleOrder_size'+#p0+'_ordeString'+#p1+'_themeName'+#p2")
    public List<BlogArticle> listBlogArticlesOrder(int pageSize, String ordeString, String themeName) {

        return articleServiceImpl.listBlogArticlesOrder(pageSize, ordeString, themeName);
    }

    @Cacheable(key = "'" + CacheConstant.POSTS_CACHE_KEY_PREFIX
            + "listArticleOrder_size'+#p0+'_num'+#p1+'_ordeString'+#p2+'_themeName'+#p3")
    public List<BlogArticle> listBlogArticlesOrder(Integer size, Integer num, String order, String themeName) {
        return articleServiceImpl.listBlogArticlesOrder(size, num, order, themeName);
    }
    @Cacheable(key = "'" + CacheConstant.POSTS_CACHE_KEY_PREFIX
            + "listArticleGroupByTime_num'+#p0+'_size'+#p1+'_themeName'+#p2")
    public PageArticleTimeLine groupByTime(Integer pageNum, Integer pageSize, String themeName) {
        return articleServiceImpl.groupByTime(pageNum, pageSize,themeName);
    }

    @Cacheable(key = "'" + CacheConstant.POSTS_CACHE_KEY_PREFIX + "listArticleType_'+#p0+'_'+#p1+'_'+#p2")
    public List<BlogArticle> listBlogArticlesByType(Byte type, int pageSize, String ordeString) {

        return articleServiceImpl.listBlogArticlesByType(type, pageSize, ordeString);
    }

    /**
     * 综合查询
     * 
     * @param bb
     * @return
     */
    public List<BlogArticle> listBlogArticles(BlogArticleSearchParam bb,String themeName) {

        return articleServiceImpl.listBlogArticles(bb,themeName);
    }
}
