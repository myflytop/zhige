package com.oly.web.service.search;

import java.util.List;

import com.github.pagehelper.PageHelper;
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

    public BlogArticle getBlogArticleById(Long articleId) {

        return blogSearchMapper.getBlogArticleByArticleId(articleId);
    }

    public BlogArticle getBlogArticleByUrl(String articleUrl) {

        return blogSearchMapper.getBlogArticleByArticleUrl(articleUrl);
    }

    /**
     * 获取文章列表
     * 
     * @param blogArticleSearchParam
     * @return
     */
    public List<BlogArticle> listBlogArticles(BlogArticleSearchParam blogArticleSearchParam) {
        
        return blogSearchMapper.listBlogArticlesBySearch(blogArticleSearchParam);
    }

    /**
     * 获取文章列表
     * 
     * @param blogArticleSearchParam
     * @return
     */
    public List<BlogArticle> listBlogArticlesByCatId(Long catId) {
        BlogArticleSearchParam blogArticleSearchParam=new BlogArticleSearchParam();
        blogArticleSearchParam.setCatId(catId);
        return blogSearchMapper.listBlogArticlesBySearch(blogArticleSearchParam);
    }

    /**
     * 获取文章列表
     * 
     * @param blogArticleSearchParam
     * @return
     */
    public List<BlogArticle> listBlogArticlesByTagId(Long tagId) {
        BlogArticleSearchParam blogArticleSearchParam=new BlogArticleSearchParam();
        blogArticleSearchParam.setTagId(tagId);
        return this.listBlogArticles(blogArticleSearchParam);
    }

    public List<BlogArticle> listBlogArticlesByType(Byte type, Integer size) {
        BlogArticleSearchParam bb=new BlogArticleSearchParam();
        bb.setArticleType(type);
        PageHelper.startPage(1,size, "create_time asc");
       return blogSearchMapper.listBlogArticlesBySearch(bb);
    }

}
