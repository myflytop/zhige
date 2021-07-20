package com.oly.web.web.contoller;

import javax.servlet.http.HttpServletResponse;

import com.oly.web.annotation.BlogLog;
import com.oly.web.model.pam.BlogArticleSearchParam;
import com.oly.web.model.parm.TaokeParm;
import com.oly.web.model.po.BlogCat;
import com.oly.web.model.po.BlogTag;
import com.oly.web.web.service.WebPageService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = { "/", "/zweb" })
public class WebPageController {
    @Autowired
    private WebPageService webPageService;

    /**
     * 内容主页
     * 
     * @param mp
     * @return
     */
    @BlogLog(title = "主页请求")
    @GetMapping(value = { "/", "/{themeName}/index" })
    public String index(@PathVariable(name = "themeName", required = false) String themeName, ModelMap mp) {

        return webPageService.index(themeName, mp);
    }

    /**
     * 请求指定文章
     * 
     * @param postId
     * @param mp
     * @return
     */
    @GetMapping(value = { "/post/{postId}", "/{themeName}/post/{postId}" })
    public String post(@PathVariable(name = "postId", required = false) Long postId,
            @PathVariable(name = "themeName", required = false) String themeName, ModelMap mp) {
        return webPageService.post(themeName, postId, mp);
    }

    /**
     * 
     * @param themeName
     * @param mp
     * @param parm
     * @return
     */
    @GetMapping(value = { "/posts", "/{themeName}/posts" })
    public String posts(@PathVariable(name = "themeName", required = false) String themeName, ModelMap mp,
            BlogArticleSearchParam parm) {
        return webPageService.posts(themeName, mp, parm);
    }

    /**
     * 请求商品
     * 
     * @param themeName
     * @param mp
     * @param parm
     * @return
     */
    @GetMapping(value = { "/shops", "/{themeName}/shops" })
    public String shops(@PathVariable(name = "themeName", required = false) String themeName, ModelMap mp,
            TaokeParm parm) {
        return webPageService.shops(themeName, mp, parm);
    }

    /**
     * 请求指定文章
     * 
     * @param postId
     * @param mp
     * @return
     */
    @GetMapping(value = { "/shop/{shopId}", "/{themeName}/shop/{shopId}" })
    public String shop(@PathVariable(name = "shopId", required = false) String shopId,
            @PathVariable(name = "themeName", required = false) String themeName, ModelMap mp) {
        return webPageService.shop(themeName, mp, shopId);
    }

    /**
     * 文章标签
     * 
     * @param tag
     * @param mp
     * @return
     */
    @GetMapping(value = { "/tag", "/{themeName}/tag" })
    public String tags(@PathVariable(name = "themeName", required = false) String themeName, BlogTag tag, ModelMap mp) {
        return webPageService.tags(themeName, tag, mp);
    }

    /**
     * 文章标签
     * 
     * @param tagId
     * @param mp
     * @return
     */
    @GetMapping(value = { "/tag/{tagId}", "/{themeName}/tag/{tagId}" })
    public String tag(@PathVariable(name = "themeName", required = false) String themeName,
            @PathVariable("tagId") Long tagId, ModelMap mp) {
        return webPageService.tag(themeName, tagId, mp);
    }

    /**
     * 请求文章分类
     * 
     * @param cat
     * @param mp
     * @return
     */
    @GetMapping(value = { "/cat", "/{themeName}/cat" })
    public String cats(@PathVariable(name = "themeName", required = false) String themeName, BlogCat cat, ModelMap mp) {
        return webPageService.cats(themeName, cat, mp);

    }

    /**
     * 请求文章分类
     * 
     * @param catId
     * @param mp
     * @return
     */
    @GetMapping(value = { "/cat/{catId}", "/{themeName}/cat/{catId}" })
    public String cat(@PathVariable(name = "themeName", required = false) String themeName,
            @PathVariable("catId") Long catId, ModelMap mp) {
        return webPageService.cat(themeName, catId, mp);
    }

    /**
     * 请求链接
     * 
     * @param mp
     * @return
     */
    @GetMapping(value = { "/links", "/{themeName}/links" })
    public String links(@PathVariable(name = "themeName", required = false) String themeName, ModelMap mp) {
        return webPageService.links(themeName, mp);
    }

    /**
     * 获取关于本站
     * 
     * @param mp
     * @return
     */
    @GetMapping(value = { "/about", "/{themeName}/about" })
    public String about(@PathVariable(name = "themeName", required = false) String themeName, ModelMap mp) {
        return webPageService.about(themeName, mp);
    }

    /**
     * 各种排行
     * 
     * @param modelMap
     * @return
     */
    @GetMapping(value = { "/rank", "/{themeName}/rank" })
    public String rank(@PathVariable(name = "themeName", required = false) String themeName, ModelMap modelMap) {
        return webPageService.rank(themeName, modelMap);
    }

    /**
     * 时间线
     * 
     * @param modelMap
     * @param pageNum
     * @return
     */
    @GetMapping(value = { "/timeLine", "/{themeName}/timeLine" })
    public String timeLine(@PathVariable(name = "themeName", required = false) String themeName, ModelMap modelMap,
            @RequestParam(defaultValue = "1") int pageNum, @RequestParam(defaultValue = "20") int pageSize) {
        return webPageService.timeLine(themeName, modelMap, pageNum, pageSize);
    }

    /**
     * 反馈联系
     * 
     * @param mp
     * @return
     */
    @GetMapping(value = { "/contact", "/{themeName}/contact" })
    public String contact(@PathVariable(name = "themeName", required = false) String themeName, ModelMap mp) {
        return webPageService.contact(themeName, mp);
    }

    @GetMapping(value = { "/robots.txt", "/{themeName}/robotx.txt" })
    public void robots(@PathVariable(name = "themeName", required = false) String themeName,
            HttpServletResponse response) {
        webPageService.robots(themeName, response);
    }

    /**
     * 自定义页面
     * 
     * @param page
     * @return
     */
    @GetMapping(value = { "/fr", "/{themeName}/fr" })
    public String freePage(@PathVariable(name = "themeName", required = false) String themeName, ModelMap mp,
            @PathVariable("page") String page) {
        return webPageService.fr(themeName, mp, page);
    }

}
