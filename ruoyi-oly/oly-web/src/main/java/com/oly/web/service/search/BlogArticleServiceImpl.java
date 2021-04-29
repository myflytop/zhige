package com.oly.web.service.search;


import java.util.List;

import com.oly.web.mapper.BlogSearchMapper;
import com.oly.web.model.pam.BlogArticleSearchParam;
import com.oly.web.model.po.BlogArticle;
import com.oly.web.service.IBlogSearchService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BlogArticleServiceImpl implements IBlogSearchService {
    @Autowired
    private BlogSearchMapper blogSearchMapper; 

    public BlogArticle getBlogArticleById(Long articleId){

        return blogSearchMapper.getBlogArticleByArticleId(articleId);
    }

    public BlogArticle getBlogArticleByUrl(String articleUrl){

        return blogSearchMapper.getBlogArticleByArticleUrl(articleUrl);
    }
    
    /**
     * 获取文章列表
     * 
     * @param blogArticleSearchParam
     * @return
     */
    List<BlogArticle> listBlogArticles(BlogArticleSearchParam blogArticleSearchParam){
    return null;
    }

    /**
     * 获取文章列表
     * 
     * @param blogArticleSearchParam
     * @return
     */
    List<BlogArticle> listBlogArticlesByCatId(BlogArticleSearchParam blogArticleSearchParam){
        return null;
    }

    /**
     * 获取文章列表
     * 
     * @param blogArticleSearchParam
     * @return
     */
    List<BlogArticle> listBlogArticlesByTagId(BlogArticleSearchParam blogArticleSearchParam){
        return null;
    }


}
