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

    @Cacheable(key="'"+CacheConstant.CATS_CACHE_KEY_PREFIX+"listCatId_'+#p0+'themeName_'+#p2")
    public List<BlogCat> listBlogCatsById(Long catId,String themeName) {
        
        return categoryServiceImpl.listBlogCatsById(catId,themeName);
    }
      
    @Cacheable(key="'"+CacheConstant.CATS_CACHE_KEY_PREFIX+"listCatType_'+#p0+'_'+#p1")
    public List<BlogCat> listBlogCatsByType(Byte catType,Long catId) {
        return categoryServiceImpl.listBlogCatsByType(catType,catId);
    }

    @Cacheable(key="'"+CacheConstant.CATS_CACHE_KEY_PREFIX+"listCatVisible_'+#p0+'_'+#p1+'themeName_'+#p2")
    public List<BlogCat> listBlogCatsByVisible(Integer visible,Long catId,String themeName) {
        return categoryServiceImpl.listBlogCatsByVisible(visible,catId,themeName);
    }

    @Cacheable(key="'"+CacheConstant.CATS_CACHE_KEY_PREFIX+"treeCatId_'+#p0+'themeName_'+#p2")
    public BlogCat listBlogCatsTreeById(Long catId,String themeName) {
        
        return categoryServiceImpl.listBlogCatsTreeById(catId,themeName);
    }
    
    public List<BlogCat> listBlogCats(BlogCat blogCat) {

        return categoryServiceImpl.listBlogCats(blogCat);
    }

    public BlogCat listBlogCatsTree(BlogCat blogCat) {
        if (blogCat != null && blogCat.getCatId() != null) {
            blogCat.setCatId(0L);
        }
        return categoryServiceImpl.listBlogCatsTree(blogCat);
    }
}
