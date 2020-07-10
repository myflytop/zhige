package com.ruoyi.blog.mapper;

import com.ruoyi.blog.mould.BlogArticleCount;
import com.ruoyi.blog.mould.BlogArticleCountSort;
import com.ruoyi.blog.mould.BlogArticleSort;

import java.util.List;

/**
 * 文章列表排序
 * 失效性
 * 发布时间
 * 阅读量
 * 点赞量
 * 讨论量
 * 推荐级别
 *
 */
public interface BlogArticleSortMapper {
    List<BlogArticleSort> listArticleSort(BlogArticleSort blogArticleSort);
    List<BlogArticleCountSort> listArticlesCountSort(BlogArticleSort blogArticleSort);
}
