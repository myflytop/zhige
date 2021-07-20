package com.oly.web.service.impl;

import java.util.List;

import com.github.pagehelper.PageHelper;
import com.oly.web.mapper.TaokeMapper;
import com.oly.web.model.TaokeBlogPost;
import com.oly.web.model.TaokeModel;
import com.oly.web.model.parm.TaokeParm;
import com.oly.web.service.ITaoKeService;
import com.oly.web.service.cache.BlogArticleCacheService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TaokeServiceImpl implements ITaoKeService {
    @Autowired
    private TaokeMapper taokeMapper;

    @Autowired
    private BlogArticleCacheService postService;

    @Override
    public TaokeBlogPost selectTaokePostByArticleId(long articleId) {
        TaokeBlogPost shopPost = new TaokeBlogPost();
        shopPost.setArticleId(articleId);
        shopPost.setBlogArticle(postService.getBlogArticleHtmlById(articleId));
        shopPost.setTaokeModel(taokeMapper.selectTaokeByArticleId(articleId));
        return shopPost;
    }

    @Override
    public List<Long> listArticleIdsByTao(TaokeParm taokeParm) {
        return taokeMapper.listArticleIdsByTao(taokeParm);
    }

    @Override
    public List<TaokeModel> listTaoKeByTagId(Long tagId, Integer pageNum, Integer pageSize) {
        TaokeParm taokeParm = new TaokeParm();
        taokeParm.setTagId(tagId);
        PageHelper.startPage(pageNum, pageSize);
        return this.listTaokeByTaoKe(taokeParm);
    }

    @Override
    public List<TaokeModel> listTaoKeByCatId(Long catId, Integer pageNum, Integer pageSize) {
        TaokeParm taokeParm = new TaokeParm();
        taokeParm.setCatId(catId);
        PageHelper.startPage(pageNum, pageSize);
        return this.listTaokeByTaoKe(taokeParm);
    }

    @Override
    public TaokeModel selectTaokeByArticleId(long articleId) {

        return taokeMapper.selectTaokeByArticleId(articleId);
    }

    @Override
    public TaokeModel selectTaokeByShopId(String shopId) {

        return taokeMapper.selectTaokeByShopId(shopId);
    }

    @Override
    public List<TaokeModel> listTaokeByTaoKe(TaokeParm taokeParm) {
        return taokeMapper.listTaokeByTaoKe(taokeParm);
    }

}
