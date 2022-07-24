package com.oly.cms.general.service.cache;

import java.util.List;

import com.oly.cms.common.constant.CacheConstant;
import com.oly.cms.general.model.vo.WebArticleCountVo;
import com.oly.cms.general.service.search.GeneralWebArticleCountVoServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

@Service
@CacheConfig(cacheNames = CacheConstant.POST_CACHE_KEY_PREFIX)
public class GeneralWebArticleCountVoCacheService {

    @Autowired
    private GeneralWebArticleCountVoServiceImpl webSortService;

    public List<WebArticleCountVo> listWebArticleCountVo(String themeName) {
        return webSortService.listArticlesCountSort(themeName);
    }

    // 只涉及文章表和统计表
    @Cacheable(keyGenerator = "myKeyGenerator")
    public List<WebArticleCountVo> listWebArticleCountVoOrderByLook(int pageNum, int pageSize, String themeName) {
        return webSortService.listArticlesCountSort(pageNum, pageSize, "article_look desc", themeName);
    }

    // 只涉及文章表和统计表
    @Cacheable(keyGenerator = "myKeyGenerator")
    public List<WebArticleCountVo> listWebArticleCountVoOrderByLike(int pageNum, int pageSize, String themeName) {

        return webSortService.listArticlesCountSort(pageNum, pageSize, "article_like desc", themeName);
    }

    // 只涉及文章表和统计表
    @Cacheable(keyGenerator = "myKeyGenerator")
    public List<WebArticleCountVo> listWebArticleCountVoOrderByScore(int pageNum, int pageSize, String themeName) {
        return webSortService.listArticlesCountSort(pageNum, pageSize, "article_score desc", themeName);
    }

    // 只涉及文章表和统计表
    @Cacheable(keyGenerator = "myKeyGenerator")
    public List<WebArticleCountVo> listWebArticleCountVoOrderByCollect(int pageNum, int pageSize, String themeName) {

        return webSortService.listArticlesCountSort(pageNum, pageSize, "article_collect desc", themeName);
    }

    // 只涉及文章表和统计表
    @Cacheable(keyGenerator = "myKeyGenerator")
    public List<WebArticleCountVo> listWebArticleCountVoOrderByShare(int pageNum, int pageSize, String themeName) {

        return webSortService.listArticlesCountSort(pageNum, pageSize, "article_share desc", themeName);
    }

    // 只涉及文章表和统计表
    @Cacheable(keyGenerator = "myKeyGenerator")
    public List<WebArticleCountVo> listWebArticleCountVoOrderByNasty(int pageNum, int pageSize, String themeName) {
        return webSortService.listArticlesCountSort(pageNum, pageSize, "article_nasty desc", themeName);
    }

}
