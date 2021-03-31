package com.oly.web.mapper;

import java.util.List;

import com.oly.web.mould.BlogArticleCountSort;
import com.oly.web.mould.BlogArticleSort;

/**
 * 文章列表排序 失效性 发布时间 阅读量 点赞量 讨论量 推荐级别
 *
 */
public interface BlogArticleSortMapper {
    
    List<BlogArticleSort> listArticleSort(BlogArticleSort blogArticleSort);

    List<BlogArticleCountSort> listArticlesCountSort(BlogArticleSort blogArticleSort);
}
