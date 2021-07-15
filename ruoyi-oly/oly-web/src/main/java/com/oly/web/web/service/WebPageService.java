package com.oly.web.web.service;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.oly.common.model.properties.OlyWebConfigProetries;
import com.oly.common.model.support.PageData;
import com.oly.web.model.TaokeModel;
import com.oly.web.model.pam.BlogArticleSearchParam;
import com.oly.web.model.parm.TaokeParm;
import com.oly.web.model.po.BlogArticle;
import com.oly.web.model.po.BlogCat;
import com.oly.web.model.po.BlogTag;
import com.oly.web.service.cache.BlogArticleCacheService;
import com.oly.web.service.cache.BlogCategoryCacheService;
import com.oly.web.service.cache.BlogTagCacheService;
import com.oly.web.service.impl.TaokeServiceImpl;
import com.oly.web.web.CommonController;
import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.enums.OlyStageRoot;
import com.ruoyi.common.utils.ServletUtils;
import com.ruoyi.common.utils.StringUtils;

import org.apache.commons.lang3.ArrayUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;

@Service
public class WebPageService extends CommonController {
    private static final Logger log = LoggerFactory.getLogger(WebPageService.class);
    @Autowired
    private BlogCategoryCacheService blogCatService;
    @Autowired
    private BlogTagCacheService blogTagService;
    @Autowired
    private BlogArticleCacheService blogPostService;
    @Autowired
    private TaokeServiceImpl taoKeService;

    /**
     * 主页
     * 
     * @param themeName
     * @param mp
     * @return
     */
    public String index(String themeName, ModelMap mp) {
        mp.put("menu", getBlogMenu(themeName, OlyWebConfigProetries.PAGE_INDEX));
        setParams(mp);
        return getPrefix(themeName, "/pages/web/index");
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
        setParams(mp);
        return getPrefix(themeName, "/pages/web/post");
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
        setParams(mp);
        return getPrefix(themeName, "/pages/web/search");
    }

    /**
     * 商品页
     * 
     * @param themeName
     * @param mp
     * @param taokeParm
     * @return
     */
    public String shop(String themeName, ModelMap mp, TaokeParm taokeParm) {
        String pam = "?";
        if (taokeParm.getCatId() != null) {
            pam = pam + "catId=" + taokeParm.getCatId();
            mp.put("seo", blogCatService.getBlogCatByCatId(taokeParm.getCatId()));

        } else if (taokeParm.getTagId() != null) {
            pam = pam + "tagId=" + taokeParm.getTagId();
            mp.put("seo", blogTagService.getBlogTagByTagId(taokeParm.getTagId()));

        } else {
            pam = pam + "s=1";
            mp.put("seo", getBlogMenu(themeName, OlyWebConfigProetries.PAGE_TAO_SHOP));
        }
        // 分页
        if (StringUtils.isNotEmpty(taokeParm.getOrderByColumn()) && StringUtils.isNotEmpty(taokeParm.getIsAsc())) {
            pam = pam + "&orderByColumn=" + taokeParm.getOrderByColumn() + "&isAsc=" + taokeParm.getIsAsc();
        }
        startDefaultPage();
        List<TaokeModel> list = taoKeService.listTaokeByTaoKe(taokeParm);
        // 封装分页
        PageData pageOne = PageData.getData(list);
        mp.put("pages", pageOne);
        mp.put("pam", pam);
        setParams(mp);
        return getPrefix(themeName, "/pages/web/shop");
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
        setParams(mp);
        return getPrefix(themeName, "/pages/web/tags");
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
        setParams(mp);
        return getPrefix(themeName, "/pages/web/tag");
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
        setParams(mp);
        return getPrefix(themeName, "/pages/web/categories");
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
        setParams(mp);
        return getPrefix(themeName, "/pages/web/category");
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
        setParams(mp);
        return getPrefix(themeName, "/pages/web/links");
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
        setParams(mp);
        return getPrefix(themeName, "/pages/web/about");
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
        setParams(modelMap);
        return getPrefix(themeName, "/pages/web/rank");
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
        setParams(modelMap);
        return getPrefix(themeName, "/pages/web/timeLine");
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
        setParams(mp);
        return getPrefix(themeName, "/pages/web/contact");
    }

    public String fr(String themeName, ModelMap mp, String page) {
        setParams(mp);
        return getPrefix(themeName, "/pages/fr/" + page);
    }

    private void setParams(ModelMap mp) {

        mp.putAll(ServletUtils.getRequest().getParameterMap());
    }

    public void robots(String themeName, HttpServletResponse response) {
        File file = Paths
                .get(RuoYiConfig.getWorkPath(), OlyStageRoot.THEME_DIR.getDir(), getPrefix(themeName, ""), "robots.txt")
                .toFile();
        BufferedReader reader = null;
        if (!file.exists()) {
            try {
                response.getWriter().println();
            } catch (IOException e) {
                log.error(e.getMessage());
            }
        } else {
            try {
                StringBuffer sbf = new StringBuffer();
                reader = new BufferedReader(new FileReader(file));
                String tempStr;
                while ((tempStr = reader.readLine()) != null) {
                    sbf.append(tempStr).append("\n");
                }
                reader.close();
                response.getWriter().println(sbf.toString());
            } catch (IOException e) {
                log.error(e.getMessage());
            } finally {
                if (reader != null) {
                    try {
                        reader.close();
                    } catch (IOException e1) {
                        log.error(e1.getMessage());
                    }
                }
            }
        }
    }
}
