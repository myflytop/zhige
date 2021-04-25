package com.oly.web.web.contoller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.github.pagehelper.PageHelper;
import com.oly.comment.model.CmsComment;
import com.oly.comment.servie.impl.CmsCommentServiceImpl;
import com.oly.common.model.properties.OlyWebConfigProetries;
import com.oly.common.model.support.PageData;
import com.oly.framework.web.service.OlyCommonService;
import com.oly.web.annotation.BlogLog;
import com.oly.web.mould.BlogArticle;
import com.oly.web.mould.BlogCat;
import com.oly.web.mould.BlogLink;
import com.oly.web.mould.BlogTag;
import com.oly.web.mould.pam.BlogArticleSearchParam;
import com.oly.web.service.impl.BlogServiceImpl;
import com.oly.web.web.CommonController;
import com.ruoyi.system.service.impl.SysConfigServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/blog")
public class BlogController extends CommonController {

    @Autowired
    private BlogServiceImpl blogService;
    @Autowired
    private CmsCommentServiceImpl cmsCommentService;
    @Autowired
    private SysConfigServiceImpl configService;
    @Autowired
    private OlyCommonService commonService;

    /**
     * 内容主页
     * 
     * @param mp
     * @return
     */
    @BlogLog(title = "主页请求")
    @GetMapping(value = { "", "/", "/index" })
    public String index(ModelMap mp) {
 
        mp.put("menu", blogService.getBlogMenuById(Long.parseLong( commonService.selectConfigDefauleValue(OlyWebConfigProetries.PAGE_INDEX))));
        return getPrefix(configService, "/index");
    }

    /**
     * 请求指定文章
     * 
     * @param postId
     * @param mp
     * @return
     */
    @GetMapping("/post/{postId}")
    public String post(@PathVariable("postId") Long postId, ModelMap mp) {
        BlogArticle blogArticle = new BlogArticle();
        blogArticle.setArticleId(postId);
        BlogArticle bArticle = blogService.getBlogArticle(blogArticle);
        if (bArticle == null) {
            mp.put("postId", postId);
            return getPrefix(configService, "/postNotFind");
        } else {
            mp.put("post", blogService.getBlogArticle(blogArticle));
            CmsComment cmsComment = new CmsComment();
            cmsComment.setArticleId(postId);
            cmsComment.setParentId(0L);
            // 获取第一页评论
            mp.put("comments", cmsCommentService.listCmsCommentPage(cmsComment));
            return getPrefix(configService, "/post");
        }
    }

    /**
     * 文章标签
     * 
     * @param tag
     * @param mp
     * @return
     */
    @GetMapping("/tag")
    public String tags(BlogTag tag, ModelMap mp) {
        mp.put("menu",blogService.getBlogMenuById(Long.parseLong( commonService.selectConfigDefauleValue(OlyWebConfigProetries.PAGE_TAG))));
        mp.put("tags", blogService.listBlogTags(tag));
        return getPrefix(configService, "/tags");
    }

    /**
     * 文章标签
     * 
     * @param tagId
     * @param mp
     * @return
     */
    @GetMapping("/tag/{tagId}")
    public String tag(@PathVariable("tagId") Long tagId, ModelMap mp) {
        BlogArticleSearchParam bl = new BlogArticleSearchParam();
        bl.setTagId(tagId);
        // 文章列表
        mp.put("posts", blogService.listBlogArticlesByTagId(bl));
        // 当前查询的标签
        mp.put("tag", blogService.getBlogTagByTagId(tagId));
        return getPrefix(configService, "/tag");
    }

    /**
     * 请求文章分类
     * 
     * @param cat
     * @param mp
     * @return
     */
    @GetMapping("/cat")
    public String cat(BlogCat cat, ModelMap mp) {
        mp.put("menu", blogService.getBlogMenuById(Long.parseLong(commonService.selectConfigDefauleValue(OlyWebConfigProetries.PAGE_CATEGORY))));
        mp.put("cats", blogService.listBlogCats(cat));
        return getPrefix(configService, "/categories");

    }

    /**
     * 请求文章分类
     * 
     * @param catId
     * @param mp
     * @return
     */
    @GetMapping("/cat/{catId}")
    public String cat(@PathVariable("catId") Long catId, ModelMap mp) {
        BlogArticleSearchParam bl = new BlogArticleSearchParam();
        bl.setCatId(catId);
        mp.put("posts", blogService.listBlogArticlesByCatId(bl));
        // 当前查询的分类
        mp.put("cat", blogService.getBlogCatByCatId(catId));
        return getPrefix(configService, "/category");
    }

    /**
     * 请求链接
     * 
     * @param mp
     * @return
     */
    @GetMapping("/links")
    public String links(ModelMap mp) {
        mp.put("menu", blogService.getBlogMenuById(Long.parseLong( commonService.selectConfigDefauleValue(OlyWebConfigProetries.PAGE_LINKS))));
        // 依据分组名将链接转化为分组
        Map<String, List<BlogLink>> linkMap = blogService.listBlogLinks(null).stream()
                .collect(Collectors.groupingBy(BlogLink::getGroupName));
        mp.put("links", linkMap);
        return getPrefix(configService, "/links");
    }

    /**
     * 获取关于本站
     * 
     * @param mp
     * @return
     */
    @GetMapping("/about")
    public String about(ModelMap mp) {
        mp.put("menu", blogService.getBlogMenuById(Long.parseLong( commonService.selectConfigDefauleValue(OlyWebConfigProetries.PAGE_ABOUT))));
        return getPrefix(configService, "/about");
    }

    /**
     * 各种排行
     * 
     * @param modelMap
     * @return
     */
    @GetMapping("/rank")
    public String rank(ModelMap modelMap) {
        modelMap.put("menu", blogService.getBlogMenuById(Long.parseLong( commonService.selectConfigDefauleValue(OlyWebConfigProetries.PAGE_RANK))));
        return getPrefix(configService, "/rank");
    }

    /**
     * 时间线
     * 
     * @param modelMap
     * @param pageNum
     * @return
     */
    @GetMapping("/timeLine")
    public String timeLine(ModelMap modelMap, @RequestParam(defaultValue = "1") int pageNum) {
        modelMap.put("menu",blogService.getBlogMenuById(Long.parseLong( commonService.selectConfigDefauleValue(OlyWebConfigProetries.PAGE_TIMELINE))));
        PageHelper.startPage(pageNum, 20, "create_time desc");
        List<BlogArticle> list = blogService.listBlogArticles(null);
        // 按照时间分组
        Map<String, List<BlogArticle>> map = list.stream()
                .collect(Collectors.groupingBy(blogArticle -> neData(blogArticle.getCreateTime())));
        PageData pageOne = PageData.getData(list);
        modelMap.put("timeLinePage", pageOne);
        modelMap.put("timeLineMap", map);
        return getPrefix(configService, "/timeLine");
    }

    /**
     * 反馈联系
     * @param mp
     * @return
     */
    @GetMapping("/contact")
    public String contact(ModelMap mp) {
        mp.put("menu", blogService.getBlogMenuById(Long.parseLong( commonService.selectConfigDefauleValue(OlyWebConfigProetries.PAGE_CATEGORY))));
        return getPrefix(configService, "/contact");
    }

    private String neData(Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy MM");
        String newDate = sdf.format(date);
        return newDate;
    }
}
