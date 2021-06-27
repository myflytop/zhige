package com.oly.web.service.cache;

import java.util.List;

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

    @Cacheable(key="'"+CacheConstant.TAGS_CACHE_KEY_PREFIX+"listTagType_'+#p0+'visible_'+#p1+'themeName_'+#p2")
    public List<BlogTag> listBlogTagsByTypeAndVisible(Byte tagType,Integer visible,String themeName) {
        return tagServiceImpl.getBlogTagByVisibleAndType(tagType, visible,themeName);
    }

    @Cacheable(key="'"+CacheConstant.TAGS_CACHE_KEY_PREFIX+"listTagType_'+#p0")
    public List<BlogTag> listBlogTagsByType(Byte tagType) {
        return tagServiceImpl.getBlogTagByVisibleAndType(tagType, null,"");
    }

    @Cacheable(key="'"+CacheConstant.TAGS_CACHE_KEY_PREFIX+"listTagVisible_'+#p0+'themeName_'+#p1")
    public List<BlogTag> listBlogTagsByVisible(Integer visible,String themeName) {
        return tagServiceImpl.getBlogTagByVisibleAndType(null, visible,themeName);
    }

    public List<BlogTag> listBlogTags(BlogTag blogTag) {
   
        return tagServiceImpl.listBlogTags(blogTag);
    }  
}
