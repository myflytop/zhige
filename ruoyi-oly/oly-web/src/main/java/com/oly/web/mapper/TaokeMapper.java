package com.oly.web.mapper;

import java.util.List;

import com.oly.web.model.TaokeModel;
import com.oly.web.model.parm.TaokeParm;

public interface TaokeMapper {

    List<TaokeModel> listTaoKeByTagId(long tagId);

    List<TaokeModel> listTaoKeByCatId(long catId);

    TaokeModel selectTaokeByArticleId(long articleId);

    TaokeModel selectTaokeByShopId(String shopId);

    List<Long> listArticleIdsByTao(TaokeParm taokeParm);

    List<TaokeModel> listTaokeByTaoKe(TaokeParm taokeParm);
}
