package com.oly.cms.web.controller.page;

import javax.servlet.http.HttpServletResponse;

import com.oly.cms.common.domain.entity.CmsCat;
import com.oly.cms.common.domain.entity.CmsTag;
import com.oly.cms.general.annotation.WebLog;
import com.oly.cms.general.model.enums.WebLogType;
import com.oly.cms.general.model.param.WebArticleSearchParam;
import com.oly.cms.web.service.page.WebPageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/")
public class WebPageController {
    @Autowired
    private WebPageService webPageService;

    /**
     * 内容主页
     * 
     * @param mp
     * @return
     */
    @WebLog(title = "主页请求", logType = WebLogType.PAGE)
    @GetMapping(value = { "/", "/index", "/{themeName}/index" })
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
    @WebLog(title = "获取文章", logType = WebLogType.PAGE)
    @GetMapping(value = { "/post/{postId}", "/{themeName}/post/{postId}" })
    public String post(@PathVariable(name = "postId") Long postId,
            @PathVariable(name = "themeName", required = false) String themeName, ModelMap mp) {
        return webPageService.post(themeName, postId, mp);
    }

    /**
     * 文章列表
     * 
     * @param themeName
     * @param mp
     * @param parm
     * @return
     */
    @WebLog(title = "获取文章列表", logType = WebLogType.PAGE)
    @GetMapping(value = { "/post", "/{themeName}/post" })
    public String posts(@PathVariable(name = "themeName", required = false) String themeName, ModelMap mp,
            WebArticleSearchParam parm) {
        return webPageService.posts(themeName, mp, parm);
    }

    /**
     * 标签列表
     * 
     * @param themeName
     * @param tag
     * @param mp
     * @return
     */
    @WebLog(title = "获取标签列表", logType = WebLogType.PAGE)
    @GetMapping(value = { "/tag", "/{themeName}/tag" })
    public String tags(@PathVariable(name = "themeName", required = false) String themeName, CmsTag tag, ModelMap mp) {
        return webPageService.tags(themeName, tag, mp);
    }

    /**
     * 标签信息
     * 
     * @param themeName
     * @param tagId
     * @param mp
     * @return
     */
    @WebLog(title = "获取标签", logType = WebLogType.PAGE)
    @GetMapping(value = { "/tag/{tagId}", "/{themeName}/tag/{tagId}" })
    public String tag(@PathVariable(name = "themeName", required = false) String themeName,
            @PathVariable("tagId") Long tagId, ModelMap mp) {
        return webPageService.tag(themeName, tagId, mp);
    }

    /**
     * 分类列表
     * 
     * @param themeName
     * @param cat
     * @param mp
     * @return
     */
    @WebLog(title = "获取分类列表", logType = WebLogType.PAGE)
    @GetMapping(value = { "/category", "/{themeName}/category" })
    public String cats(@PathVariable(name = "themeName", required = false) String themeName, CmsCat cat, ModelMap mp) {
        return webPageService.cats(themeName, cat, mp);

    }

    /**
     * 分类详情
     * 
     * @param themeName
     * @param catId
     * @param mp
     * @return
     */
    @WebLog(title = "获取分类", logType = WebLogType.PAGE)
    @GetMapping(value = { "/category/{catId}", "/{themeName}/category/{catId}" })
    public String cat(@PathVariable(name = "themeName", required = false) String themeName,
            @PathVariable("catId") Long catId, ModelMap mp) {
        return webPageService.cat(themeName, catId, mp);
    }

    /**
     * 友情链接
     * 
     * @param themeName
     * @param mp
     * @return
     */
    @WebLog(title = "友情链接", logType = WebLogType.PAGE)
    @GetMapping(value = { "/links", "/{themeName}/links" })
    public String links(@PathVariable(name = "themeName", required = false) String themeName, ModelMap mp) {
        return webPageService.links(themeName, mp);
    }

    /**
     * 关于本站
     * 
     * @param themeName
     * @param mp
     * @return
     */
    @WebLog(title = "关于本站", logType = WebLogType.PAGE)
    @GetMapping(value = { "/about", "/{themeName}/about" })
    public String about(@PathVariable(name = "themeName", required = false) String themeName, ModelMap mp) {
        return webPageService.about(themeName, mp);
    }

    /**
     * 排行榜
     * 
     * @param themeName
     * @param modelMap
     * @return
     */
    @WebLog(title = "排行榜", logType = WebLogType.PAGE)
    @GetMapping(value = { "/rank", "/{themeName}/rank" })
    public String rank(@PathVariable(name = "themeName", required = false) String themeName, ModelMap modelMap) {
        return webPageService.rank(themeName, modelMap);
    }

    /**
     * 时间线
     * 
     * @param themeName
     * @param modelMap
     * @param pageNum
     * @param pageSize
     * @return
     */
    @WebLog(title = "时间线", logType = WebLogType.PAGE)
    @GetMapping(value = { "/timeLine", "/{themeName}/timeLine" })
    public String timeLine(@PathVariable(name = "themeName", required = false) String themeName, ModelMap modelMap,
            @RequestParam(defaultValue = "1") int pageNum, @RequestParam(defaultValue = "20") int pageSize) {
        return webPageService.timeLine(themeName, modelMap, pageNum, pageSize);
    }

    /**
     * 反馈
     * 
     * @param themeName
     * @param mp
     * @return
     */
    @WebLog(title = "反馈", logType = WebLogType.PAGE)
    @GetMapping(value = { "/contact", "/{themeName}/contact" })
    public String contact(@PathVariable(name = "themeName", required = false) String themeName, ModelMap mp) {
        return webPageService.contact(themeName, mp);
    }

    /**
     * 联盟页面
     * 
     * @param themeName
     * @param mp
     * @return
     */
    @WebLog(title = "联盟页", logType = WebLogType.PAGE)
    @GetMapping(value = { "/union", "/{themeName}/union" })
    public String Union(@PathVariable(name = "themeName", required = false) String themeName, ModelMap mp) {
        return webPageService.union(themeName, mp);
    }

    /**
     * 自定义页面
     * 
     * @param page
     * @return
     */
    @WebLog(title = "自定义页面", logType = WebLogType.PAGE)
    @GetMapping(value = { "/custom/{page}", "/{themeName}/custom/{page}" })
    public String customPage(@PathVariable(name = "themeName", required = false) String themeName, ModelMap mp,
            @PathVariable("page") String page) {
        return webPageService.fr(themeName, mp, page);
    }

    @GetMapping(value = { "/robots.txt", "/{themeName}/robots.txt" })
    public void robots(@PathVariable(name = "themeName", required = false) String themeName,
            HttpServletResponse response, ModelMap mp) {
        webPageService.robots(themeName, response, mp);
    }

    @GetMapping(value = { "/sitemap.xml", "/{themeName}/sitemap.xml" })
    public void siteMapIndex(@PathVariable(name = "themeName", required = false) String themeName,
            HttpServletResponse response, ModelMap mp) {
        webPageService.siteMapIndex(themeName, response, mp);
    }

    @GetMapping(value = { "/site/{themeName}/{file:.+}" })
    public void siteMap(@PathVariable(name = "themeName") String themeName,
            @PathVariable(name = "file") String fileName,
            HttpServletResponse response, ModelMap mp) {
        webPageService.siteMap(themeName, fileName, response, mp);
    }

}
