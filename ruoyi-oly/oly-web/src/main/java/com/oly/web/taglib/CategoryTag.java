package com.oly.web.taglib;

import java.util.List;

import com.oly.common.model.enums.CommonVisibleEnums;
import com.oly.web.model.po.BlogArticle;
import com.oly.web.model.po.BlogCat;
import com.oly.web.service.cache.BlogCacheService;
import com.oly.web.service.search.BlogCategoryServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 分类标签
 */
@Service("categoryTag")
public class CategoryTag {
    @Autowired
    private BlogCacheService blogService;

    @Autowired
    private BlogCategoryServiceImpl blogCategoryServiceImpl;

    /**
     * 分类树
     * @param catId
     * @return
     */
    public BlogCat  getCatTreeById(Long catId){

        return blogCategoryServiceImpl.listBlogCatsTreeById(catId);
    }


    /**
     * 获取分类列表不分页
     * 
     * @return
     */
    public List<BlogCat> listCategory() {
        
        return blogService.listBlogCats(null);
    }
    /**
     * 
     * @param b
     * @param catId
     * @return
     */
    public List<BlogCat> listCategory(Byte b,Long catId) {
        
      return  blogService.listBlogCats(b,catId);
    }

    

    /**
     * 获取分类列表不分页
     * 获取推荐分类
     * 类别不是很多
     * @return
     */
    public List<BlogCat> listTuiCategory() {
      
        return blogService.listBlogCats((byte)CommonVisibleEnums.TUI.ordinal());
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
