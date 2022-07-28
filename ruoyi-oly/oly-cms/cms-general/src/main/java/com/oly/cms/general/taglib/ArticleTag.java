package com.oly.cms.general.taglib;

import java.util.List;

import com.oly.cms.common.model.enums.ArticleEditTypeEnums;
import com.oly.cms.common.model.enums.ArticleKeyTypeEnums;
import com.oly.cms.common.model.support.PageData;
import com.oly.cms.general.model.param.WebArticleSearchParam;
import com.oly.cms.general.model.po.WebArticle;
import com.oly.cms.general.service.cache.GeneralArticleCacheService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 文章标签 涉及文章表的操作
 */
@Service("articleTag")
public class ArticleTag {
    @Autowired
    private GeneralArticleCacheService webPostService;

    /**
     * 获取文章Html
     * 
     * @param articleId
     * @return
     */
    public WebArticle getWebArticleHtmlById(String articleId) {
        return webPostService.getWebArticle(ArticleKeyTypeEnums.ID, articleId, ArticleEditTypeEnums.RICH);
    }

    /**
     * 获取文章MarkDown
     * 
     * @param articleId
     * @return
     */
    public WebArticle getWebArticleMdById(String articleId) {
        return webPostService.getWebArticle(ArticleKeyTypeEnums.ID, articleId, ArticleEditTypeEnums.RICH);
    }

    /**
     * 获取文章Html
     * 
     * @param articleUrl
     * @return
     */
    public WebArticle getWebArticleHtmlByUrl(String articleUrl) {
        return webPostService.getWebArticle(ArticleKeyTypeEnums.URL, articleUrl, ArticleEditTypeEnums.RICH);
    }

    /**
     * 获取文章MarkDown
     * 
     * @param articleUrl
     * @return
     */
    public WebArticle getWebArticleMdByUrl(String articleUrl) {
        return webPostService.getWebArticle(ArticleKeyTypeEnums.URL, articleUrl, ArticleEditTypeEnums.MD);
    }

    /**
     * 依据分类 严格模式
     * 
     * @param catId
     * @param num
     * @param size
     * @param themeName
     * @return
     */
    public List<WebArticle> listWebArticlesByCatId(long catId, int num, int size, String themeName) {

        return webPostService.listWebArticlesByCatId(catId, num, size, themeName);
    }

    /**
     * 依据分类
     * 
     * @param catId
     * @param num
     * @param size
     * @return
     */
    public List<WebArticle> listWebArticlesByCatId(long catId, int num, int size) {

        return webPostService.listWebArticlesByCatId(catId, num, size);
    }

    /**
     * 依据标签 严格模式
     * 
     * @param tagId
     * @param num
     * @param size
     * @param themeName
     * @return
     */
    public List<WebArticle> listWebArticlesByTagId(long tagId, int num, int size, String themeName) {

        return webPostService.listWebArticlesByTagId(tagId, num, size, themeName);
    }

    /**
     * 依据标签
     * 
     * @param tagId
     * @param num
     * @param size
     * @return
     */
    public List<WebArticle> listWebArticlesByTagId(long tagId, int num, int size) {

        return webPostService.listWebArticlesByTagId(tagId, num, size);
    }

    /**
     * 依据类型
     * 
     * @param articleType
     * @param pageNum
     * @param pageSize
     * @return
     */
    public List<WebArticle> listWebArticleByType(int articleType, int pageNum, int pageSize) {
        return webPostService.listWebArticlesByType(articleType, pageNum, pageSize, "create_time desc");
    }

    /**
     * 文章列表
     * 
     * @param themeName
     * @param pageNum
     * @param pageSize
     * @return
     */
    public PageData pagePosts(String themeName, int pageNum, int pageSize) {
        List<WebArticle> list = webPostService.listWebArticlesOrder(pageNum, pageSize, "create_time desc", themeName);
        PageData pageOne = PageData.getData(list);
        return pageOne;
    }

    public List<WebArticle> listWebArticleOrderByTime(int pageNum, int pageSize, String themeName) {
        return this.sort(pageNum, pageSize, "create_time desc", themeName);
    }

    public List<WebArticle> listWebArticleOrderByTop(int pageNum, int pageSize, String themeName) {
        return this.sort(pageNum, pageSize, "article_top desc", themeName);
    }

    /**
     * 验证是文章否支持评论
     * 
     * @param articleId
     * @return
     */
    public boolean checkArticleSupportComment(String articleId) {
        return webPostService.checkArticleSupportComment(articleId);
    }

    private List<WebArticle> sort(int pageNum, int pageSize, String orderString, String themeName) {

        return webPostService.listWebArticlesOrder(pageNum, pageSize, orderString, themeName);
    }

    /**
     * 综合查询
     * 
     * @param bb
     * @return
     */
    public List<WebArticle> listWebArticles(WebArticleSearchParam bb, String themeName) {

        return webPostService.listWebArticles(bb);
    }

}