package com.oly.web.service;

import com.oly.web.mould.BlogArticleCountSort;
import com.oly.web.mould.BlogArticleSort;

import java.util.List;

public interface IBlogArticleSortService {
    List<BlogArticleSort> listArticleSort(BlogArticleSort blogArticleSort);

    List<BlogArticleCountSort> listArticlesCountSort(BlogArticleSort blogArticleSort);
}
