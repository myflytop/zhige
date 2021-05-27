package com.oly.web.web.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.github.pagehelper.PageHelper;
import com.oly.comment.model.CmsComment;
import com.oly.comment.servie.impl.CmsCommentServiceImpl;
import com.oly.common.model.properties.OlyCmsConfigPropetries;
import com.oly.common.model.properties.OlyThemeProperties;
import com.oly.common.model.properties.OlyWebConfigProetries;
import com.oly.common.model.support.PageData;
import com.oly.framework.web.service.OlyCommonService;
import com.oly.web.model.pam.BlogArticleSearchParam;
import com.oly.web.model.po.BlogArticle;
import com.oly.web.model.po.BlogCat;
import com.oly.web.model.po.BlogLink;
import com.oly.web.model.po.BlogTag;
import com.oly.web.service.impl.BlogServiceImpl;
import com.oly.web.web.CommonController;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.service.impl.SysConfigServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;

@Service
public class WebPageService extends CommonController {

    @Autowired
    private BlogServiceImpl blogService;
    @Autowired
    private CmsCommentServiceImpl cmsCommentService;
    @Autowired
    private SysConfigServiceImpl configService;
    @Autowired
    private OlyCommonService commonService;

    public String index(String themeName,ModelMap mp) {

        mp.put("menu", blogService.getBlogMenuById(
                Long.parseLong(commonService.selectConfigDefauleValue(OlyWebConfigProetries.PAGE_INDEX))));
        return getPrefix(themeName,"/index");
    }

    public String post(String themeName,Long postId, ModelMap mp) {
        BlogArticle blogArticle = new BlogArticle();
        blogArticle.setArticleId(postId);
        BlogArticle bArticle = blogService.getBlogArticle(blogArticle);
        if (bArticle == null) {
            mp.put("postId", postId);
            return getPrefix(themeName,"/postNotFind");
        } else {
            mp.put("post", blogService.getBlogArticle(blogArticle));
            CmsComment cmsComment = new CmsComment();
            cmsComment.setArticleId(postId);
            cmsComment.setParentId(0L);
            // 获取第一页评论
            mp.put("comments", cmsCommentService.listCmsCommentPage(cmsComment));
            return getPrefix(themeName,"/post");
        }
    }

    public String tags(String themeName,BlogTag tag, ModelMap mp) {
        mp.put("menu", blogService.getBlogMenuById(
                Long.parseLong(commonService.selectConfigDefauleValue(OlyWebConfigProetries.PAGE_TAG))));
        mp.put("tags", blogService.listBlogTags(tag));
        return getPrefix(themeName,"/tags");
    }

    public String tag(String themeName,Long tagId, ModelMap mp) {
        BlogArticleSearchParam bl = new BlogArticleSearchParam();
        bl.setTagId(tagId);
        // 文章列表
        mp.put("posts", blogService.listBlogArticles(bl));
        // 当前查询的标签
        mp.put("tag", blogService.getBlogTagByTagId(tagId));
        return getPrefix(themeName,"/tag");
    }

    public String cats(String themeName,BlogCat cat, ModelMap mp) {
        mp.put("menu", blogService.getBlogMenuById(
                Long.parseLong(commonService.selectConfigDefauleValue(OlyWebConfigProetries.PAGE_CATEGORY))));
        mp.put("cats", blogService.listBlogCats(cat));
        return getPrefix(themeName,"/categories");

    }

    public String cat(String themeName,@PathVariable("catId") Long catId, ModelMap mp) {
        BlogArticleSearchParam bl = new BlogArticleSearchParam();
        bl.setCatId(catId);
        mp.put("posts", blogService.listBlogArticles(bl));
        // 当前查询的分类
        mp.put("cat", blogService.getBlogCatByCatId(catId));
        return getPrefix(themeName,"/category");
    }

    public String links(String themeName,ModelMap mp) {
        mp.put("menu", blogService.getBlogMenuById(
                Long.parseLong(commonService.selectConfigDefauleValue(OlyWebConfigProetries.PAGE_LINKS))));
        // 依据分组名将链接转化为分组
        Map<String, List<BlogLink>> linkMap = blogService.listBlogLinks(null).stream()
                .collect(Collectors.groupingBy(BlogLink::getGroupName));
        mp.put("links", linkMap);
        return getPrefix(themeName,"/links");
    }

    public String about(String themeName,ModelMap mp) {
        mp.put("menu", blogService.getBlogMenuById(
                Long.parseLong(commonService.selectConfigDefauleValue(OlyWebConfigProetries.PAGE_ABOUT))));
        return getPrefix(themeName,"/about");
    }

    public String rank(String themeName,ModelMap modelMap) {
        modelMap.put("menu", blogService.getBlogMenuById(
                Long.parseLong(commonService.selectConfigDefauleValue(OlyWebConfigProetries.PAGE_RANK))));
        return getPrefix(themeName,"/rank");
    }

    public String timeLine(String themeName,ModelMap modelMap, int pageNum) {
        modelMap.put("menu", blogService.getBlogMenuById(
                Long.parseLong(commonService.selectConfigDefauleValue(OlyWebConfigProetries.PAGE_TIMELINE))));
        PageHelper.startPage(pageNum, 20, "create_time desc");
        List<BlogArticle> list = blogService.listBlogArticles(null);
        // 按照时间分组
        Map<String, List<BlogArticle>> map = list.stream()
                .collect(Collectors.groupingBy(blogArticle -> neData(blogArticle.getCreateTime())));
        PageData pageOne = PageData.getData(list);
        modelMap.put("timeLinePage", pageOne);
        modelMap.put("timeLineMap", map);
        return getPrefix(themeName,"/timeLine");
    }

    public String contact(String themeName,ModelMap mp) {
        mp.put("menu", blogService.getBlogMenuById(
                Long.parseLong(commonService.selectConfigDefauleValue(OlyWebConfigProetries.PAGE_CATEGORY))));
        return getPrefix(themeName,"/contact");
    }

    private String neData(Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy MM");
        String newDate = sdf.format(date);
        return newDate;
    }


    /**
     * 默认转发 1.查找是否存在缓存 2.不存在使用默认主题
     * 
     * @param redisUtils
     * @param page
     * @return
     */
    protected String getPrefix(String themeName, String page) {
        if (StringUtils.isNotEmpty(themeName)) {
            boolean support = "true"
                    .equals(configService.selectConfigByKey(OlyCmsConfigPropetries.THEME_OPEN_MORE.getValue()));
            if (support && StringUtils.isNotEmpty(themeName)) {
                return themeName + page;
            }
            return "redirect:/";
        } else {
            themeName = configService.selectConfigByKey(OlyThemeProperties.THEME_USED.getValue());
            if (StringUtils.isEmpty(themeName)) {
                return OlyThemeProperties.THEME_USED.defaultValue() + page;
            }
            return themeName + page;
        }
    }
}
