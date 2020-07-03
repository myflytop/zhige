package com.ruoyi.blog.mapper;

import com.ruoyi.blog.mould.*;
import com.ruoyi.blog.mould.pam.BlogArticleSearchParam;

import java.util.List;

public interface BlogMapper {

    /**
     * 获取菜单列表
     * @param blogMenu
     * @return
     */
    List<BlogMenu> listBlogMenus(BlogMenu blogMenu);

    /**
     * 获取链接列表
     * @param blogLink
     * @return
     */
    List<BlogLink> listBlogLinks(BlogLink blogLink);

    /**
     * 获取标签列表
     * @param blogTag
     * @return
     */
    List<BlogTag> listBlogTags(BlogTag blogTag);

    /**
     * 获取文章分类
     * @param blogCat
     * @return
     */
    List<BlogCat> listBlogCats(BlogCat blogCat);

    /**
     * 获取文章列表
     * @param blogArticleSearchParam
     * @return
     */
    List<BlogArticle> listBlogArticles(BlogArticleSearchParam blogArticleSearchParam);

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

    /**
     * 获取文章
     * @param blogArticle
     * @return
     */
    BlogArticle getBlogArticle(BlogArticle blogArticle);

   BlogTag getBlogTagByTagId(long tagId);

   BlogCat getBlogCatByCatId(long catId);

   BlogMenu getBlogMenuByMenuId(long columnId);

   BlogArticle getBlogArticleByArticleId(long articleId);

    List<BlogCat> listHotCats(Long str[]);

    List<BlogTag> listHotTags(Long str[]);


    List<Long> listArticleIdsByCatId(long catId);

    List<Long>  listArticleIdsByTagId(long tagId);

    BlogMenu getBlogMenuByMenuUrl(String columnUrl);

    BlogTag getBlogTagByTagUrl(String tagUrl);

    BlogCat getBlogCatByCatUrl(String catUrl);

    BlogArticle getBlogArticleByArticleUrl(String articleUrl );
}
