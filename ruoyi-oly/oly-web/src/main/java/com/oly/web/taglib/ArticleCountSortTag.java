package com.oly.web.taglib;

import java.util.List;

import com.oly.web.mould.BlogArticleCountSort;
import com.oly.web.mould.BlogArticleSort;
import com.oly.web.service.cache.BlogCacheService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 获取文章基本信息 排序
 */
@Service("articleCountSortTag")
public class ArticleCountSortTag {
    
    @Autowired
    private BlogCacheService blogCacheService;

  
    public List<BlogArticleCountSort> listBlogArticleCount(int pageSize) {
    
        return blogCacheService.listBlogArticleCount(pageSize);
    }

 
    public List<BlogArticleCountSort> listBlogArticleCountOrderByLook(int pageSize) {

        return blogCacheService.listBlogArticleCountOrderByLook(pageSize);
    }

   
    public List<BlogArticleCountSort> listBlogArticleCountOrderByLike(int pageSize) {

        return blogCacheService.listBlogArticleCountOrderByLike(pageSize);
    }

 
     public List<BlogArticleCountSort> listBlogArticleCountOrderByScore(int pageSize) {
  
        return blogCacheService.listBlogArticleCountOrderByScore(pageSize);
    }


    public List<BlogArticleCountSort> listBlogArticleCountOrderByCollect(int pageSize) {
    
        return blogCacheService.listBlogArticleCountOrderByCollect(pageSize);
    }

  
    public List<BlogArticleCountSort> listBlogArticleCountOrderByShare(int pageSize) {
   
        return blogCacheService.listBlogArticleCountOrderByShare(pageSize);
    }

  
    public List<BlogArticleCountSort> listBlogArticleCountByTop(int pageSize, byte articleTop) {
      
     
        return blogCacheService.listBlogArticleCountByTop(pageSize, articleTop);
    }


    public List<BlogArticleCountSort> listBlogArticleCountByType(int pageSize, byte articleType) {
      
        return blogCacheService.listBlogArticleCountByType(pageSize, articleType);

    }

   
    public List<BlogArticleSort> listBlogArticleSort(int pageSize) {
      
        return blogCacheService.listBlogArticleSort(pageSize);
    }

  
    public List<BlogArticleSort> listBlogArticleSortByTop(int pageSize, byte articleTop) {
       
        return blogCacheService.listBlogArticleSortByTop(pageSize, articleTop);
    }

   
    public List<BlogArticleSort> listBlogArticleSortByType(int pageSize, byte articleType) {
      
        return blogCacheService.listBlogArticleSortByType(pageSize, articleType);
    }


}
