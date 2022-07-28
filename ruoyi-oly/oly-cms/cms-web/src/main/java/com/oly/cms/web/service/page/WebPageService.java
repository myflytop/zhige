package com.oly.cms.web.service.page;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import com.oly.cms.common.domain.entity.CmsCat;
import com.oly.cms.common.domain.entity.CmsTag;
import com.oly.cms.common.model.properties.OlyWebConfigProperties;
import com.oly.cms.common.model.support.PageData;
import com.oly.cms.general.model.param.WebArticleSearchParam;
import com.oly.cms.general.model.po.WebArticle;
import com.oly.cms.general.service.cache.GeneralArticleCacheService;
import com.oly.cms.general.service.cache.GeneralCategoryCacheService;
import com.oly.cms.general.service.cache.GeneralTagCacheService;
import com.oly.cms.web.controller.CommonController;
import com.ruoyi.common.enums.OlyStageRoot;
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
    private GeneralCategoryCacheService cmsCatService;
    @Autowired
    private GeneralTagCacheService cmsTagService;
    @Autowired
    private GeneralArticleCacheService webPostService;

    /**
     * 主页
     * 
     * @param themeName
     * @param mp
     * @return
     */
    public String index(String themeName, ModelMap mp) {
        mp.put("menu", getCmsColumn(themeName, OlyWebConfigProperties.PAGE_INDEX));
        return getPrefix(themeName, "/pages/web/index", mp);
    }

    /**
     * 文章列表
     * 
     * @param themeName
     * @param mp
     * @param parm
     * @return
     */
    public String posts(String themeName, ModelMap mp, WebArticleSearchParam parm) {
        mp.put("menu", getCmsColumn(themeName, OlyWebConfigProperties.PAGE_POSTS));
        parm.setThemeName(getThemeName(themeName));
        List<WebArticle> list = new ArrayList<>();
        startDefaultPage();
        list = webPostService.listWebArticles(parm);
        PageData pageOne = PageData.getData(list);
        mp.put("posts", pageOne);
        return getPrefix(themeName, "/pages/web/posts", mp);
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
        return getPrefix(themeName, "/pages/web/post", mp);
    }

    /**
     * 获取标签列表
     *
     * @param themeName
     * @param tag
     * @param mp
     * @return
     */
    public String tags(String themeName, CmsTag tag, ModelMap mp) {
        tag.setSearchValue(getThemeName(themeName));
        mp.put("menu", getCmsColumn(themeName, OlyWebConfigProperties.PAGE_TAG));
        mp.put("tags", cmsTagService.listCmsTags(tag));
        return getPrefix(themeName, "/pages/web/tags", mp);
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
        CmsTag tag = cmsTagService.getCmsTagByTagId(tagId);
        PageData pageOne = null;
        if (tag != null) {
            String[] types = StringUtils.split(getSupportType(themeName, OlyWebConfigProperties.ARTICLE_TYPES), ",");
            if (StringUtils.isEmpty(types) || ArrayUtils.contains(types, tag.getTagType().toString())) {
                WebArticleSearchParam bl = new WebArticleSearchParam();
                bl.setTagId(tagId);
                bl.setThemeName(themeName);
                List<WebArticle> list = new ArrayList<>();
                startDefaultPage();
                list = webPostService.listWebArticles(bl);
                pageOne = PageData.getData(list);
            }
        }
        // 当前查询的标签
        mp.put("tag", tag);
        mp.put("posts", pageOne);
        return getPrefix(themeName, "/pages/web/tag", mp);
    }

    /**
     * 获取主题支持的分类
     *
     * @param themeName
     * @param cat
     * @param mp
     * @return
     */
    public String cats(String themeName, CmsCat cat, ModelMap mp) {
        cat.setSearchValue(getThemeName(themeName));
        mp.put("menu", getCmsColumn(themeName, OlyWebConfigProperties.PAGE_CATEGORY));
        mp.put("cats", cmsCatService.listCmsCats(cat));
        return getPrefix(themeName, "/pages/web/categories", mp);
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
        CmsCat cat = cmsCatService.getCmsCatByCatId(catId);
        PageData pageOne = null;
        if (cat != null) {
            String[] types = StringUtils.split(getSupportType(themeName, OlyWebConfigProperties.ARTICLE_TYPES), ",");
            if (StringUtils.isEmpty(types) || ArrayUtils.contains(types, cat.getCatType().toString())) {
                WebArticleSearchParam bl = new WebArticleSearchParam();
                bl.setCatId(catId);
                bl.setThemeName(themeName);
                List<WebArticle> list = new ArrayList<>();
                startDefaultPage();
                list = webPostService.listWebArticles(bl);
                pageOne = PageData.getData(list);
            }
        }
        // 当前查询的分类
        mp.put("cat", cat);
        mp.put("posts", pageOne);

        return getPrefix(themeName, "/pages/web/category", mp);
    }

    /**
     * 获取链接列表
     *
     * @param themeName
     * @param mp
     * @return
     */
    public String links(String themeName, ModelMap mp) {
        mp.put("menu", getCmsColumn(themeName, OlyWebConfigProperties.PAGE_LINKS));
        return getPrefix(themeName, "/pages/web/links", mp);
    }

    /**
     * 介绍页面
     * 
     * @param themeName
     * @param mp
     * @return
     */
    public String about(String themeName, ModelMap mp) {
        mp.put("menu", getCmsColumn(themeName, OlyWebConfigProperties.PAGE_ABOUT));
        return getPrefix(themeName, "/pages/web/about", mp);
    }

    /**
     * 排行页面
     * 
     * @param themeName
     * @param mp
     * @return
     */
    public String rank(String themeName, ModelMap mp) {
        mp.put("menu", getCmsColumn(themeName, OlyWebConfigProperties.PAGE_RANK));
        return getPrefix(themeName, "/pages/web/rank", mp);
    }

    /**
     * 时间线页面
     * 
     * @param themeName
     * @param mp
     * @param pageNum
     * @return
     */
    public String timeLine(String themeName, ModelMap mp, Integer pageNum, Integer pageSize) {
        mp.put("menu", getCmsColumn(themeName, OlyWebConfigProperties.PAGE_TIMELINE));
        mp.put("timeData", webPostService.groupByTime(pageNum, pageSize, themeName));
        return getPrefix(themeName, "/pages/web/timeLine", mp);
    }

    /**
     * 反馈页面
     * 
     * @param themeName
     * @param mp
     * @return
     */
    public String contact(String themeName, ModelMap mp) {
        mp.put("menu", getCmsColumn(themeName, OlyWebConfigProperties.PAGE_INTRODUCE));
        return getPrefix(themeName, "/pages/web/contact", mp);
    }

    /**
     * 自定义页面
     * 
     * @param themeName
     * @param mp
     * @param page
     * @return
     */
    public String fr(String themeName, ModelMap mp, String page) {
        return getPrefix(themeName, "/pages/fr/" + page, mp);
    }

    public void robots(String themeName, HttpServletResponse response, ModelMap mp) {
        File file = Paths.get(OlyStageRoot.THEME_DIR.getRoot(""), getPrefix(themeName, "", mp), "robots.txt").toFile();
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
