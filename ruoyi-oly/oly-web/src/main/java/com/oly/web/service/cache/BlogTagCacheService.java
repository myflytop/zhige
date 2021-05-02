package com.oly.web.service.cache;

import java.util.List;

import com.github.pagehelper.PageHelper;
import com.oly.common.constant.CacheConstant;
import com.oly.web.model.po.BlogTag;
import com.oly.web.service.search.BlogTagServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
@Service
@CacheConfig(cacheNames = "oly-web")
public class BlogTagCacheService {
    
    @Autowired
    private BlogTagServiceImpl tagServiceImpl;

    
    @Cacheable(key="'"+CacheConstant.TAGS_CACHE_KEY_PREFIX+"getTagId_'+#p0")
    public BlogTag getBlogTagByTagId(long tagId) {
        
        return tagServiceImpl.getBlogTagByTagId(tagId);
    }


    @Cacheable(key="'"+CacheConstant.TAGS_CACHE_KEY_PREFIX+"listTagType_'+#p0+'_'+#p1+'_'+#p3")
    public List<BlogTag> listBlogTagsByType(Byte type,int pageSize, String ordeString) {
        PageHelper.startPage(1, pageSize, ordeString);
        return tagServiceImpl.listBlogTagsByType(type);
    }

    @Cacheable(key="'"+CacheConstant.TAGS_CACHE_KEY_PREFIX+"listTag_'+#p0+'_'+#p1")
    public List<BlogTag> listBlogTags(int pageSize, String ordeString) {
        PageHelper.startPage(1, pageSize, ordeString);
        return tagServiceImpl.listBlogTags(null);
    }

    
    
}
