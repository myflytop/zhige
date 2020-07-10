package com.ruoyi.taoke.web.taglib;

import com.github.pagehelper.PageHelper;
import com.ruoyi.blog.service.impl.BlogServiceImpl;
import com.ruoyi.cache.redis.constant.CacheConstant;
import com.ruoyi.taoke.web.model.TaokeModel;
import com.ruoyi.taoke.web.model.parm.TaokeParm;
import com.ruoyi.taoke.web.service.impl.TaokeServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service("taoKeTag")
public class TaoKeTag {
    @Autowired
    private BlogServiceImpl blogService;
    @Autowired
    private TaokeServiceImpl taoKeService;

    private  List<TaokeModel> taoKeSort(int pageSize,String orderString){
        PageHelper.startPage(1,pageSize,orderString);
        return  taoKeService.listTaoke(null);
    }

    /**
     * 新上架
     * @param pageSize
     * @return
     */
    @Cacheable(CacheConstant.TAKE_CACHE_NAME)
    public List<TaokeModel> taoKeSortByCreateTime(int pageSize){
        return this.taoKeSort(pageSize,"create_time  desc");
    }

    @Cacheable(CacheConstant.TAKE_CACHE_NAME)
    public List<TaokeModel> taoKeSortByCreateTime(){
        return this.taoKeSortByCreateTime(10);
    }

    /**
     * 热卖排序
     * @param pageSize
     * @return
     */
    @Cacheable(CacheConstant.TAKE_CACHE_NAME)
    public List<TaokeModel> taoKeSortByShopSales(int pageSize){
        return this.taoKeSort(pageSize,"shop_sales  desc");
    }

    @Cacheable(CacheConstant.TAKE_CACHE_NAME)
    public List<TaokeModel> taoKeSortByShopSales(){
        return this.taoKeSortByShopSales(10);
    }

    /**
     * 优惠卷价值
     * @param pageSize
     * @return
     */
    @Cacheable(CacheConstant.TAKE_CACHE_NAME)
    public List<TaokeModel> taoKeSortByCouponPrice(int pageSize){
        return this.taoKeSort(pageSize,"coupon_price  desc");
    }
    @Cacheable(CacheConstant.TAKE_CACHE_NAME)
    public List<TaokeModel> taoKeSortByCouponPrice(){
        return this.taoKeSortByCouponPrice(10);
    }

    /**
     * 优惠幅度
     * @param pageSize
     * @return
     */
    @Cacheable(CacheConstant.TAKE_CACHE_NAME)
    public List<TaokeModel> taoKeSortByShopPrice(int pageSize){
        return this.taoKeSort(pageSize,"shop_price  desc");
    }
    @Cacheable(CacheConstant.TAKE_CACHE_NAME)
    public List<TaokeModel> taoKeSortByShopPrice(){
        return this.taoKeSortByCouponPrice(10);
    }

    /**
     *通过标签获取淘客
     * @return
     */
    @Cacheable(CacheConstant.TAKE_CACHE_NAME)
    public List<TaokeModel> taoKeByTagId(long tagId,int pageSize){
        TaokeParm taokeParm=new TaokeParm();
        taokeParm.setTagId(tagId);
        PageHelper.startPage(1,pageSize);
        List<Long> pcs=blogService.listArticleIdsByTagId(tagId);
        if (pcs!=null&&pcs.size()>0)
        {
            return taoKeService.listTaoKeByArticle(pcs,taokeParm);
        }
      return null;
    }
    /**
     *通过标签获取淘客
     * @return
     */
    @Cacheable(CacheConstant.TAKE_CACHE_NAME)
    public List<TaokeModel> taoKeByTagId(long tagId){
        return this.taoKeByTagId(tagId,10);
    }


    /**
     *通过类别取淘客
     * @return
     */
    @Cacheable(CacheConstant.TAKE_CACHE_NAME)
    public List<TaokeModel> taoKeByCatId(long catId,int pageSize){
        TaokeParm taokeParm=new TaokeParm();
        taokeParm.setCatId(catId);
        PageHelper.startPage(1,pageSize);
        List<Long> pcs=blogService.listArticleIdsByCatId(catId);
        if (pcs!=null&&pcs.size()>0)
        {
            return taoKeService.listTaoKeByArticle(pcs,taokeParm);
        }
        return null;
    }
    @Cacheable(CacheConstant.TAKE_CACHE_NAME)
    public List<TaokeModel> taoKeByCatId(long catId){

        return this.taoKeByCatId(catId,10);
    }
    @Cacheable(CacheConstant.TAKE_CACHE_NAME)
    public List<TaokeModel> taoKeTui(int pageSize){
        return this.taoKeSort(pageSize,"create_time desc");
    }
    public List<List<TaokeModel>> taoKeTuiGroup(int pageSize){
        List<TaokeModel> tuiLis=this.taoKeTui(pageSize);
        List<List<TaokeModel>> populars=new ArrayList<>();
        //整除
        if(tuiLis.size()%5==0) {
            for (int i = 1; tuiLis.size() / 5 > i-1; i++) {
                populars.add(tuiLis.subList((i-1)*5, i * 5));
            }
        }
        //不整数
        else {
            for (int i = 1; (tuiLis.size() / 5+1) > i-1; i++) {
                if((tuiLis.size()-5*i)>0)
                {
                    populars.add(tuiLis.subList((i-1)*5, i * 5));
                }
                else {
                    populars.add(tuiLis.subList((i-1)*5,tuiLis.size()));
                }

            }
        }
        return populars;
    }
}
