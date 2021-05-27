package com.oly.web.taglib;

import java.util.List;

import com.oly.common.model.support.PageData;
import com.oly.web.model.po.BlogArticle;
import com.oly.web.service.cache.BlogCacheService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 文章标签 涉及文章表的操作
 */
@Service("articleTag")
public class ArticleTag {
    @Autowired
    private BlogCacheService blogService;
    /**
     * 获取文章
     * 
     * @param articleId
     * @return
     */
    public BlogArticle getBlogArticleById(long articleId) {
        return blogService.getBlogArticleByArticleId(articleId);
    }

    /* 首页缓存 */
    public PageData indexPosts(int pageSize) {  
        List<BlogArticle> list = blogService.listBlogArticles(pageSize,"create_time desc");
        PageData pageOne = PageData.getData(list);
        return pageOne;
    }

    
     /**
     * 依据时间排序
     * 
     * @param pageSize 获取条数
     * @param articleType 文章类型
     * @return
     */
    public List<BlogArticle> listBlogArticleByType(byte articleType,int pageSize) {
        return this.sortType(articleType,pageSize, "create_time desc");
    }

    /**
     * 依据时间排序
     * 
     * @param pageSize 获取条数
     * @return
     */
    public List<BlogArticle> listBlogArticleOrderByTime(int pageSize) {
        return this.sort(pageSize, "create_time desc");
    }

    /**
     * 默认依据时间排序 默认10条
     * 
     * @return
     */
    public List<BlogArticle> listBlogArticleOrderByTime() {
        return this.listBlogArticleOrderByTime(10);
    }

    /**
     * 获取顶置文章
     * 
     * @param pageSize 获取顶置数
     * @return
     */
    public List<BlogArticle> listBlogArticleOrderByTop(int pageSize) {
        return this.sort(pageSize, "article_top desc");
    }

    /**
     * 获取顶置文章
     * 
     * @return
     */
    public List<BlogArticle> listBlogArticleOrderByTop() {
        return this.listBlogArticleOrderByTop(10);
    }


    private List<BlogArticle> sort(int pageSize, String orderString) {
       
        return blogService.listBlogArticles(pageSize,orderString);
    }

    private List<BlogArticle> sortType(byte type,int pageSize, String orderString) {
       
        return blogService.listBlogArticlesByType(type,pageSize,orderString);
    }

}
