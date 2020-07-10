package com.ruoyi.blog.taglib;

import com.ruoyi.blog.mould.BlogArticleCountSort;
import com.ruoyi.blog.mould.BlogArticleSort;
import com.ruoyi.blog.service.impl.BlogArticleSortServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 获取文章基本信息
 * 排序
 */
@Service("articleSortTag")
public class ArticleSortTag {
    @Autowired
    private BlogArticleSortServiceImpl articleSortService;


    private List<BlogArticleSort> sort(BlogArticleSort blogArticleSort){
        return null;
    }

    private List<BlogArticleCountSort> sortCount(BlogArticleSort blogArticleSort){
        return null;
    }

    public List<BlogArticleSort> sortByTime(){
        return null;
    }

    public List<BlogArticleSort> sortByTop(){
        return null;
    }
}
