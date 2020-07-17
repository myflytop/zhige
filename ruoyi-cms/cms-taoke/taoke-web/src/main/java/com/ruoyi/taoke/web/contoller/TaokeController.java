package com.ruoyi.taoke.web.contoller;

import com.github.pagehelper.PageHelper;
import com.ruoyi.blog.mould.BlogArticle;
import com.ruoyi.blog.mould.pam.BlogArticleSearchParam;
import com.ruoyi.blog.service.impl.BlogServiceImpl;
import com.ruoyi.cache.redis.constant.CacheConstant;
import com.ruoyi.cms.common.mould.support.PageData;
import com.ruoyi.cms.common.web.controller.CommonController;
import com.ruoyi.taoke.web.model.TaokeModel;
import com.ruoyi.taoke.web.model.parm.TaokeParm;
import com.ruoyi.taoke.web.service.impl.TaokeServiceImpl;
import com.ruoyi.common.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
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

    private final String prefix="taoke/web";
    @Autowired
    private BlogServiceImpl blogService;
    @Autowired
    private TaokeServiceImpl taoKeService;

    /**
     * 淘客主页
     * @param mp
     * @return
     */
    @GetMapping(value ={ "","/index","/"})
    public String indexTaoKe(ModelMap mp){
        mp.put("seo",blogService.getBlogMenuByMenuUrl("/taoke/index"));
        return prefix+"/index";
    }

    /**
     * 商品搜索主页
     * @param mp
     * @param taokeParm
     * @return
     */
    @GetMapping("/shop")
    public String shop(ModelMap mp, TaokeParm taokeParm){

        String pam="?";
        List<TaokeModel> list=new ArrayList<>();
        if(taokeParm.getCatId()!=null)
        { pam=pam+"catId="+taokeParm.getCatId();
            /*根据标签获取*/
            List<Long> pcs=blogService.listArticleIdsByCatId(taokeParm.getCatId());
            if(pcs!=null&&pcs.size()>0) {
               startDefaultPage();
                list = taoKeService.listTaoKeByArticle(pcs,taokeParm);
                mp.put("seo",blogService.getBlogCatByCatId(taokeParm.getCatId()));
            }

        }
        else if(taokeParm.getTagId()!=null)
        {pam=pam+"tagId="+taokeParm.getTagId();
            List<Long> pts=blogService.listArticleIdsByTagId(taokeParm.getTagId());
            if(pts!=null&&pts.size()>0) {
               startDefaultPage();
                list = taoKeService.listTaoKeByArticle(pts,taokeParm);
                mp.put("seo",blogService.getBlogTagByTagId(taokeParm.getTagId()));
            }
        }
        else {
            pam=pam+"s=1";
            startDefaultPage();
         list=  taoKeService.listTaoke(taokeParm);
            mp.put("seo",blogService.getBlogMenuByMenuUrl("/taoke/shop"));
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
        return prefix+"/shop";
    }

    /**
     * 福利文章页
     * @param catId
     * @param tagId
     * @param mp
     * @return
     */
    @GetMapping(value={"/weal","/weal/category/{catId}","/weal/ticket/{tagId}"})
    public String weal(@PathVariable(required = false,name = "catId")Long catId,@PathVariable(required = false,name = "tagId")Long tagId,ModelMap mp){
       //福利列表 文章列表
        BlogArticleSearchParam bl=new BlogArticleSearchParam();
       //福利文章为8
        bl.setArticleType((byte)8);
        List<BlogArticle> list =null;
        if (catId!=null){
            bl.setCatId(catId);
            startDefaultPage();
           list= blogService.listBlogArticlesByCatId(bl);
            mp.put("seo",blogService.getBlogCatByCatId(catId));
        }
        else if(tagId!=null)
        {
            bl.setTagId(tagId);
            startDefaultPage();
            list= blogService.listBlogArticlesByTagId(bl);
            mp.put("seo",blogService.getBlogTagByTagId(tagId));
        }
        else {
            startDefaultPage();
            list=blogService.listBlogArticles(bl);
            mp.put("seo",blogService.getBlogMenuByMenuUrl("/taoke/weal"));

        }

        //封装分页
        PageData pageOne= PageData.getData(list);
        mp.put("wealPosts",pageOne);

        return prefix+"/weal";
    }

    /**
     * 获取福利文章教程
     * @param articleId
     * @param mp
     * @return
     */
    @GetMapping("/weal/post/{articleId}")
    public String wealPost(@PathVariable("articleId") long articleId, ModelMap mp){
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
        return prefix+"/wealPost";
    }

    /**
     * 反馈页面
     * @param mp
     * @return
     */
    @GetMapping("/callMe")
    public String callMe(ModelMap mp){
        mp.put("seo",blogService.getBlogMenuByMenuUrl("/taoke/callMe"));
        return prefix+"/callMe";
    }


}
