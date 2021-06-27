package com.oly.web.service.impl;


import com.github.pagehelper.PageHelper;
import com.oly.web.mapper.BlogArticleSortMapper;
import com.oly.web.model.po.BlogArticleCountSort;
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
    public List<BlogArticleCountSort> listArticlesCountSort(String supportType) {  
        return blogArticleSortMapper.listArticlesCountSort(supportType);
    }

    @Override
    public List<BlogArticleCountSort> listArticlesCountSort(Integer size, String order, String supportType) {
        PageHelper.startPage(1, size, order);
        return this.listArticlesCountSort(supportType);
    }



}
