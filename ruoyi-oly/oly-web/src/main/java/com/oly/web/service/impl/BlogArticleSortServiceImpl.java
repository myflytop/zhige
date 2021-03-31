package com.oly.web.service.impl;


import com.oly.web.mapper.BlogArticleSortMapper;
import com.oly.web.mould.BlogArticleCountSort;
import com.oly.web.mould.BlogArticleSort;
import com.oly.web.service.IBlogArticleSortService;
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
