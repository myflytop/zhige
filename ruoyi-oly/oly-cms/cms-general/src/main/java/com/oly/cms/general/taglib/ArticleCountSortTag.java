package com.oly.cms.general.taglib;

import java.util.List;

import com.oly.cms.common.model.enums.OrderEnums;
import com.oly.cms.general.model.enums.ArticleCountSortEnum;
import com.oly.cms.general.model.param.WebArticleSearchParam;
import com.oly.cms.general.model.vo.WebArticleVo;
import com.oly.cms.general.service.cache.GeneralArticleVoCacheService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 获取文章基本信息 排序
 */
@Service("articleCountSortTag")
public class ArticleCountSortTag {

    @Autowired
    private GeneralArticleVoCacheService webArticleSortService;

    public List<WebArticleVo> listWebArticleOrder(int pageNum, int pageSize, ArticleCountSortEnum sort,
            OrderEnums order) {
        return webArticleSortService.listArticlesVoOrder(pageNum, pageSize, null, null, null, null,
                sort.getOrder(order));
    }

    public List<WebArticleVo> listWebArticleOrder(int pageNum, int pageSize, String themeName,
            ArticleCountSortEnum sort, OrderEnums order) {
        return webArticleSortService.listArticlesVoOrder(pageNum, pageSize, null, null, null, themeName,
                sort.getOrder(order));
    }

    public List<WebArticleVo> listArticlesVo(int num, int size, Integer articleType, Long catId, Long tagId,
            String themeName,
            ArticleCountSortEnum sort, OrderEnums order) {
        return webArticleSortService.listArticlesVoOrder(num, size, articleType, catId, tagId, themeName,
                sort.getOrder(order));
    }

    public List<WebArticleVo> listArticleVo(WebArticleSearchParam bb) {
        return webArticleSortService.listArticleVo(bb);
    }

    public List<WebArticleVo> listArticleVoOrder(int num, int size, WebArticleSearchParam bb,
            String order) {
        return webArticleSortService.listArticleVoOrder(num, size, bb, order);
    }

}
