package com.oly.web.service.cache;

import java.util.List;

import com.oly.common.constant.CacheConstant;
import com.oly.web.model.po.BlogCat;
import com.oly.web.service.search.BlogCategoryServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

@Service
@CacheConfig(cacheNames = "oly-web")
public class BlogCategoryCacheService {
    
    @Autowired
    private BlogCategoryServiceImpl categoryServiceImpl;

    
    @Cacheable(key="'"+CacheConstant.CATS_CACHE_KEY_PREFIX+"getCatId_'+#p0")
    public BlogCat getBlogCatByCatId(long catId) {
        
        return categoryServiceImpl.getBlogCatByCatId(catId);
    }

    @Cacheable(key="'"+CacheConstant.CATS_CACHE_KEY_PREFIX+"listCatId_'+#p0")
    public List<BlogCat> listBlogCats() {
        
        return categoryServiceImpl.listBlogCats(null);
    }

    
    @Cacheable(key="'"+CacheConstant.CATS_CACHE_KEY_PREFIX+"listCatId_'+#p0")
    public List<BlogCat> listBlogCatsById(Long catId) {
        
        return categoryServiceImpl.listBlogCatsById(catId);
    }

    
    @Cacheable(key="'"+CacheConstant.CATS_CACHE_KEY_PREFIX+"listCatType_'+#p0")
    public List<BlogCat> listBlogCatsByType(byte type) {
        
        return categoryServiceImpl.listBlogCatsByType(type);
    }

    
    @Cacheable(key="'"+CacheConstant.CATS_CACHE_KEY_PREFIX+"treeCatId_'+#p0")
    public BlogCat listBlogCatsTreeById(Long catId) {
        
        return categoryServiceImpl.listBlogCatsTreeById(catId);
    }
    
}
