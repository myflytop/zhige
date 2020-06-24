package com.ruoyi.taoke.web.contoller;

import com.github.pagehelper.PageHelper;
import com.ruoyi.blog.mould.BlogArticle;
import com.ruoyi.blog.mould.pam.BlogArticleSearchParam;
import com.ruoyi.blog.service.impl.BlogServiceImpl;
import com.ruoyi.cms.common.mould.support.PageData;
import com.ruoyi.cms.common.web.controller.CommonController;
import com.ruoyi.taoke.web.model.TaokeModel;
import com.ruoyi.taoke.web.model.parm.TaokeParm;
import com.ruoyi.taoke.web.service.impl.TaokeServiceImpl;
import com.ruoyi.common.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.ArrayList;
import java.util.List;
@Controller
@RequestMapping("/taoke")
public class TaokeController extends CommonController {

    private final String preifx="themes/taoke";
    @Autowired
    private BlogServiceImpl blogService;
    @Autowired
    private TaokeServiceImpl taokeService;


    @GetMapping(value ={ "","/index","/"})
    public String index(ModelMap mp){
        common(mp);
        /*轮播图*/
        PageHelper.startPage(1,15,"create_time  desc");
        mp.put("carousels",taokeService.listTaoke(null));
        /**
         * 加载前20
         */
        PageHelper.startPage(1,20,"create_time  desc");
        mp.put("newPut",taokeService.listTaoke(null));
        /**
         * 热卖前20
         */
        PageHelper.startPage(1,20,"shop_sales desc");
        mp.put("onSeal",taokeService.listTaoke(null));
        /**
         * 面值前20
         */
        PageHelper.startPage(1,20,"coupon_price desc");
        mp.put("maxCoupon",taokeService.listTaoke(null));
        /**
         * 优惠力度前20
         */
        PageHelper.startPage(1,20,"shop_price desc");
        List<TaokeModel> popluarlis=taokeService.listTaoke(null);
        List<List<TaokeModel>> populars=new ArrayList<>();

        //整除
        if(popluarlis.size()%5==0) {
            for (int i = 1; popluarlis.size() / 5 > i; i++) {
                populars.add(popluarlis.subList((i-1)*5, i * 5));
            }
        }
        //不整数
        else {
            for (int i = 1; (popluarlis.size() / 5+1) > i; i++) {
                if((popluarlis.size()-5*i)>0)
                {
                    populars.add(popluarlis.subList((i-1)*5, i * 5));
                }
                else {
                    populars.add(popluarlis.subList((i-1)*5,popluarlis.size()));
                }

            }
        }
        mp.put("populars",populars);

        /**
         * 列表获取前40
         */
        PageHelper.startPage(1,40,"shop_sales,create_time desc");
        mp.put("taos",taokeService.listTaoke(null));

        //日用品
        PageHelper.startPage(1,20);
        List<Long> dailyNeed=blogService.listArticleIdsByTagId(11L);
        mp.put("dailyNeed",  taokeService.listTaoKeByArticle(dailyNeed, null));

        //数码产品
        PageHelper.startPage(1,20);
        List<Long> mobile=blogService.listArticleIdsByTagId(11L);
        mp.put("mobile",taokeService.listTaoKeByArticle(mobile, null));

        //服饰鞋帽
        PageHelper.startPage(1,20);
        List<Long> shoes=blogService.listArticleIdsByTagId(11L);
        mp.put("shoes",taokeService.listTaoKeByArticle(shoes, null));

        return preifx+"/index";
    }

    @GetMapping("/shop")
    public String shop(ModelMap mp, TaokeParm taokeParm){
        common(mp);
        String pam="?";
        List<TaokeModel> list=new ArrayList<>();
        if(taokeParm.getCatId()!=null)
        { pam=pam+"catId="+taokeParm.getCatId();
            /*根据标签获取*/
            List<Long> pcs=blogService.listArticleIdsByCatId(taokeParm.getCatId());
            if(pcs!=null&&pcs.size()>0) {
               startDefaultPage();
                list = taokeService.listTaoKeByArticle(pcs,taokeParm);
            }

        }
        else if(taokeParm.getTagId()!=null)
        {pam=pam+"tagId="+taokeParm.getTagId();
            List<Long> pts=blogService.listArticleIdsByTagId(taokeParm.getTagId());
            if(pts!=null&&pts.size()>0) {
               startDefaultPage();
                list = taokeService.listTaoKeByArticle(pts,taokeParm);
            }
        }
        else {
            pam=pam+"s=1";
            startDefaultPage();
         list=  taokeService.listTaoke(taokeParm);
        }
        //分页
        if(StringUtils.isNotEmpty(taokeParm.getOrderByColumn())&&StringUtils.isNotEmpty(taokeParm.getIsAsc()))
        {
            pam=pam+"&orderByColumn="+taokeParm.getOrderByColumn()+"&isAsc="+taokeParm.getIsAsc();
        }
        //封装分页
        PageData pageOne= PageData.getData(list);
        mp.put("pages",pageOne);
        mp.put("pam",pam);
        PageHelper.startPage(1,20,"shop_price desc");
        List<TaokeModel> popluarlis=taokeService.listTaoke(null);
        List<List<TaokeModel>> populars=new ArrayList<>();

        //整除
        if(popluarlis.size()/5==0) {
            for (int i = 1; popluarlis.size() / 5 > i; i++) {
                populars.add(popluarlis.subList((i-1)*5, i * 5));
            }
        }
        //不整除
        else {
            for (int i = 1; (popluarlis.size() / 5+1) > i; i++) {
                if((popluarlis.size()-5*i)>0)
                {
                    populars.add(popluarlis.subList((i-1)*5, i * 5));
                }
                else {
                    populars.add(popluarlis.subList((i-1)*5,popluarlis.size()));
                }

            }
        }
        mp.put("populars",populars);
        PageHelper.startPage(1,20);
        List<Long> dailyNeed=blogService.listArticleIdsByTagId(11L);
        mp.put("dailyNeed",  taokeService.listTaoKeByArticle(dailyNeed, taokeParm));

        PageHelper.startPage(1,20);
        List<Long> mobile=blogService.listArticleIdsByTagId(11L);
        mp.put("mobile",taokeService.listTaoKeByArticle(mobile, taokeParm));

        PageHelper.startPage(1,20);
        List<Long> shoes=blogService.listArticleIdsByTagId(11L);
        mp.put("shoes",taokeService.listTaoKeByArticle(shoes, taokeParm));
        return preifx+"/shop";
    }

