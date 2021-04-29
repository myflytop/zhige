package com.oly.web.service;

import java.util.List;

import com.oly.web.model.pam.BlogArticleSearchParam;
import com.oly.web.model.po.BlogArticle;
import com.oly.web.model.po.BlogCat;
import com.oly.web.model.po.BlogLink;
import com.oly.web.model.po.BlogMenu;
import com.oly.web.model.po.BlogTag;

public interface IBlogService {

    // 获取菜单列表
    List<BlogMenu> listBlogMenus(BlogMenu blogMenu);

    // 获取菜单树
    BlogMenu listBlogMenuTree(BlogMenu blogMenu);

    // 通过栏目获取导航树
    BlogMenu listBlogMenuTreeByColumnId(Long columnId);
    
    /**
     * 通过ID获取单个菜单信息
     * @param menuId
     * @return
     */
    public BlogMenu getBlogMenuById(Long menuId);

    // 获取外链列表
    List<BlogLink> listBlogLinks(BlogLink blogLink);

    public BlogLink getBlogLinkById(Long linkId);

    // 获取标签列表
    List<BlogTag> listBlogTags(BlogTag blogTag);

    /**
     * 获取文章列表
     * 
     * @param blogArticleSearchParam
     * @return
     */
    List<BlogArticle> listBlogArticles(BlogArticleSearchParam blogArticleSearchParam);

    // 获取文章列表
    List<BlogCat> listBlogCats(BlogCat cat);

    /**
     * 获取文章
     * 
     * @param blogArticle
     * @return
     */
    BlogArticle getBlogArticle(BlogArticle blogArticle);

    


    BlogTag getBlogTagByTagId(long tagId);

    BlogCat getBlogCatByCatId(long catId);

    List<BlogCat> listHotCats(Long str[]);

    List<BlogTag> listHotTags(Long str[]);

    List<Long> listArticleIdsByCatId(long catId);

    List<Long> listArticleIdsByTagId(long tagId);

    BlogTag getBlogTagByTagUrl(String tagUrl);

    BlogCat getBlogCatByCatUrl(String catUrl);

    BlogArticle getBlogArticleByArticleUrl(String articleUrl);

    BlogArticle getBlogArticleByArticleId(long articleId);
}
