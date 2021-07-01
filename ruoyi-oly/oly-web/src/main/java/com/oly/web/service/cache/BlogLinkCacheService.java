/*
 * @Author: your name
 * @Date: 2021-06-27 23:18:59
 * @LastEditTime: 2021-06-29 12:30:14
 * @LastEditors: your name
 * @Description: In User Settings Edit
 * @FilePath: \zhige\ruoyi-oly\oly-web\src\main\java\com\oly\web\service\cache\BlogLinkCacheService.java
 */
package com.oly.web.service.cache;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.oly.common.constant.CacheConstant;
import com.oly.web.model.po.BlogLink;
import com.oly.web.service.search.BlogLinkServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

@Service
@CacheConfig(cacheNames = "oly-web")
public class BlogLinkCacheService {

    @Autowired
    private BlogLinkServiceImpl linkServiceImpl;

    @Cacheable(key = "'" + CacheConstant.LINKS_CACHE_KEY_PREFIX + "getLinkId_'+#p0")
    public BlogLink getBlogLinkById(Long linkId) {

        return linkServiceImpl.getBlogLinkById(linkId);
    }

    @Cacheable(key = "'" + CacheConstant.LINKS_CACHE_KEY_PREFIX + "listLinkGroupKey_'+#p0")
    public List<BlogLink> listBlogLinksByKey(String groupKey) {
        return linkServiceImpl.listBlogLinksByKey(groupKey);
    }

    @Cacheable(key = "'" + CacheConstant.LINKS_CACHE_KEY_PREFIX + "mapLinkGroupKey_'+#p0")
    public Map<String, List<BlogLink>> listBlogLinksGroupByKey(String groupKey) {
        Map<String, List<BlogLink>> linkMap = linkServiceImpl.listBlogLinksByKey(groupKey).stream()
                .collect(Collectors.groupingBy(BlogLink::getGroupKey));
        return linkMap;
    }

    public List<BlogLink> listBlogLinks(BlogLink blogLink) {
        return linkServiceImpl.listBlogLinks(blogLink);
    }

    public List<BlogLink> listBlogLinksByVisible(int visible) {
        BlogLink blogLink = new BlogLink();
        blogLink.setVisible(visible);
        return linkServiceImpl.listBlogLinks(blogLink);

    }

}