    @GetMapping(value={"/weal","/weal/category/{catId}","/weal/ticket/{tagId}"})
    public String weal(@PathVariable(required = false,name = "catId")Long catId,@PathVariable(required = false,name = "tagId")Long tagId,ModelMap mp){
        //主菜单22
        //福利导航
        mp.put("wealMenus",blogService.listBlogMenuTreeByColumnId(62L));
        common(mp);
       //福利列表 文章列表
        BlogArticleSearchParam bl=new BlogArticleSearchParam();
       //福利文章为8
        bl.setArticleType((byte)8);
        List<BlogArticle> list =null;
        if (catId!=null){
            bl.setCatId(catId);
            startDefaultPage();
           list= blogService.listBlogArticlesByCatId(bl);
        }
        else if(tagId!=null)
        {
            bl.setTagId(tagId);
            startDefaultPage();
            list= blogService.listBlogArticlesByTagId(bl);
        }
        else {
            startDefaultPage();
            list=blogService.listBlogArticles(bl);
        }


        //封装分页
        PageData pageOne= PageData.getData(list);
        mp.put("wealPosts",pageOne);


        PageHelper.startPage(1,20,"shop_price desc");
        List<TaokeModel> popluarlis=taokeService.listTaoke(null);
        List<List<TaokeModel>> populars=new ArrayList<>();

        //整除
        if(popluarlis.size()/5==0) {
            for (int i = 1; popluarlis.size() / 5 > i; i++) {
                populars.add(popluarlis.subList((i-1)*5, i * 5));
            }
        }
        //不整除
        else {
            for (int i = 1; (popluarlis.size() / 5+1) > i; i++) {
                if((popluarlis.size()-5*i)>0)
                {
                    populars.add(popluarlis.subList((i-1)*5, i * 5));
                }
                else {
                    populars.add(popluarlis.subList((i-1)*5,popluarlis.size()));
                }

            }
        }
        mp.put("populars",populars);
        PageHelper.startPage(1,20);
        List<Long> dailyNeed=blogService.listArticleIdsByTagId(11L);
        mp.put("dailyNeed",  taokeService.listTaoKeByArticle(dailyNeed, null));

        PageHelper.startPage(1,20);
        List<Long> mobile=blogService.listArticleIdsByTagId(11L);
        mp.put("mobile",taokeService.listTaoKeByArticle(mobile, null));

        PageHelper.startPage(1,20);
        List<Long> shoes=blogService.listArticleIdsByTagId(11L);
        mp.put("shoes",taokeService.listTaoKeByArticle(shoes, null));
        return preifx+"/weal";
    }

    @GetMapping("/weal/post/{articleId}")
    public String wealPost(@PathVariable("articleId") long articleId, ModelMap mp){
        //主菜单22
        //福利导航
        mp.put("wealMenus",blogService.listBlogMenuTreeByColumnId(62L));
        common(mp);
        BlogArticle blogArticle=new BlogArticle();
        blogArticle.setArticleId(articleId);
        blogArticle.setArticleType((byte) 8);
        mp.put("wealPost",blogService.getBlogArticle(blogArticle));
        //福利列表 文章列表
        BlogArticleSearchParam bl=new BlogArticleSearchParam();
        bl.setArticleType((byte) 8);
        /*获取最近发布*/
        PageHelper.startPage(1,10,"create_time desc");
        mp.put("wealPostRecently",blogService.listBlogArticles(bl));
        /* 推荐推荐福利*/
        PageHelper.startPage(1,10,"article_top desc");
        mp.put("wealPostTop",blogService.listBlogArticles(bl));
        blogService.listBlogArticles(bl);
        return preifx+"/wealPost";
    }

    @GetMapping("/callMe")
    public String callMe(ModelMap mp){
         common(mp);
        return preifx+"/callMe";
    }


    private void common(ModelMap mp){
        //主菜单22
        mp.put("taokeMenu",blogService.listBlogMenuTreeByColumnId(22L));
        //类目导航菜单29
        mp.put("goodMenu",blogService.listBlogMenuTreeByColumnId(29L));

    }

}
