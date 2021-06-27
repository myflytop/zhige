package com.oly.web.service.impl;

import java.util.List;

import com.oly.web.mapper.TaokeMapper;
import com.oly.web.model.TaokeBlogPost;
import com.oly.web.model.TaokeModel;
import com.oly.web.model.parm.TaokeParm;
import com.oly.web.service.ITaoKeService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TaokeServiceImpl implements ITaoKeService {
    @Autowired
    private TaokeMapper taokeMapper;
 
    @Override
    public TaokeBlogPost selectTaokePostByArticleId(long articleId) {
        return null;
    }


    @Override
    public List<Long> listArticleIdsByTao(TaokeParm taokeParm) {
        return taokeMapper.listArticleIdsByTao(taokeParm);
    }

    @Override
    public List<TaokeModel> listTaoKeByTagId(long tagId) {
       
        return taokeMapper.listTaoKeByTagId(tagId);
    }


    @Override
    public List<TaokeModel> listTaoKeByCatId(long catId) {
       
        return taokeMapper.listTaoKeByCatId(catId);
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
