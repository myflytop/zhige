package com.ruoyi.taoke.web.service;
import com.ruoyi.taoke.web.model.TaokeBlogPost;
import com.ruoyi.taoke.web.model.TaokeModel;
import com.ruoyi.taoke.web.model.parm.TaokeParm;

import java.util.List;

public interface ITaoKeService {
    List<TaokeBlogPost> listTaokePost(TaokeParm taokeParm);
    List<TaokeModel> listTaoke(TaokeParm taokeParm);
    TaokeBlogPost getTaoke(String shopId);
    TaokeBlogPost getTaokePost(long articleId);

    List<Long> listArticleIdsByTao(TaokeParm taokeParm);

    /**
     * 通过文章列表获取tao
     *
     * @return
     */
    List<TaokeModel> listTaoKeByArticle(List<Long> articles, TaokeParm taokeParm);
}
