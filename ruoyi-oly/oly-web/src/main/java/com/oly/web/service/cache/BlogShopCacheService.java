package com.oly.web.service.cache;

import java.util.List;

import com.oly.common.constant.CacheConstant;
import com.oly.web.model.TaokeBlogPost;
import com.oly.web.model.TaokeModel;
import com.oly.web.model.parm.TaokeParm;
import com.oly.web.service.impl.TaokeServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

@Service
public class BlogShopCacheService {

    @Autowired
    private TaokeServiceImpl shopService;

    /**
     * 获取文章商品通过文章ID
     * 
     * @param articleId
     * @return
     */
    @Cacheable(value = CacheConstant.SHOP_CACHE_KEY_PREFIX, key = "methodName+ '_'+#p0")
    public TaokeBlogPost getShopPostByArticleId(long articleId) {
        return shopService.selectTaokePostByArticleId(articleId);
    }

    /**
     * 获取商品列表通过标签ID
     * 
     * @param tagId
     * @return
     */
    @Cacheable(value = CacheConstant.SHOP_CACHE_KEY_PREFIX, key = "methodName+ '_'+#p0+'_'+#p1+'_'+#p2")
    public List<TaokeModel> listTaoKeByTagId(Long tagId, Integer pageNum, Integer pageSize) {

        return shopService.listTaoKeByTagId(tagId, pageNum, pageSize);
    }

    /**
     * 获取商品列表通过分类ID
     * 
     * @param catId
     * @return
     */
    @Cacheable(value = CacheConstant.SHOP_CACHE_KEY_PREFIX, key = "methodName+ '_'+#p0+'_'+#p1+'_'+#p2")
    public List<TaokeModel> listTaoKeByCatId(Long catId, Integer pageNum, Integer pageSize) {

        return shopService.listTaoKeByCatId(catId, pageNum, pageSize);
    }

    /**
     * 获取商品通过文章ID
     * 
     * @param articleId
     * @return
     */
    @Cacheable(value = CacheConstant.SHOP_CACHE_KEY_PREFIX, key = "methodName+ '_'+#p0")
    public TaokeModel getShopByArticleId(long articleId) {

        return shopService.selectTaokeByArticleId(articleId);
    }

    /**
     * 获取商品通过商品ID
     * 
     * @param shopId
     * @return
     */
    @Cacheable(value = CacheConstant.SHOP_CACHE_KEY_PREFIX, key = "methodName+ '_'+#p0")
    public TaokeModel getShopByShopId(String shopId) {

        return shopService.selectTaokeByShopId(shopId);
    }

    public List<TaokeModel> listShopByTaoKe(TaokeParm taokeParm) {

        return shopService.listTaokeByTaoKe(taokeParm);
    }

    /**
     * 通过商品获取文章ID列表
     * 
     * @param taokeParm
     * @return
     */
    public List<Long> listArticleIdsByTao(TaokeParm taokeParm) {
        return shopService.listArticleIdsByTao(taokeParm);
    }

}
