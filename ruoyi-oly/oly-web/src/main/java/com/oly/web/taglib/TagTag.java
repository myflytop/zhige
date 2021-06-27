package com.oly.web.taglib;

import java.util.List;

import com.oly.web.model.po.BlogTag;
import com.oly.web.service.cache.BlogTagCacheService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


/**
 * 如果为列表，默认获取第一页
 */
@Service("tagTag")
public class TagTag {
    @Autowired
    private BlogTagCacheService tagCacheService;

    /****
     * 通过id获取标签信息
     * @param tagId 标签ID
     * @return
     */
    public BlogTag getTagById(long tagId) {
        return tagCacheService.getBlogTagByTagId(tagId);
    }

    /**
     * 
     * @param tagType
     * @return
     */
    public List<BlogTag> listTagByType(Byte tagType) {
        return tagCacheService.listBlogTagsByType(tagType);
    }

    /**获取推荐标签
     * @param visible 状态
     * @param themeName  主题名字
     * @return
     */
    public List<BlogTag> listTagByVisible(Integer visible,String themeName) {
        return tagCacheService.listBlogTagsByVisible(visible,themeName);
    }

    /**
     * @param tagType
     * @param visible
     * @param themeName
     * @return
     */
    public List<BlogTag> listTagByTypeAndVisible(Byte tagType,Integer visible,String themeName) {
        return tagCacheService.listBlogTagsByTypeAndVisible(tagType,visible,themeName);
    }
  
}
