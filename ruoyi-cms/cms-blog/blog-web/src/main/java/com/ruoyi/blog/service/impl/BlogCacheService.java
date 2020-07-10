package com.ruoyi.blog.service.impl;

import com.ruoyi.blog.mould.*;
import com.ruoyi.blog.mould.pam.BlogArticleSearchParam;
import com.ruoyi.cache.redis.constant.CacheConstant;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BlogCacheService extends BlogServiceImpl {
    @Override
    @Cacheable(CacheConstant.MENU_CACHE_NAME)
    public List<BlogMenu> listBlogMenus(BlogMenu blogMenu) {
        return super.listBlogMenus(blogMenu);
    }

    @Override
    @Cacheable(CacheConstant.MENU_CACHE_NAME)
    public BlogMenu listBlogMenuTree(BlogMenu blogMenu) {
        return super.listBlogMenuTree(blogMenu);
    }

    @Override
    @Cacheable(CacheConstant.MENU_CACHE_NAME)
    public BlogMenu listBlogMenuTreeByColumnId(Long columnId) {
        return super.listBlogMenuTreeByColumnId(columnId);
    }

    @Override
    @Cacheable(CacheConstant.LINKS_CACHE_NAME)
    public List<BlogLink> listBlogLinks(BlogLink blogLink) {
        return super.listBlogLinks(blogLink);
    }

    @Override
    @Cacheable(CacheConstant.TAGS_CACHE_NAME)
    public List<BlogTag> listBlogTags(BlogTag blogTag) {
        return super.listBlogTags(blogTag);
    }

    @Override
    @Cacheable(CacheConstant.CATS_CACHE_NAME)
    public List<BlogCat> listBlogCats(BlogCat cat) {
        return super.listBlogCats(cat);
    }

    @Override
    @Cacheable(CacheConstant.POSTS_CACHE_NAME)
    public List<BlogArticle> listBlogArticles(BlogArticleSearchParam blogArticleSearchParam) {
        return super.listBlogArticles(blogArticleSearchParam);
    }

    @Override
    @Cacheable(CacheConstant.POSTS_CACHE_NAME)
    public BlogArticle getBlogArticle(BlogArticle blogArticle) {
        return super.getBlogArticle(blogArticle);
    }

    @Override
    @Cacheable(CacheConstant.POST_CACHE_NAME)
    public List<BlogArticle> listBlogArticlesByCatId(BlogArticleSearchParam blogArticleSearchParam) {
        return super.listBlogArticlesByCatId(blogArticleSearchParam);
    }

    @Override
    @Cacheable(CacheConstant.TAGS_CACHE_NAME)
    public List<BlogArticle> listBlogArticlesByTagId(BlogArticleSearchParam blogArticleSearchParam) {
        return super.listBlogArticlesByTagId(blogArticleSearchParam);
    }

    @Override
    @Cacheable(CacheConstant.CATS_CACHE_NAME)
    public List<BlogCat> listHotCats(Long[] str) {
        return super.listHotCats(str);
    }

    @Override
    @Cacheable(CacheConstant.TAGS_CACHE_NAME)
    public List<BlogTag> listHotTags(Long[] str) {
        return super.listHotTags(str);
    }

    @Override
    @Cacheable(CacheConstant.MENU_CACHE_NAME)
    public BlogMenu getBlogMenuByMenuUrl(String columnUrl) {
        return super.getBlogMenuByMenuUrl(columnUrl);
    }

    @Override
    @Cacheable(CacheConstant.TAGS_CACHE_NAME)
    public BlogTag getBlogTagByTagUrl(String tagUrl) {
        return super.getBlogTagByTagUrl(tagUrl);
    }

    @Override
    @Cacheable(CacheConstant.CATS_CACHE_NAME)
    public BlogCat getBlogCatByCatUrl(String catUrl) {
        return super.getBlogCatByCatUrl(catUrl);
    }


}
