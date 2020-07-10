package com.ruoyi.taoke.web.service.impl;

import com.ruoyi.blog.mould.BlogArticle;
import com.ruoyi.blog.service.impl.BlogServiceImpl;
import com.ruoyi.taoke.web.mapper.TaokeMapper;
import com.ruoyi.taoke.web.model.TaokeBlogPost;
import com.ruoyi.taoke.web.model.TaokeModel;
import com.ruoyi.taoke.web.model.parm.TaokeParm;
import com.ruoyi.taoke.web.service.ITaoKeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class TaokeServiceImpl implements ITaoKeService {
    @Autowired
    private TaokeMapper taokeMapper;
    @Autowired
    private BlogServiceImpl blogService;
    @Override
    public List<TaokeBlogPost> listTaokePost(TaokeParm taokeParm) {

        List<BlogArticle> listPost=blogService.listBlogArticles(null);
        List<TaokeBlogPost> taokeBlogPosts=new ArrayList<>();
        for (BlogArticle s : listPost) {
          TaokeBlogPost taokeBlogPost=new TaokeBlogPost();
          taokeBlogPost.setBlogArticle(s);
          taokeBlogPost.setTaokeModel(taokeMapper.selectTaokeByArticleId(s.getArticleId()));
          taokeBlogPosts.add(taokeBlogPost);
           }
        return taokeBlogPosts;
    }

    @Override
    public List<TaokeModel> listTaoke(TaokeParm taokeParm) {
        return taokeMapper.listTaoke(null);
    }

    @Override
    public TaokeBlogPost getTaoke(String shopId) {
        return null;
    }

    @Override
    public TaokeBlogPost getTaokePost(long articleId) {
        return null;
    }


    @Override
    public List<Long> listArticleIdsByTao(TaokeParm taokeParm) {
        return taokeMapper.listArticleIdsByTao(taokeParm);
    }

    @Override
    public List<TaokeModel> listTaoKeByArticle(List<Long>  articles, TaokeParm taokeParm) {
        return taokeMapper.listTaoKeByArticle(articles,taokeParm);
    }


}
