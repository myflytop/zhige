package com.oly.web.service;

import java.util.List;

import com.oly.web.model.po.BlogArticleCountSort;

public interface IBlogArticleSortService {
    List<BlogArticleCountSort> listArticlesCountSort(Integer size,String order,String themeName);
    List<BlogArticleCountSort> listArticlesCountSort(String supportType);
}
