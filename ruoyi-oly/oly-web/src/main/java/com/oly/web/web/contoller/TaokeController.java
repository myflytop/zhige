package com.oly.web.web.contoller;

import java.util.ArrayList;
import java.util.List;

import com.github.pagehelper.PageHelper;
import com.oly.common.constant.OlySystemConstant;
import com.oly.common.model.properties.OlyWebConfigProetries;
import com.oly.common.model.support.PageData;
import com.oly.framework.web.service.OlyCommonService;
import com.oly.web.model.TaokeModel;
import com.oly.web.model.parm.TaokeParm;
import com.oly.web.mould.BlogArticle;
import com.oly.web.mould.pam.BlogArticleSearchParam;
import com.oly.web.service.impl.BlogServiceImpl;
import com.oly.web.service.impl.TaokeServiceImpl;
import com.oly.web.web.CommonController;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.service.impl.SysConfigServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
@RequestMapping("/taoke")
public class TaokeController extends CommonController {
    @Autowired
    private BlogServiceImpl blogService;
    @Autowired
    private TaokeServiceImpl taoKeService;
    @Autowired
    private SysConfigServiceImpl configService;
    @Autowired
    private OlyCommonService commonService;

    /**
     * 淘客主页
     * @param mp
     * @return
     */
    @GetMapping(value ={ "","/index","/"})
    public String indexTaoKe(ModelMap mp){
        mp.put("seo",blogService.getBlogMenuById(Long.parseLong( commonService.selectConfigDefauleValue(OlyWebConfigProetries.PAGE_TAO_INDEX))));
        return getPrefix(configService, "/tao/index");
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
        startDefaultPage();
        list = taoKeService.listTaoKeByTagId(taokeParm.getCatId());
        mp.put("seo",blogService.getBlogTagByTagId(taokeParm.getCatId()));

        }
        else if(taokeParm.getTagId()!=null)
        {pam=pam+"tagId="+taokeParm.getTagId();
          
               startDefaultPage();
                list = taoKeService.listTaoKeByTagId(taokeParm.getTagId());
                mp.put("seo",blogService.getBlogTagByTagId(taokeParm.getTagId()));
            
        }
        else {
            pam=pam+"s=1";
            startDefaultPage();
         list=  taoKeService.listTaokeByTaoKe(taokeParm);
            mp.put("seo",blogService.getBlogMenuById(Long.parseLong( commonService.selectConfigDefauleValue(OlyWebConfigProetries.PAGE_TAO_SHOP))));
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
        return getPrefix(configService, "/tao/shop");
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
       //福利文章为1
        bl.setArticleType(OlySystemConstant.TAO_KE_POST_WEAL_TYPE);
        List<BlogArticle> list =null;
        if (catId!=null){
            bl.setCatId(catId);
            startDefaultPage();
           list= blogService.listBlogArticlesByCatId(bl);
            mp.put("seo",blogService.getBlogMenuById(catId));
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
            mp.put("seo",blogService.getBlogMenuById(Long.parseLong( commonService.selectConfigDefauleValue(OlyWebConfigProetries.PAGE_TAO_WEAL))));

        }

        //封装分页
        PageData pageOne= PageData.getData(list);
        mp.put("wealPosts",pageOne);

        return getPrefix(configService, "/tao/weal");
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
        return getPrefix(configService, "/tao/wealPost");
    }

    /**
     * @param mp
     * @return
     */
    @GetMapping("/about")
    public String callMe(ModelMap mp){
        mp.put("seo",blogService.getBlogMenuById(Long.parseLong( commonService.selectConfigDefauleValue(OlyWebConfigProetries.PAGE_TAO_ABOUT))));
        return getPrefix(configService, "/tao/about");
    }

    /**
     * @param mp
     * @return
     */
    @GetMapping("/rank")
    public String rank(ModelMap mp){
        mp.put("seo",blogService.getBlogMenuById(Long.parseLong( commonService.selectConfigDefauleValue(OlyWebConfigProetries.PAGE_TAO_RANK))));
        return getPrefix(configService, "/tao/rank");
    }


}
