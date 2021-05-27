package com.oly.web.web.contoller;

import com.oly.web.annotation.BlogLog;
import com.oly.web.model.po.BlogCat;
import com.oly.web.model.po.BlogTag;
import com.oly.web.web.CommonController;
import com.oly.web.web.service.WebPageService;

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
    private WebPageService webPageService;

    private static final String themeName=null;

    /**
     * 内容主页
     * 
     * @param mp
     * @return
     */
    @BlogLog(title = "主页请求")
    @GetMapping(value = { "", "/", "/index" })
    public String index(ModelMap mp) {
 
       return webPageService.index(themeName, mp);
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
       return webPageService.post(themeName, postId, mp);
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
       return webPageService.tags(themeName, tag, mp);
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
        return webPageService.tag(themeName, tagId, mp);
    }

    /**
     * 请求文章分类
     * 
     * @param cat
     * @param mp
     * @return
     */
    @GetMapping("/cat")
    public String cats(BlogCat cat, ModelMap mp) {
        return webPageService.cats(themeName, cat, mp);

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
        return webPageService.cat(themeName, catId, mp);
    }

    /**
     * 请求链接
     * 
     * @param mp
     * @return
     */
    @GetMapping("/links")
    public String links(ModelMap mp) {
        return webPageService.links(themeName, mp);
    }

    /**
     * 获取关于本站
     * 
     * @param mp
     * @return
     */
    @GetMapping("/about")
    public String about(ModelMap mp) {
        return webPageService.about(themeName, mp);
    }

    /**
     * 各种排行
     * 
     * @param modelMap
     * @return
     */
    @GetMapping("/rank")
    public String rank(ModelMap modelMap) {
        return webPageService.rank(themeName, modelMap);
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
        return webPageService.timeLine(themeName, modelMap, pageNum);
    }

    /**
     * 反馈联系
     * @param mp
     * @return
     */
    @GetMapping("/contact")
    public String contact(ModelMap mp) {
        return webPageService.contact(themeName, mp);
    }

   
}
