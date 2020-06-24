package com.ruoyi.blog.service.impl;

import com.ruoyi.blog.mapper.BlogArticleSortMapper;
import com.ruoyi.blog.mould.BlogArticleCountSort;
import com.ruoyi.blog.mould.BlogArticleSort;
import com.ruoyi.blog.service.IBlogArticleSortService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BlogArticleSortServiceImpl implements IBlogArticleSortService {

    @Autowired
    private BlogArticleSortMapper blogArticleSortMapper;
    @Override
    public List<BlogArticleSort> listArticlesByTime(BlogArticleSort blogArticleSort) {
        return blogArticleSortMapper.listArticlesByTime(blogArticleSort);
    }

    @Override
    public List<BlogArticleSort> listArticlesByTop(BlogArticleSort blogArticleSort) {
        return blogArticleSortMapper.listArticlesByTop(blogArticleSort);
    }

    @Override
    public List<BlogArticleCountSort> listArticlesCountSort() {
        return blogArticleSortMapper.listArticlesCountSort();
    }

}
