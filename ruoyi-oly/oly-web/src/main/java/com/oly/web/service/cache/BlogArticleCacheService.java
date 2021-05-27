package com.oly.web.service.cache;

import java.util.List;

import com.oly.common.constant.CacheConstant;
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
    public BlogArticle getBlogArticleById(Long articleId) {

        return articleServiceImpl.getBlogArticleById(articleId);
    }

    @Cacheable(key = "'" + CacheConstant.POST_CACHE_KEY_PREFIX + "getArticleUrl_'+#p0")
    public BlogArticle getBlogArticleByUrl(String articleUrl) {

        return articleServiceImpl.getBlogArticleByUrl(articleUrl);
    }

    @Cacheable(key = "'" + CacheConstant.POSTS_CACHE_KEY_PREFIX + "listArticleByCatId_'+#p0")
    public List<BlogArticle> listBlogArticlesByCatId(Long catId) {

        return articleServiceImpl.listBlogArticlesByCatId(catId);
    }

    @Cacheable(key = "'" + CacheConstant.POSTS_CACHE_KEY_PREFIX + "listArticleByTagId_'+#p0")
    public List<BlogArticle> listBlogArticlesByTagId(Long tagId) {

        return articleServiceImpl.listBlogArticlesByTagId(tagId);
    }

    public List<BlogArticle> listBlogArticles(BlogArticleSearchParam blogArticleSearchParam) {

        return articleServiceImpl.listBlogArticles(blogArticleSearchParam);
    }

}
