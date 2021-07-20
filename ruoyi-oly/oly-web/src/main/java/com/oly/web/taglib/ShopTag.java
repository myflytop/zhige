package com.oly.web.taglib;

import java.util.List;

import com.oly.common.constant.CacheConstant;
import com.oly.web.model.TaokeBlogPost;
import com.oly.web.model.TaokeModel;
import com.oly.web.service.cache.BlogShopCacheService;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

@Service("shopTag")
public class ShopTag {

    private BlogShopCacheService shopService;

    /**
     * 获取文章商品通过文章ID
     * 
     * @param articleId
     * @return
     */
    public TaokeBlogPost getShopPostByArticleId(long articleId) {
        return shopService.getShopPostByArticleId(articleId);
    }

    /**
     * 获取商品列表通过标签ID
     * 
     * @param tagId
     * @return
     */
    public List<TaokeModel> listTaoKeByTagId(Long tagId, Integer pageNum, Integer pageSize) {

        return shopService.listTaoKeByTagId(tagId, pageNum, pageSize);
    }

    /**
     * 获取商品列表通过分类ID
     * 
     * @param catId
     * @return
     */
    public List<TaokeModel> listTaoKeByCatId(Long catId, Integer pageNum, Integer pageSize) {

        return shopService.listTaoKeByCatId(catId, pageNum, pageSize);
    }

    /**
     * 获取商品通过文章ID
     * 
     * @param articleId
     * @return
     */
    @Cacheable(key = "'" + CacheConstant.SHOP_CACHE_KEY_PREFIX + "'" + "methodName" + "'_'+#p0")
    public TaokeModel getShopByArticleId(long articleId) {

        return shopService.getShopByArticleId(articleId);
    }

    /**
     * 获取商品通过商品ID
     * 
     * @param shopId
     * @return
     */

    public TaokeModel getShopByShopId(String shopId) {

        return shopService.getShopByShopId(shopId);
    }

}
