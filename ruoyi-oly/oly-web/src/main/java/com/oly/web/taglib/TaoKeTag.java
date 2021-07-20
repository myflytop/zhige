package com.oly.web.taglib;

import java.util.ArrayList;
import java.util.List;

import com.github.pagehelper.PageHelper;

import com.oly.web.model.TaokeModel;
import com.oly.web.service.impl.TaokeServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

@Service("taoKeTag")
public class TaoKeTag {
    @Autowired
    private TaokeServiceImpl taoKeService;

    private List<TaokeModel> taoKeSort(int pageSize, String orderString) {
        PageHelper.startPage(1, pageSize, orderString);
        return taoKeService.listTaokeByTaoKe(null);
    }

    /**
     * 新上架
     * 
     * @param pageSize
     * @return
     */

    public List<TaokeModel> taoKeSortByCreateTime(int pageSize) {
        return this.taoKeSort(pageSize, "create_time  desc");
    }

    /**
     * 热卖排序
     * 
     * @param pageSize
     * @return
     */

    public List<TaokeModel> taoKeSortByShopSales(int pageSize) {
        return this.taoKeSort(pageSize, "shop_sales,create_time  desc");
    }

    /**
     * 优惠卷价值
     * 
     * @param pageSize
     * @return
     */

    public List<TaokeModel> taoKeSortByCouponPrice(int pageSize) {
        return this.taoKeSort(pageSize, "coupon_price,create_time desc");
    }

    /**
     * 优惠幅度
     * 
     * @param pageSize
     * @return
     */

    public List<TaokeModel> taoKeSortByShopPrice(int pageSize) {
        return this.taoKeSort(pageSize, "shop_price,create_time desc");
    }

    /**
     * 通过标签获取淘客
     * 
     * @return
     */

    public List<TaokeModel> taoKeByTagId(long tagId, int pageSize) {

        return taoKeService.listTaoKeByCatId(tagId, 1, pageSize);
    }

    /**
     * 通过类别取淘客
     * 
     * @return
     */

    public List<TaokeModel> taoKeByCatId(long catId, int pageSize) {

        return taoKeService.listTaoKeByCatId(catId, 1, pageSize);
    }

    public List<TaokeModel> taoKeTui(int pageSize) {
        return this.taoKeSort(pageSize, "create_time desc");
    }

    public List<List<TaokeModel>> taoKeTuiGroup(int pageSize) {
        List<TaokeModel> tuiLis = this.taoKeTui(pageSize);
        List<List<TaokeModel>> populars = new ArrayList<>();
        // 整除
        if (tuiLis.size() % 5 == 0) {
            for (int i = 1; tuiLis.size() / 5 > i - 1; i++) {
                populars.add(tuiLis.subList((i - 1) * 5, i * 5));
            }
        }
        // 不整数
        else {
            for (int i = 1; (tuiLis.size() / 5 + 1) > i - 1; i++) {
                if ((tuiLis.size() - 5 * i) > 0) {
                    populars.add(tuiLis.subList((i - 1) * 5, i * 5));
                } else {
                    populars.add(tuiLis.subList((i - 1) * 5, tuiLis.size()));
                }

            }
        }
        return populars;
    }
}
