package com.ruoyi.blog.service;

import com.ruoyi.blog.mould.*;
import com.ruoyi.blog.mould.pam.BlogArticleSearchParam;

import java.util.List;

public interface IBlogService {

    //获取菜单列表
    List<BlogMenu> listBlogMenus(BlogMenu blogMenu);
    //获取菜单树
    BlogMenu listBlogMenuTree(BlogMenu blogMenu);

    //通过栏目获取导航树
    BlogMenu listBlogMenuTreeByColumnId(Long columnId);

    //获取外链列表
    List<BlogLink> listBlogLinks(BlogLink blogLink);
    //获取标签列表
    List<BlogTag> listBlogTags(BlogTag blogTag);

    /**
     * 获取文章列表
     * @param blogArticleSearchParam
     * @return
     */
    List<BlogArticle> listBlogArticles(BlogArticleSearchParam blogArticleSearchParam);
    //获取文章列表
    List<BlogCat> listBlogCats(BlogCat cat);
    /**
     * 获取文章
     * @param blogArticle
     * @return
     */
    BlogArticle getBlogArticle(BlogArticle blogArticle);

    /**
     * 获取文章列表
     * @param blogArticleSearchParam
     * @return
     */
    List<BlogArticle> listBlogArticlesByCatId(BlogArticleSearchParam blogArticleSearchParam);
    /**
     * 获取文章列表
     * @param blogArticleSearchParam
     * @return
     */
    List<BlogArticle> listBlogArticlesByTagId(BlogArticleSearchParam blogArticleSearchParam);

    BlogTag getBlogTagByTagId(long tagId);
    BlogCat getBlogCatByCatId(long catId);


    List<BlogCat> listHotCats(Long str[]);

    List<BlogTag> listHotTags(Long str[]);

    List<Long> listArticleIdsByCatId(long catId);

    List<Long> listArticleIdsByTagId(long tagId);

    BlogMenu getBlogMenuByMenuUrl(String columnUrl);

    BlogTag getBlogTagByTagUrl(String tagUrl);

    BlogCat getBlogCatByCatUrl(String catUrl);

    BlogArticle getBlogArticleByArticleUrl(String articleUrl );
}
