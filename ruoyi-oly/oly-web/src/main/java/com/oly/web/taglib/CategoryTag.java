package com.oly.web.taglib;

import java.util.List;

import com.oly.common.model.enums.CommonVisibleEnums;
import com.oly.web.mould.BlogArticle;
import com.oly.web.mould.BlogCat;
import com.oly.web.service.cache.BlogCacheService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 分类标签
 */
@Service("categoryTag")
public class CategoryTag {
    @Autowired
    private BlogCacheService blogService;

    /**
     * 获取分类列表不分页
     * 
     * @return
     */
    public List<BlogCat> listCategory() {
        
        return blogService.listBlogCats(null);
    }

    /**
     * 获取分类列表不分页
     * 获取推荐分类
     * 类别不是很多
     * @return
     */
    public List<BlogCat> listTuiCategory() {
        BlogCat blogCat = new BlogCat();
        blogCat.setVisible((byte)CommonVisibleEnums.TUI.ordinal());
        return blogService.listBlogCats(blogCat);
    }

    /**
     * 通过分类Id获取文章列表 按照发布时间倒序
     * 
     * @return
     */
    public List<BlogArticle> listArticleByCategoryId(Long catId, int pageSize) {

    
        return blogService.listBlogArticlesByCatId(catId,pageSize);
    }

    /**
     * 通过分类Id获取文章列表 默认获取10
     * 按照发布时间倒序
     * 
     * @return
     */
    public List<BlogArticle> listArticleByCategoryId(Long catId) {
        return this.listArticleByCategoryId(catId, 10);
    }
    
    /**
     * 通过分类路径获取分类
     * 不合适
     * @param catUrl
     * @return
     */
    public BlogCat getBlogCatByCatUrl(String catUrl) {
        return blogService.getBlogCatByCatUrl(catUrl);
    }
}
