package com.oly.web.web.service;

import java.util.List;

import com.github.pagehelper.PageHelper;
import com.oly.common.constant.OlySystemConstant;
import com.oly.common.model.properties.OlyCmsConfigPropetries;
import com.oly.common.model.properties.OlyThemeProperties;
import com.oly.common.model.properties.OlyWebConfigProetries;
import com.oly.common.model.support.PageData;
import com.oly.framework.web.service.OlyCommonService;
import com.oly.web.model.TaokeModel;
import com.oly.web.model.pam.BlogArticleSearchParam;
import com.oly.web.model.parm.TaokeParm;
import com.oly.web.model.po.BlogArticle;
import com.oly.web.service.impl.BlogServiceImpl;
import com.oly.web.service.impl.TaokeServiceImpl;
import com.oly.web.web.CommonController;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.service.impl.SysConfigServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

@Service
public class TaoPageService extends CommonController {

    @Autowired
    private BlogServiceImpl blogService;
    @Autowired
    private TaokeServiceImpl taoKeService;
    @Autowired
    private SysConfigServiceImpl configService;
    @Autowired
    private OlyCommonService commonService;

    public String indexTaoKe(String themeName,ModelMap mp) {
        mp.put("seo", blogService.getBlogMenuById(
                Long.parseLong(commonService.selectConfigDefauleValue(OlyWebConfigProetries.PAGE_TAO_INDEX))));
        return getPrefix(themeName, "/tao/index");
    }

   
    public String shop(String themeName,ModelMap mp, TaokeParm taokeParm) {
        String pam = "?";
        if (taokeParm.getCatId() != null) {
            pam = pam + "catId=" + taokeParm.getCatId();
            mp.put("seo", blogService.getBlogCatByCatId(taokeParm.getCatId()));

        } else if (taokeParm.getTagId() != null) {
            pam = pam + "tagId=" + taokeParm.getTagId();
            mp.put("seo", blogService.getBlogTagByTagId(taokeParm.getTagId()));

        } else {
            pam = pam + "s=1";
            mp.put("seo", blogService.getBlogMenuById(
                    Long.parseLong(commonService.selectConfigDefauleValue(OlyWebConfigProetries.PAGE_TAO_SHOP))));
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


    public String weal(String themeName,Long catId,Long tagId, ModelMap mp) {
        // 福利列表 文章列表
        BlogArticleSearchParam bl = new BlogArticleSearchParam();
        bl.setArticleType(OlySystemConstant.TAO_KE_POST_WEAL_TYPE);
        if (catId != null) {
            bl.setCatId(catId);
            mp.put("seo", blogService.getBlogCatByCatId(catId));
        } else if (tagId != null) {
            bl.setTagId(tagId);
            mp.put("seo", blogService.getBlogTagByTagId(tagId));
        } else {
            mp.put("seo", blogService.getBlogMenuById(
                    Long.parseLong(commonService.selectConfigDefauleValue(OlyWebConfigProetries.PAGE_TAO_WEAL))));

        }
        startDefaultPage();
        List<BlogArticle> list = blogService.listBlogArticles(bl);
        // 封装分页
        PageData pageOne = PageData.getData(list);
        mp.put("wealPosts", pageOne);

        return getPrefix(themeName, "/tao/weal");
    }

  
    public String wealPost(String themeName,long articleId, ModelMap mp) {
        BlogArticle blogArticle = new BlogArticle();
        blogArticle.setArticleId(articleId);
        blogArticle.setArticleType(OlySystemConstant.TAO_KE_POST_WEAL_TYPE);
        mp.put("wealPost", blogService.getBlogArticle(blogArticle));
        // 福利列表 文章列表
        BlogArticleSearchParam bl = new BlogArticleSearchParam();
        bl.setArticleType(OlySystemConstant.TAO_KE_POST_WEAL_TYPE);
        /* 获取最近发布 */
        PageHelper.startPage(1, 10, "create_time desc");
        mp.put("wealPostRecently", blogService.listBlogArticles(bl));
        /* 推荐推荐福利 */
        PageHelper.startPage(1, 10, "article_top desc");
        mp.put("wealPostTop", blogService.listBlogArticles(bl));
        blogService.listBlogArticles(bl);
        return getPrefix(themeName, "/tao/wealPost");
    }

  
    public String callMe(String themeName,ModelMap mp) {
        mp.put("seo", blogService.getBlogMenuById(
                Long.parseLong(commonService.selectConfigDefauleValue(OlyWebConfigProetries.PAGE_TAO_ABOUT))));
        return getPrefix(themeName, "/tao/callMe");
    }

  
    public String rank(String themeName,ModelMap mp) {
        mp.put("seo", blogService.getBlogMenuById(
                Long.parseLong(commonService.selectConfigDefauleValue(OlyWebConfigProetries.PAGE_TAO_RANK))));
        return getPrefix(themeName, "/tao/rank");
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
