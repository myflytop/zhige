package com.ruoyi.blog.service.impl;

import com.ruoyi.blog.mould.*;
import com.ruoyi.blog.mould.pam.BlogArticleSearchParam;
import com.ruoyi.cms.common.constant.CacheConstant;
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
    @Cacheable(CacheConstant.POST_CACHE_NAME)
    public BlogArticle getBlogArticle(BlogArticle blogArticle) {
        return super.getBlogArticle(blogArticle);
    }

    @Override
    @Cacheable("listBlogArticlesByCatId")
    public List<BlogArticle> listBlogArticlesByCatId(BlogArticleSearchParam blogArticleSearchParam) {
        return super.listBlogArticlesByCatId(blogArticleSearchParam);
    }

    @Override
    @Cacheable("listBlogArticlesByTagId")
    public List<BlogArticle> listBlogArticlesByTagId(BlogArticleSearchParam blogArticleSearchParam) {
        return super.listBlogArticlesByTagId(blogArticleSearchParam);
    }

    @Override
    @Cacheable("getBlogTagByTagId")
    public BlogTag getBlogTagByTagId(long tagId) {
        return super.getBlogTagByTagId(tagId);
    }

    @Override
    @Cacheable("getBlogCatByCatId")
    public BlogCat getBlogCatByCatId(long catId) {
        return super.getBlogCatByCatId(catId);
    }

    @Override
    @Cacheable("listHotCats")
    public List<BlogCat> listHotCats(Long[] str) {
        return super.listHotCats(str);
    }

    @Override
    @Cacheable("listHotTags")
    public List<BlogTag> listHotTags(Long[] str) {
        return super.listHotTags(str);
    }

    @Override
    public List<Long> listArticleIdsByCatId(long catId) {
        return super.listArticleIdsByCatId(catId);
    }

    @Override
    public List<Long> listArticleIdsByTagId(long tagId) {
        return super.listArticleIdsByTagId(tagId);
    }

    @Override
    public BlogMenu getBlogMenuByMenuUrl(String columnUrl) {
        return super.getBlogMenuByMenuUrl(columnUrl);
    }

    @Override
    public BlogTag getBlogTagByTagUrl(String tagUrl) {
        return super.getBlogTagByTagUrl(tagUrl);
    }

    @Override
    public BlogCat getBlogCatByCatUrl(String catUrl) {
        return super.getBlogCatByCatUrl(catUrl);
    }

    @Override
    public BlogArticle getBlogArticleByArticleUrl(String articleUrl) {
        return super.getBlogArticleByArticleUrl(articleUrl);
    }


}
