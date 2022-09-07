package com.oly.cms.general.taglib;

import java.util.List;
import java.util.Map;

import com.oly.cms.common.model.enums.OrderEnums;
import com.oly.cms.general.model.PageArticleVoTimeLine;
import com.oly.cms.general.model.enums.ArticleCountSortEnum;
import com.oly.cms.general.model.param.WebArticleSearchParam;
import com.oly.cms.general.model.vo.WebArticleVo;
import com.oly.cms.general.service.cache.GeneralArticleVoCacheService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 获取文章基本信息
 */
@Service("articleCountSortTag")
public class ArticleCountSortTag {

        @Autowired
        private GeneralArticleVoCacheService webArticleSortService;

        /**
         * 综合
         * 
         * @param num
         * @param size
         * @param articleType
         * @param catId
         * @param tagId
         * @param themeName
         * @param sort
         * @param order
         * @return
         */
        public List<WebArticleVo> listArticlesVo(int num, int size, Integer articleType, Long catId, Long tagId,
                        String themeName,
                        ArticleCountSortEnum sort, OrderEnums order) {
                return webArticleSortService.listArticlesVoOrder(num, size, articleType, catId, tagId, themeName,
                                sort.getOrder(order));
        }

        /**
         * 文章排序
         * 
         * @param pageNum
         * @param pageSize
         * @param sort
         * @param order
         * @return
         */
        public List<WebArticleVo> listWebArticleOrder(int pageNum, int pageSize, ArticleCountSortEnum sort,
                        OrderEnums order) {
                return webArticleSortService.listArticlesVoOrder(pageNum, pageSize, null, null, null, null,
                                sort.getOrder(order));
        }

        /**
         * 通过主题名
         * 
         * @param pageNum
         * @param pageSize
         * @param themeName
         * @param sort
         * @param order
         * @return
         */
        public List<WebArticleVo> listWebArticleOrder(int pageNum, int pageSize, String themeName,
                        ArticleCountSortEnum sort, OrderEnums order) {
                return webArticleSortService.listArticlesVoOrder(pageNum, pageSize, null, null, null, themeName,
                                sort.getOrder(order));
        }

        /**
         * 通过文章类型
         * 
         * @param pageNum
         * @param pageSize
         * @param articleType
         * @param themeName
         * @param sort
         * @param order
         * @return
         */
        public List<WebArticleVo> listWebArticleOrderByType(int pageNum, int pageSize, Integer articleType,
                        String themeName,
                        ArticleCountSortEnum sort, OrderEnums order) {
                return webArticleSortService.listArticlesVoOrder(pageNum, pageSize, articleType, null, null, themeName,
                                sort.getOrder(order));
        }

        /**
         * 通过分类ID
         * 
         * @param pageNum
         * @param pageSize
         * @param catId
         * @param themeName
         * @param sort
         * @param order
         * @return
         */
        public List<WebArticleVo> listWebArticleOrderByCatId(int pageNum, int pageSize, long catId,
                        String themeName,
                        ArticleCountSortEnum sort, OrderEnums order) {
                return webArticleSortService.listArticlesVoOrder(pageNum, pageSize, null, catId, null, themeName,
                                sort.getOrder(order));
        }

        /**
         * 通过标签ID
         * 
         * @param pageNum
         * @param pageSize
         * @param tagId
         * @param themeName
         * @param sort
         * @param order
         * @return
         */
        public List<WebArticleVo> listWebArticleOrderByTagId(int pageNum, int pageSize, long tagId,
                        String themeName,
                        ArticleCountSortEnum sort, OrderEnums order) {
                return webArticleSortService.listArticlesVoOrder(pageNum, pageSize, null, null, tagId, themeName,
                                sort.getOrder(order));
        }

        /**
         * 默认 tagId
         * 
         * @param themeName
         * @param tagId
         * @param pageNum
         * @param pageSize
         * @return
         */
        public List<WebArticleVo> listWebArticleByTagId(String themeName, long tagId, int pageNum, int pageSize) {
                return webArticleSortService.listArticlesVoOrder(pageNum, pageSize, null, null, tagId, themeName,
                                ArticleCountSortEnum.TIME.getOrder(OrderEnums.DESC));
        }

        /**
         * 默认 catId
         * 
         * @param themeName
         * @param catId
         * @param pageNum
         * @param pageSize
         * @return
         */
        public List<WebArticleVo> listWebArticleByCatId(String themeName, long catId, int pageNum, int pageSize) {
                return webArticleSortService.listArticlesVoOrder(pageNum, pageSize, null, catId, null, themeName,
                                ArticleCountSortEnum.TIME.getOrder(OrderEnums.DESC));
        }

        /**
         * 上一条
         * 
         * @param themeName
         * @param articleId
         * @return
         */
        public WebArticleVo selectPreArticle(long articleId, String themeName) {
                return this.selectPreAndNextArticle(articleId, themeName).get("pre");
        }

        /**
         * 下一条
         * 
         * @param articleId
         * @param themeName
         * @return
         */
        public WebArticleVo selectNextArticle(long articleId, String themeName) {
                return this.selectPreAndNextArticle(articleId, themeName).get("next");
        }

        /**
         * 上下
         * 
         * @param articleId
         *                  * @param themeName
         * @return
         */
        public Map<String, WebArticleVo> selectPreAndNextArticle(long articleId, String themeName) {
                return webArticleSortService.selectPreAndNextArticle(articleId, themeName);
        }

        /**
         * 分组
         * 
         * @param pageNum
         * @param pageSize
         * @param themeName
         * @param crTime
         * @return
         */
        public PageArticleVoTimeLine groupByTime(int pageNum, int pageSize, String themeName, String crTime) {

                return webArticleSortService.groupByTime(pageNum, pageSize, themeName, crTime);
        }

        public List<WebArticleVo> listArticleVo(WebArticleSearchParam bb) {
                return webArticleSortService.listArticleVo(bb);
        }

        public List<WebArticleVo> listArticleVoOrder(int num, int size, WebArticleSearchParam bb,
                        String order) {
                return webArticleSortService.listArticleVoOrder(num, size, bb, order);
        }

}
