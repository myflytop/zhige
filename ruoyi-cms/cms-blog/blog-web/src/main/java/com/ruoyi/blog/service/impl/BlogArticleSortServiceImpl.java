package com.ruoyi.blog.service.impl;

import com.ruoyi.blog.mapper.BlogArticleSortMapper;
import com.ruoyi.blog.mould.BlogArticleCountSort;
import com.ruoyi.blog.mould.BlogArticleSort;
import com.ruoyi.blog.service.IBlogArticleSortService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 文章排序相关
 */
@Service
public class BlogArticleSortServiceImpl implements IBlogArticleSortService {

    @Autowired
    private BlogArticleSortMapper blogArticleSortMapper;
    @Override
    public List<BlogArticleSort> listArticleSort(BlogArticleSort blogArticleSort) {
        return blogArticleSortMapper.listArticleSort(blogArticleSort);
    }



    @Override
    public List<BlogArticleCountSort> listArticlesCountSort(BlogArticleSort blogArticleSort) {
        return blogArticleSortMapper.listArticlesCountSort(blogArticleSort);
    }

}
