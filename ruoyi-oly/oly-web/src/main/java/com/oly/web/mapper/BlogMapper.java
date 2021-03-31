package com.oly.web.mapper;

import java.util.List;

import com.oly.web.mould.BlogArticle;
import com.oly.web.mould.BlogCat;
import com.oly.web.mould.BlogLink;
import com.oly.web.mould.BlogMenu;
import com.oly.web.mould.BlogTag;
import com.oly.web.mould.pam.BlogArticleSearchParam;

public interface BlogMapper {

    /**
     * 获取菜单列表
     * 
     * @param blogMenu
     * @return
     */
    List<BlogMenu> listBlogMenus(BlogMenu blogMenu);

    /**
     * 获取链接列表
     * 
     * @param blogLink
     * @return
     */
    List<BlogLink> listBlogLinks(BlogLink blogLink);

    /**
     * 获取标签列表
     * 
     * @param blogTag
     * @return
     */
    List<BlogTag> listBlogTags(BlogTag blogTag);

    /**
     * 获取文章分类
     * 
     * @param blogCat
     * @return
     */
    List<BlogCat> listBlogCats(BlogCat blogCat);

    /**
     * 获取文章列表
     * 
     * @param blogArticleSearchParam
     * @return
     */
    List<BlogArticle> listBlogArticles(BlogArticleSearchParam blogArticleSearchParam);

    /**
     * 获取文章列表
     * 
     * @param blogArticleSearchParam
     * @return
     */
    List<BlogArticle> listBlogArticlesByCatId(BlogArticleSearchParam blogArticleSearchParam);

    /**
     * 获取文章列表
     * 
     * @param blogArticleSearchParam
     * @return
     */
    List<BlogArticle> listBlogArticlesByTagId(BlogArticleSearchParam blogArticleSearchParam);

    /**
     * 获取文章 通过id 指定文章类型
     * 
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

    List<Long> listArticleIdsByTagId(long tagId);

    BlogTag getBlogTagByTagUrl(String tagUrl);

    BlogCat getBlogCatByCatUrl(String catUrl);

    BlogArticle getBlogArticleByArticleUrl(String articleUrl);

    int checkCatIsHidden(long catId);

    int checkTagIsHidden(long tagId);

    BlogLink getBlogLinkById(Long linkId);

}
