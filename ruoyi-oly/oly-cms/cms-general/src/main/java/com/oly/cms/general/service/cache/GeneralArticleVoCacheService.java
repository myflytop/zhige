package com.oly.cms.general.service.cache;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.oly.cms.common.constant.CacheConstant;
import com.oly.cms.general.model.param.WebArticleSearchParam;
import com.oly.cms.general.model.vo.WebArticleVo;
import com.oly.cms.general.service.search.GeneralArticleVoServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

@Service
@CacheConfig(cacheNames = CacheConstant.POST_CACHE_KEY_PREFIX)
public class GeneralArticleVoCacheService {

    @Autowired
    private GeneralArticleVoServiceImpl webSortService;

    public List<WebArticleVo> listArticleVo(WebArticleSearchParam bb) {
        return webSortService.listArticleVo(bb);
    }

    public List<WebArticleVo> listArticleVoOrder(int num, int size, WebArticleSearchParam bb,
            String order) {

        return webSortService.listArticleVoOrder(num, size, bb, order);
    }

    // 只涉及文章表和统计表
    @Cacheable(keyGenerator = "myKeyGenerator")
    public List<WebArticleVo> listArticlesVoOrder(int num, int size, Integer articleType, Long catId, Long tagId,
            String themeName,
            String order) {
        return webSortService.listArticleVoOrder(num, size, articleType, catId, tagId, themeName, order);
    }

    @Cacheable(keyGenerator = "myKeyGenerator")
    public WebArticleVo selectNextArticle(long articleId) {
        return webSortService.selectNextArticle(articleId);
    }

    @Cacheable(keyGenerator = "myKeyGenerator")
    public WebArticleVo selectPreArticle(long articleId) {
        return webSortService.selectPreArticle(articleId);
    }

    @Cacheable(keyGenerator = "myKeyGenerator")
    public Map<String, WebArticleVo> selectPreAndNextArticle(long articleId) {
        Map<String, WebArticleVo> mp = new HashMap<>();
        mp.put("next", webSortService.selectNextArticle(articleId));
        mp.put("pre", webSortService.selectPreArticle(articleId));
        return mp;
    }

}
