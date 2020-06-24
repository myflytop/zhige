package com.ruoyi.blog.web.contoller;

import com.github.pagehelper.PageHelper;
import com.ruoyi.blog.annotation.BlogLog;
import com.ruoyi.blog.mould.*;
import com.ruoyi.blog.mould.pam.BlogArticleSearchParam;
import com.ruoyi.blog.service.impl.BlogArticleSortServiceImpl;
import com.ruoyi.blog.service.impl.BlogServiceImpl;
import com.ruoyi.cache.redis.util.RedisUtils;
import com.ruoyi.cms.comment.model.CmsComment;
import com.ruoyi.cms.comment.servie.impl.CmsCommentServiceImpl;
import com.ruoyi.cms.common.mould.support.PageData;
import com.ruoyi.cms.common.web.controller.CommonController;
import com.ruoyi.common.core.domain.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/blog")
public class BlogController extends CommonController {
    @Autowired
    private BlogServiceImpl blogService;
    @Autowired
    private BlogArticleSortServiceImpl blogArticleSortService;
    @Autowired
    private CmsCommentServiceImpl cmsCommentService;
    @Autowired
    private RedisUtils redisUtils;

  @GetMapping("/menuTree")
  @ResponseBody
  public AjaxResult menuTree(BlogMenu blogMenu){
      return AjaxResult.success(blogService.listBlogMenuTree(blogMenu));
  }

    /**
     * 内容主页
     * @param mp
     * @return
     */
    @BlogLog(title = "主页请求")
    @GetMapping("/index")
    public String index(ModelMap mp){
        baseDataPut(mp);
        //缓存72条数据
        PageHelper.startPage(1, 72, "create_time desc");
        List<BlogArticle> list=blogService.listBlogArticles(null);
        PageData pageOne=PageData.getData(list);
        mp.put("posts", pageOne);
      return getPreifx(redisUtils,"/index");
    }

    /**
     * 请求文章
     * @param postId
     * @param mp
     * @return
     */
    @GetMapping("/post/{postId}")
    public String post(@PathVariable("postId")Long postId, ModelMap mp){
        baseDataPut(mp);
        BlogArticle blogArticle=new BlogArticle();
        blogArticle.setArticleId(postId);
        mp.put("post",blogService.getBlogArticle(blogArticle));
        CmsComment cmsComment=new CmsComment();
        cmsComment.setArticleId(postId);
        cmsComment.setParentId(0L);
        //获取第一页评论
        mp.put("comments",cmsCommentService.listCmsCommentPage(cmsComment));
        return getPreifx(redisUtils,"/post");
    }

    /**
     * 文章标签
     * @param tag
     * @param mp
     * @return
     */
    @GetMapping("/tag")
    public String tags(BlogTag tag, ModelMap mp){
        baseDataPut(mp);
        mp.put("tags",blogService.listBlogTags(tag));
        return getPreifx(redisUtils,"/tags");
    }

    /**
     * 文章标签
     * @param tagId
     * @param mp
     * @return
     */
    @GetMapping("/tag/{tagId}")
    public String tag(@PathVariable("tagId") Long tagId, ModelMap mp){
        baseDataPut(mp);
        BlogArticleSearchParam bl=new BlogArticleSearchParam();
        bl.setTagId(tagId);
        //文章列表
        mp.put("posts",blogService.listBlogArticlesByTagId(bl));
        //当前查询的标签
        mp.put("tag",blogService.getBlogTagByTagId(tagId));
        return getPreifx(redisUtils,"/tag");
    }

    /**
     * 请求文章分类
     * @param cat
     * @param mp
     * @return
     */
    @GetMapping("/cat")
    public String cat(BlogCat cat, ModelMap mp){
        baseDataPut(mp);
        mp.put("cats",blogService.listBlogCats(cat));
        return getPreifx(redisUtils,"/categories");

    }

    /**
     * 请求文章分类
     * @param catId
     * @param mp
     * @return
     */
    @GetMapping("/cat/{catId}")
    public String cat(@PathVariable("catId") Long catId, ModelMap mp){
        baseDataPut(mp);
        BlogArticleSearchParam bl=new BlogArticleSearchParam();
        bl.setCatId(catId);
        mp.put("posts",blogService.listBlogArticlesByCatId(bl));
        //当前查询的分类
        mp.put("cat",blogService.getBlogCatByCatId(catId));
        return getPreifx(redisUtils,"/category");
    }

    /**
     * 请求链接
     * @param mp
     * @return
     */
    @GetMapping("/links")
    public String links(ModelMap mp){
        baseDataPut(mp);
        //依据分组将文章转化map
        Map<String, List<BlogLink>> linkMap=blogService.listBlogLinks(null).stream().collect(Collectors.groupingBy(BlogLink::getGroupName));
        mp.put("links",linkMap);
        return getPreifx(redisUtils,"/links");
    }

    /**
     * 获取关于本站
     * @param mp
     * @return
     */
    @GetMapping("/about")
    public String about(ModelMap mp){
        baseDataPut(mp);
        return getPreifx(redisUtils,"/about");
    }

    /**
     * 各种排行
     * @param modelMap
     * @return
     */
    @GetMapping("/rank")
    public String rank(ModelMap modelMap){
        baseDataPut(modelMap);
        return getPreifx(redisUtils,"/rank");
    }

    /**
     * 时间线
     * @param modelMap
     * @param pageNum
     * @return
     */
    @GetMapping("/timeLine")
    public String timeLine(ModelMap modelMap,@RequestParam(defaultValue = "1") int pageNum){
        baseDataPut(modelMap);
        PageHelper.startPage(pageNum,20, "create_time desc");
        List<BlogArticle> list=blogService.listBlogArticles(null);
        //按照时间分组
        Map<String, List<BlogArticle>> map = list.stream().collect(Collectors.groupingBy(blogArticle->neData(blogArticle.getCreateTime())));
        PageData pageOne=PageData.getData(list);
        modelMap.put("timeLinePage",pageOne);
        modelMap.put("timeLineMap",map);
        return getPreifx(redisUtils,"/timeLine");
    }

    @GetMapping("/contact")
    public String contact(){
       return getPreifx(redisUtils,"/contact");
    }

    private String neData(Date date){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy MM");
        String newDate = sdf.format(date);
        return newDate;
    }

    private void baseDataPut( ModelMap mp){
        BlogMenu blogMenu=new BlogMenu();
        blogMenu.setColumnId(21L);
        mp.put("menus",blogService.listBlogMenuTree(blogMenu));
        mp.put("tags",blogService.listBlogTags(null));
    }



}
