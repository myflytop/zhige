package com.oly.web.web.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.oly.common.model.properties.OlyWebConfigProetries;
import com.oly.common.model.support.PageData;
import com.oly.web.model.pam.BlogArticleSearchParam;
import com.oly.web.model.po.BlogArticle;
import com.oly.web.model.po.BlogCat;
import com.oly.web.model.po.BlogTag;
import com.oly.web.service.cache.BlogArticleCacheService;
import com.oly.web.service.cache.BlogCategoryCacheService;
import com.oly.web.service.cache.BlogTagCacheService;
import com.oly.web.web.CommonController;

import com.ruoyi.common.utils.StringUtils;
import org.apache.commons.lang3.ArrayUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;

@Service
public class WebPageService extends CommonController {

    @Autowired
    private BlogCategoryCacheService blogCatService;
    @Autowired
    private BlogTagCacheService blogTagService;
    @Autowired
    private BlogArticleCacheService blogPostService;

    /**
     * 主页
     * 
     * @param themeName
     * @param mp
     * @return
     */
    public String index(String themeName, ModelMap mp) {
        mp.put("menu", getBlogMenu(themeName, OlyWebConfigProetries.PAGE_INDEX));
        return getPrefix(themeName, "/index");
    }

    /**
     * 文章页
     * 
     * @param themeName
     * @param postId
     * @param mp
     * @return
     */
    public String post(String themeName, Long postId, ModelMap mp) {
        mp.put("postId", postId);
        return getPrefix(themeName, "/post");
    }

    /**
     * 搜索页面
     * 
     * @param themeName
     * @param mp
     * @param parm
     * @return
     */
    public String search(String themeName, ModelMap mp, BlogArticleSearchParam parm) {
        List<BlogArticle> list = new ArrayList<>();
        startDefaultPage();
        list = blogPostService.listBlogArticles(parm, themeName);
        PageData pageOne = PageData.getData(list);
        mp.put("posts", pageOne);
        return getPrefix(themeName, "/search");
    }

    /**
     * 获取标签列表
     *
     * @param themeName
     * @param tag
     * @param mp
     * @return
     */
    public String tags(String themeName, BlogTag tag, ModelMap mp) {
        mp.put("menu", getBlogMenu(themeName, OlyWebConfigProetries.PAGE_TAG));
        tag.getParams().put("supportType", getSupportType(themeName, OlyWebConfigProetries.ARTICLE_TYPES));
        mp.put("tags", blogTagService.listBlogTags(tag));
        return getPrefix(themeName, "/tags");
    }

    /**
     * 通过标签Id获取文章列表
     *
     * @param themeName
     * @param tagId
     * @param mp
     * @return
     */
    public String tag(String themeName, Long tagId, ModelMap mp) {
        BlogTag tag = blogTagService.getBlogTagByTagId(tagId);
        PageData pageOne = null;
        if (tag != null) {
            String[] types = StringUtils.split(getSupportType(themeName, OlyWebConfigProetries.ARTICLE_TYPES), ",");
            if (StringUtils.isEmpty(types) || ArrayUtils.contains(types, tag.getTagType())) {
                BlogArticleSearchParam bl = new BlogArticleSearchParam();
                bl.setTagId(tagId);
                List<BlogArticle> list = new ArrayList<>();
                startDefaultPage();
                list = blogPostService.listBlogArticles(bl, themeName);
                pageOne = PageData.getData(list);
            }
        }
        // 当前查询的标签
        mp.put("tag", tag);
        mp.put("posts", pageOne);
        return getPrefix(themeName, "/tag");
    }

    /**
     * 获取主题支持的分类
     *
     * @param themeName
     * @param cat
     * @param mp
     * @return
     */
    public String cats(String themeName, BlogCat cat, ModelMap mp) {
        mp.put("menu", getBlogMenu(themeName, OlyWebConfigProetries.PAGE_CATEGORY));
        cat.getParams().put("supportType", getSupportType(themeName, OlyWebConfigProetries.ARTICLE_TYPES));
        mp.put("cats", blogCatService.listBlogCats(cat));
        return getPrefix(themeName, "/categories");
    }

    /**
     * 依据分类ID获取文章
     *
     * @param themeName
     * @param catId
     * @param mp
     * @return
     */
    public String cat(String themeName, @PathVariable("catId") Long catId, ModelMap mp) {
        BlogCat cat = blogCatService.getBlogCatByCatId(catId);
        PageData pageOne = null;
        if (cat != null) {
            String[] types = StringUtils.split(getSupportType(themeName, OlyWebConfigProetries.ARTICLE_TYPES), ",");
            if (StringUtils.isEmpty(types) || ArrayUtils.contains(types, cat.getCatType())) {
                BlogArticleSearchParam bl = new BlogArticleSearchParam();
                bl.setCatId(catId);
                List<BlogArticle> list = new ArrayList<>();
                startDefaultPage();
                list = blogPostService.listBlogArticles(bl, themeName);
                pageOne = PageData.getData(list);
            }
        }
        // 当前查询的分类
        mp.put("cat", cat);
        mp.put("posts", pageOne);
        return getPrefix(themeName, "/category");
    }

    /**
     * 获取链接列表
     *
     * @param themeName
     * @param mp
     * @return
     */
    public String links(String themeName, ModelMap mp) {
        mp.put("menu", getBlogMenu(themeName, OlyWebConfigProetries.PAGE_LINKS));
        return getPrefix(themeName, "/links");
    }

    /**
     * 介绍页面
     * 
     * @param themeName
     * @param mp
     * @return
     */
    public String about(String themeName, ModelMap mp) {
        mp.put("menu", getBlogMenu(themeName, OlyWebConfigProetries.PAGE_ABOUT));
        return getPrefix(themeName, "/about");
    }

    /**
     * 排行页面
     * 
     * @param themeName
     * @param modelMap
     * @return
     */
    public String rank(String themeName, ModelMap modelMap) {
        modelMap.put("menu", getBlogMenu(themeName, OlyWebConfigProetries.PAGE_RANK));
        return getPrefix(themeName, "/rank");
    }

    /**
     * 时间线页面
     * 
     * @param themeName
     * @param modelMap
     * @param pageNum
     * @return
     */
    public String timeLine(String themeName, ModelMap modelMap, Integer pageNum, Integer pageSize) {
        modelMap.put("menu", getBlogMenu(themeName, OlyWebConfigProetries.PAGE_TIMELINE));
        modelMap.put("timeData", blogPostService.groupByTime(pageNum, pageSize, themeName));
        return getPrefix(themeName, "/timeLine");
    }

    /**
     * 反馈页面
     * 
     * @param themeName
     * @param mp
     * @return
     */
    public String contact(String themeName, ModelMap mp) {
        mp.put("menu", getBlogMenu(themeName, OlyWebConfigProetries.PAGE_CATEGORY));
        return getPrefix(themeName, "/contact");
    }

}
