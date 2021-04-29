package com.oly.web.mapper;

import java.util.List;

import com.oly.web.model.pam.BlogArticleSearchParam;
import com.oly.web.model.po.BlogArticle;
import com.oly.web.model.po.BlogCat;
import com.oly.web.model.po.BlogLink;
import com.oly.web.model.po.BlogMenu;
import com.oly.web.model.po.BlogTag;

public interface BlogSearchMapper {

    /**
     * 获取菜单列表
     * 
     * @param blogMenu
     * @return
     */
    List<BlogMenu> listBlogMenus(BlogMenu blogMenu);

    BlogMenu getBlogMenuByMenuId(long columnId);

    /**
     * 获取链接列表
     * 
     * @param blogLink
     * @return
     */
    List<BlogLink> listBlogLinks(BlogLink blogLink);

    BlogLink getBlogLinkById(Long linkId);

    /**
     * 获取标签列表
     * 
     * @param blogTag
     * @return
     */
    List<BlogTag> listBlogTags(BlogTag blogTag);

    BlogTag getBlogTagByTagId(long tagId);

    BlogCat getBlogCatByCatId(long catId);

    /**
     * 获取分类
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
    List<BlogArticle> listBlogArticlesBySearch(BlogArticleSearchParam blogArticleSearchParam);

    

    /**
     * 获取文章 通过id 指定文章类型
     * 
     * @param blogArticle
     * @return
     */
    BlogArticle getBlogArticle(BlogArticle blogArticle);

  

    

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

  

}
