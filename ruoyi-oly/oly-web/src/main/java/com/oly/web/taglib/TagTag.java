package com.oly.web.taglib;

import java.util.List;

import com.oly.web.model.po.BlogArticle;
import com.oly.web.model.po.BlogTag;
import com.oly.web.service.cache.BlogCacheService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


/**
 * 如果为列表，默认获取第一页
 */
@Service("tagTag")
public class TagTag {
    @Autowired
    private BlogCacheService blogService;

    /**
     * 获取第一页指定数量 按照发布时间排序
     * @param pageSize 获取数量
     * @return
     */
    public List<BlogTag> listTagBySiz(Integer pageSize) {      
        return blogService.listBlogTags(pageSize,"create_time desc");
    }

    /****
     * 通过id获取标签信息
     * @param tagId 标签ID
     * @return
     */
    public BlogTag getTagById(long tagId) {
        return blogService.getBlogTagByTagId(tagId);
    }

    /**获取推荐标签
     * @return
     */
    public List<BlogTag> listTagByTui(Integer pageSize) {
        return blogService.listBlogTags(pageSize,"visible,create_time desc"); 
    }

    /**获取推荐标签
     * @return
     */
    public List<BlogTag> listTagByType(Byte tagType,Integer size) {
        return blogService.listBlogTagByType(tagType,size, "visible,create_time desc");
    }

    

    
  /***
   * 
   * @param tagId 标签ID
   * @param pageSize 获取多少条
   * @return
   */
    public List<BlogArticle> listArticleByTagId(Long tagId, int pageSize) {
        
        return blogService.listBlogArticlesByTagId(tagId,pageSize);
    }

    /**
     * 通过标签Id获取文章列表 默认获取10条 按照发布时间倒序
     * 
     * @return
     */
    public List<BlogArticle> listArticleByCategoryId(Long tagId) {
        return this.listArticleByTagId(tagId, 10);
    }

  


    
}
