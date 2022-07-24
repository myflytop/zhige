package com.oly.cms.general.service.cache;

import java.util.List;

import com.oly.cms.common.constant.CacheConstant;
import com.oly.cms.common.domain.entity.CmsArticleCount;
import com.oly.cms.general.service.impl.GeneralArticleSortServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

@Service
@CacheConfig(cacheNames = CacheConstant.POST_CACHE_KEY_PREFIX)
public class GeneralArticleSortCacheService {

    @Autowired
    private GeneralArticleSortServiceImpl webSortService;

    public List<CmsArticleCount> listCmsArticleCount(String themeName) {
        return webSortService.listArticlesCountSort(themeName);
    }

    // 只涉及文章表和统计表
    @Cacheable(keyGenerator = "myKeyGenerator")
    public List<CmsArticleCount> listCmsArticleCountOrderByLook(int pageNum, int pageSize, String themeName) {
        return webSortService.listArticlesCountSort(pageNum, pageSize, "article_look desc", themeName);
    }

    // 只涉及文章表和统计表
    @Cacheable(keyGenerator = "myKeyGenerator")
    public List<CmsArticleCount> listCmsArticleCountOrderByLike(int pageNum, int pageSize, String themeName) {

        return webSortService.listArticlesCountSort(pageNum, pageSize, "article_like desc", themeName);
    }

    // 只涉及文章表和统计表
    @Cacheable(keyGenerator = "myKeyGenerator")
    public List<CmsArticleCount> listCmsArticleCountOrderByScore(int pageNum, int pageSize, String themeName) {
        return webSortService.listArticlesCountSort(pageNum, pageSize, "article_score desc", themeName);
    }

    // 只涉及文章表和统计表
    @Cacheable(keyGenerator = "myKeyGenerator")
    public List<CmsArticleCount> listCmsArticleCountOrderByCollect(int pageNum, int pageSize, String themeName) {

        return webSortService.listArticlesCountSort(pageNum, pageSize, "article_collect desc", themeName);
    }

    // 只涉及文章表和统计表
    @Cacheable(keyGenerator = "myKeyGenerator")
    public List<CmsArticleCount> listCmsArticleCountOrderByShare(int pageNum, int pageSize, String themeName) {

        return webSortService.listArticlesCountSort(pageNum, pageSize, "article_share desc", themeName);
    }

    // 只涉及文章表和统计表
    @Cacheable(keyGenerator = "myKeyGenerator")
    public List<CmsArticleCount> listCmsArticleCountOrderByNasty(int pageNum, int pageSize, String themeName) {
        return webSortService.listArticlesCountSort(pageNum, pageSize, "article_nasty desc", themeName);
    }

}
