package com.oly.cms.general.service.cache;

import java.util.List;

import com.oly.cms.common.constant.CacheConstant;
import com.oly.cms.common.model.enums.ArticleEditTypeEnums;
import com.oly.cms.common.model.enums.ArticleKeyTypeEnums;
import com.oly.cms.common.model.enums.OrderEnums;
import com.oly.cms.general.model.PageArticleTimeLine;
import com.oly.cms.general.model.param.WebArticleSearchParam;
import com.oly.cms.general.model.po.WebArticle;
import com.oly.cms.general.service.search.GeneralArticleServiceImpl;
import com.ruoyi.common.core.text.Convert;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

@Service
@CacheConfig(cacheNames = CacheConstant.POST_CACHE_KEY_PREFIX)
public class GeneralArticleCacheService {

    @Autowired
    private GeneralArticleServiceImpl articleServiceImpl;

    @Cacheable(keyGenerator = "myKeyGenerator")
    public WebArticle getWebArticle(ArticleKeyTypeEnums keyType, String key, ArticleEditTypeEnums editType) {

        return articleServiceImpl.getWebArticle(keyType, key, editType);
    }

    @Cacheable(keyGenerator = "myKeyGenerator")
    public WebArticle getWebArticleMdByUrl(String articleUrl) {

        return articleServiceImpl.getWebArticleMdByUrl(articleUrl);
    }

    @Cacheable(keyGenerator = "myKeyGenerator")
    public List<WebArticle> listWebArticlesByCatId(long catId, String themeName, int pageNum, int pageSize,
            OrderEnums order) {

        return articleServiceImpl.listWebArticlesByCatId(catId, themeName, pageNum, pageSize, order);
    }

    @Cacheable(keyGenerator = "myKeyGenerator")
    public List<WebArticle> listWebArticlesByTagId(long tagId, String themeName, int pageNum, int pageSize,
            OrderEnums order) {
        return articleServiceImpl.listWebArticlesByTagId(tagId, themeName, pageNum, pageSize, order);
    }

    @Cacheable(keyGenerator = "myKeyGenerator")
    public List<WebArticle> listWebArticlesOrder(int pageNum, int pageSize, String orderString, String themeName) {

        return articleServiceImpl.listWebArticlesOrder(pageNum, pageSize, orderString, themeName);
    }

    @Cacheable(keyGenerator = "myKeyGenerator")
    public PageArticleTimeLine groupByTime(int pageNum, int pageSize, String themeName) {
        return articleServiceImpl.groupByTime(pageNum, pageSize, themeName);
    }

    @Cacheable(keyGenerator = "myKeyGenerator")
    public List<WebArticle> listWebArticlesByType(int type, int pageNum, int pageSize, String ordeString) {

        return articleServiceImpl.listWebArticlesByType(type, pageNum, pageSize, ordeString);
    }

    /**
     * 综合查询
     * 
     * @param bb
     * @return
     */
    public List<WebArticle> listWebArticles(WebArticleSearchParam bb) {

        return articleServiceImpl.listWebArticles(bb);
    }

    public boolean checkArticleSupportComment(String articleId) {
        return articleServiceImpl.allowComment(Convert.toLong(articleId));
    }
}
