package com.oly.web.service;

import java.util.List;

import com.oly.web.model.po.BlogArticleCountSort;
import com.oly.web.model.po.BlogArticleSort;

public interface IBlogArticleSortService {
    List<BlogArticleSort> listArticleSort(BlogArticleSort blogArticleSort);

    List<BlogArticleCountSort> listArticlesCountSort(BlogArticleSort blogArticleSort);
}
