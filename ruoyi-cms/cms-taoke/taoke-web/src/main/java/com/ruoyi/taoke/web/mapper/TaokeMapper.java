package com.ruoyi.taoke.web.mapper;

import com.ruoyi.blog.mould.BlogCat;
import com.ruoyi.blog.mould.BlogTag;
import com.ruoyi.taoke.web.model.TaokeModel;
import com.ruoyi.taoke.web.model.parm.TaokeParm;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TaokeMapper {
    List<TaokeModel> listTaoke(TaokeModel taokeModel);

    List<BlogCat> listHotCats(String shopIds);
    List<BlogTag> listHotTags(String shopIds);

   /* 通过文章获取热门分类*/
    List<TaokeModel> listTaokeByCat(TaokeParm taokeParm);
    /* 通过文章获取热门标签*/
    List<TaokeModel> listTaokeByTag(TaokeParm taokeParm);

    /*获取宝贝排行
    * 点赞
    * 收藏
    * 分享
    * */
    List<TaokeModel> listTaokeByCount(TaokeParm taokeParm);


    TaokeModel selectTaokeByArticleId(long articleId);

    TaokeModel selectTaokeByShopId(String shopId);

    List<Long> listArticleIdsByTao(TaokeParm taokeParm);

    List<TaokeModel> listTaoKeByArticle(@Param("articleIds") List<Long>  articleIds, @Param("taokeParm") TaokeParm taokeParm);
}
