package com.oly.cms.general.mapper;

import java.util.List;

import com.oly.cms.common.domain.entity.CmsArticleCount;

/**
 * 文章列表排序 失效性 发布时间 阅读量 点赞量 讨论量 推荐级别
 *
 */
public interface GeneralArticleSortMapper {

    List<CmsArticleCount> listArticlesCountSort(String themeName);
}
