package com.oly.web.service.cache;

import java.util.List;

import com.oly.common.constant.CacheConstant;
import com.oly.web.model.po.BlogTag;
import com.oly.web.service.search.BlogTagServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

@Service
public class BlogTagCacheService {
    @Autowired
    private BlogTagServiceImpl tagServiceImpl;

    @Cacheable(value = CacheConstant.SHOP_CACHE_KEY_PREFIX, key = "methodName+ '_'+#p0")
    public BlogTag getBlogTagByTagId(long tagId) {
        return tagServiceImpl.getBlogTagByTagId(tagId);
    }

    @Cacheable(value = CacheConstant.SHOP_CACHE_KEY_PREFIX, key = "methodName+ '_'+#p0+'_'+#p1+'_'+#p2")
    public List<BlogTag> listBlogTagsByTypeAndVisible(Byte tagType, Integer visible, String themeName) {
        return tagServiceImpl.getBlogTagByVisibleAndType(tagType, visible, themeName);
    }

    @Cacheable(value = CacheConstant.SHOP_CACHE_KEY_PREFIX, key = "methodName+ '_'+#p0")
    public List<BlogTag> listBlogTagsByType(Byte tagType) {
        return tagServiceImpl.getBlogTagByVisibleAndType(tagType, null, "");
    }

    @Cacheable(value = CacheConstant.SHOP_CACHE_KEY_PREFIX, key = "methodName+ '_'+#p0+'_'+#p1")
    public List<BlogTag> listBlogTagsByVisible(Integer visible, String themeName) {
        return tagServiceImpl.getBlogTagByVisibleAndType(null, visible, themeName);
    }

    public List<BlogTag> listBlogTags(BlogTag blogTag) {

        return tagServiceImpl.listBlogTags(blogTag);
    }
}
