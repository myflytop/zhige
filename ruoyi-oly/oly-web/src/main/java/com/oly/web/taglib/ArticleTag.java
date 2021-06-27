package com.oly.web.taglib;

import java.util.List;

import com.oly.common.model.support.PageData;
import com.oly.web.model.po.BlogArticle;
import com.oly.web.service.cache.BlogArticleCacheService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 文章标签 涉及文章表的操作
 */
@Service("articleTag")
public class ArticleTag {
    @Autowired
    private BlogArticleCacheService blogPostService;

    /**
     * 获取文章
     * 
     * @param articleId
     * @return
     */
    public BlogArticle getBlogArticleHtmlById(long articleId) {
        return blogPostService.getBlogArticleHtmlById(articleId);
    }

    /* 首页缓存 */
    public PageData indexPosts(String themeName, int pageSize) {
        List<BlogArticle> list = blogPostService.listBlogArticlesOrder(pageSize, "create_time desc", themeName);
        PageData pageOne = PageData.getData(list);
        return pageOne;
    }

    /**
     * 文章类型
     * 
     * @param pageSize    获取条数
     * @param articleType 文章类型
     * @return
     */
    public List<BlogArticle> listBlogArticleByType(Byte articleType, int pageSize) {
        return this.sortType(articleType, pageSize, "create_time desc");
    }

    /**
     * 依据分类
     * 
     * @param catId
     * @param size
     * @param themeName
     * @return
     */
    public List<BlogArticle> listBlogArticlesByCatId(Long catId, Integer size, String themeName) {

        return blogPostService.listBlogArticlesByCatId(catId == null ? 0L : catId, size, themeName);
    }

    /**
     * 依据标签
     * 
     * @param tagId
     * @param size
     * @param themeName
     * @return
     */
    public List<BlogArticle> listBlogArticlesByTagId(Long tagId, Integer size, String themeName) {

        return blogPostService.listBlogArticlesByTagId(tagId == null ? 0L : tagId, size, themeName);
    }

    /**
     * 依据时间排序
     * 
     * @param pageSize
     * @param themeName
     * @return
     */
    public List<BlogArticle> listBlogArticleOrderByTime(int pageSize, String themeName) {
        return this.sort(pageSize, "create_time desc", themeName);
    }

    /**
     * 获取顶置文章
     * 
     * @param pageSize
     * @param themeName
     * @return
     */
    public List<BlogArticle> listBlogArticleOrderByTop(int pageSize, String themeName) {
        return this.sort(pageSize, "article_top desc", themeName);
    }

    private List<BlogArticle> sort(int pageSize, String orderString, String themeName) {

        return blogPostService.listBlogArticlesOrder(pageSize, orderString, themeName);
    }

    private List<BlogArticle> sortType(byte type, int pageSize, String orderString) {

        return blogPostService.listBlogArticlesByType(type, pageSize, orderString);
    }

}
