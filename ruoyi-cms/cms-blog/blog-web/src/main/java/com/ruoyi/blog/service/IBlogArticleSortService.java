package com.ruoyi.blog.service;

import com.ruoyi.blog.mould.BlogArticleCountSort;
import com.ruoyi.blog.mould.BlogArticleSort;

import java.util.List;

public interface IBlogArticleSortService {
    List<BlogArticleSort> listArticleSort(BlogArticleSort blogArticleSort);
    List<BlogArticleCountSort> listArticlesCountSort(BlogArticleSort blogArticleSort);
}
