package com.oly.web.web.service;

import java.util.List;

import com.oly.common.constant.OlySystemConstant;
import com.oly.common.model.properties.OlyWebConfigProetries;
import com.oly.common.model.support.PageData;
import com.oly.web.model.TaokeModel;
import com.oly.web.model.pam.BlogArticleSearchParam;
import com.oly.web.model.parm.TaokeParm;
import com.oly.web.model.po.BlogArticle;
import com.oly.web.service.cache.BlogArticleCacheService;
import com.oly.web.service.cache.BlogCategoryCacheService;
import com.oly.web.service.cache.BlogTagCacheService;
import com.oly.web.service.impl.TaokeServiceImpl;
import com.oly.web.web.CommonController;
import com.ruoyi.common.utils.StringUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

@Service
public class TaoPageService extends CommonController {

    @Autowired
    private BlogCategoryCacheService blogCatService;

    @Autowired
    private BlogTagCacheService blogTagService;

    @Autowired
    private BlogArticleCacheService blogPostService;

    @Autowired
    private TaokeServiceImpl taoKeService;

    public String indexTaoKe(String themeName, ModelMap mp) {
        mp.put("seo", getBlogMenu(themeName, OlyWebConfigProetries.PAGE_TAO_INDEX));
        return getPrefix(themeName, "/tao/index");
    }

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
        return getPrefix(themeName, "/tao/shop");
    }

    public String weal(String themeName, Long catId, Long tagId, ModelMap mp) {
        // 福利列表 文章列表
        BlogArticleSearchParam bl = new BlogArticleSearchParam();
        bl.setArticleType(OlySystemConstant.TAO_KE_POST_WEAL_TYPE);
        if (catId != null) {
            bl.setCatId(catId);
            mp.put("seo", blogCatService.getBlogCatByCatId(catId));
        } else if (tagId != null) {
            bl.setTagId(tagId);
            mp.put("seo", blogTagService.getBlogTagByTagId(tagId));
        } else {
            mp.put("seo", getBlogMenu(themeName, OlyWebConfigProetries.PAGE_TAO_WEAL));

        }
        startDefaultPage();
        List<BlogArticle> list = blogPostService.listBlogArticles(bl,themeName);
        // 封装分页
        PageData pageOne = PageData.getData(list);
        mp.put("wealPosts", pageOne);

        return getPrefix(themeName, "/tao/weal");
    }

    public String wealPost(String themeName, long articleId, ModelMap mp) {
        mp.put("wealPost", blogPostService.getBlogArticleHtmlById(articleId));
        return getPrefix(themeName, "/tao/wealPost");
    }

    public String callMe(String themeName, ModelMap mp) {
        mp.put("seo", getBlogMenu(themeName, OlyWebConfigProetries.PAGE_TAO_ABOUT));
        return getPrefix(themeName, "/tao/callMe");
    }

    public String rank(String themeName, ModelMap mp) {
        mp.put("seo", getBlogMenu(themeName, OlyWebConfigProetries.PAGE_TAO_RANK));
        return getPrefix(themeName, "/tao/rank");
    }

}
