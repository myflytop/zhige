package com.oly.cms.general.taglib;

import java.util.List;

import com.oly.cms.common.model.TimeNum;
import com.oly.cms.common.model.enums.ArticleEditTypeEnums;
import com.oly.cms.common.model.enums.ArticleKeyTypeEnums;
import com.oly.cms.common.model.enums.OrderEnums;
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
     * 获取文章数量
     * 
     * @param themeName
     * @return
     */
    public int getArticleNum(String themeName) {
        return webPostService.getArticleNum(themeName);
    }

    /**
     * 依据年月获取文章数量
     * 
     * @param pageNum
     * @param pageSize
     * @return
     */
    public List<TimeNum> listArticleTimeNum(int pageNum, int pageSize) {
        return webPostService.listArticleTimeNum(pageNum, pageSize);
    }

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

        return webPostService.listWebArticlesOrder(num, size, null, catId, null, themeName, OrderEnums.DESC);
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

        return webPostService.listWebArticlesOrder(num, size, null, catId, null, null, OrderEnums.DESC);
    }

    /**
     * 依据分类 严格模式
     * 
     * @param catId
     * @param themeName
     * @param num
     * @param size
     * @param order
     * @return
     */
    public List<WebArticle> listWebArticlesOrderByCatId(long catId, String themeName, int num, int size,
            OrderEnums order) {

        return webPostService.listWebArticlesOrder(num, size, null, catId, null, themeName, order);
    }

    /**
     * 依据分类
     * 
     * @param catId
     * @param num
     * @param size
     * @param order
     * @return
     */
    public List<WebArticle> listWebArticlesOrderByCatId(long catId, int num, int size, OrderEnums order) {

        return webPostService.listWebArticlesOrder(num, size, null, catId, null, null, order);
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

        return webPostService.listWebArticlesOrder(num, size, null, null, tagId, themeName, OrderEnums.DESC);
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

        return webPostService.listWebArticlesOrder(num, size, null, null, tagId, null, OrderEnums.DESC);
    }

    /**
     * 依据标签 严格模式
     * 
     * @param tagId
     * @param themeName
     * @param num
     * @param size
     * @param order
     * @return
     */
    public List<WebArticle> listWebArticlesOrderByTagId(long tagId, String themeName, int num, int size,
            OrderEnums order) {

        return webPostService.listWebArticlesOrder(num, size, null, null, tagId, themeName, order);
    }

    /**
     * 依据标签
     * 
     * @param tagId
     * @param num
     * @param size
     * @param order
     * @return
     */
    public List<WebArticle> listWebArticlesOrderByTagId(long tagId, int num, int size, OrderEnums order) {

        return webPostService.listWebArticlesOrder(num, size, null, null, tagId, null, order);
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
        return webPostService.listWebArticlesOrder(pageNum, pageSize, articleType, null, null, null, OrderEnums.DESC);
    }

    /**
     * 
     * @param articleType
     * @param pageNum
     * @param pageSize
     * @param order
     * @return
     */
    public List<WebArticle> listWebArticleByType(int articleType, int pageNum, int pageSize, OrderEnums order) {
        return webPostService.listWebArticlesOrder(pageNum, pageSize, articleType, null, null, null, order);
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
        List<WebArticle> list = webPostService.listWebArticlesOrder(pageNum, pageSize, null, null, null, null,
                OrderEnums.DESC);
        PageData pageOne = PageData.getData(list);
        return pageOne;
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

    /**
     * 综合查询
     * 
     * @param bb
     * @return
     */
    public List<WebArticle> listWebArticles(WebArticleSearchParam bb) {

        return webPostService.listWebArticles(bb);
    }

}
