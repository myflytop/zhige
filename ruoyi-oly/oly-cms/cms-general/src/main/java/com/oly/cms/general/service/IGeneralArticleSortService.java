package com.oly.cms.general.service;

import java.util.List;

import com.oly.cms.common.domain.entity.CmsArticleCount;

public interface IGeneralArticleSortService {

    /**
     * 获取文章相关记录
     * 
     * @param num
     * @param size
     * @param order     排序
     * @param themeName
     * @return
     */
    List<CmsArticleCount> listArticlesCountSort(int num, int size, String order, String themeName);

    /**
     * 获取文章相关记录
     * 
     * @param themeName
     * @return
     */
    List<CmsArticleCount> listArticlesCountSort(String themeName);
}
