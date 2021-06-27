package com.oly.web.web.contoller;

import com.oly.web.annotation.BlogLog;
import com.oly.web.model.pam.BlogArticleSearchParam;
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

/**支持访问任意主题 */
@Controller
@RequestMapping("/zblog")
public class BlogFreeController extends CommonController {

    @Autowired
    private WebPageService webPageService;

    /**
     * 内容主页
     * 
     * @param mp
     * @return
     */
    @BlogLog(title = "主页请求")
    @GetMapping(value = {"/{themeName}", "/{themeName}/index" })
    public String index(@PathVariable(name="themeName",required = true)String themeName,ModelMap mp) {
      
        return webPageService.index(themeName, mp);
    }

    /**
     * 请求指定文章
     * 
     * @param postId
     * @param mp
     * @return
     */
    @GetMapping("/{themeName}/post/{postId}")
    public String post(@PathVariable(name="themeName",required = true)String themeName,@PathVariable("postId") Long postId, ModelMap mp) {
      
        return webPageService.post(themeName, postId, mp);
    }

    /**
     * 文章标签
     * 
     * @param tag
     * @param mp
     * @return
     */
    @GetMapping("/{themeName}/tag")
    public String tags(@PathVariable(name="themeName",required = true)String themeName,BlogTag tag, ModelMap mp) {
       
        return webPageService.tags(themeName, tag, mp);
    }
    @GetMapping("/{themeName}/search")
    public String search(String themeName,ModelMap mp,BlogArticleSearchParam parm){
    
        return webPageService.search(themeName,mp,parm);
    }
    /**
     * 文章标签
     * 
     * @param tagId
     * @param mp
     * @return
     */
    @GetMapping("/{themeName}/tag/{tagId}")
    public String tag(@PathVariable(name="themeName",required = true)String themeName,@PathVariable("tagId") Long tagId, ModelMap mp) {
      
        return webPageService.tag(themeName, tagId, mp);
    }

    /**
     * 请求文章分类
     * 
     * @param cat
     * @param mp
     * @return
     */
    @GetMapping("/{themeName}/cat")
    public String cats(@PathVariable(name="themeName",required = true)String themeName,BlogCat cat, ModelMap mp) {
     
        return webPageService.cats(themeName, cat, mp);

    }

    /**
     * 请求文章分类
     * 
     * @param catId
     * @param mp
     * @return
     */
    @GetMapping("/{themeName}/cat/{catId}")
    public String cat(@PathVariable(name="themeName",required = true)String themeName,@PathVariable("catId") Long catId, ModelMap mp) {
        
        return webPageService.cat(themeName, catId, mp);
    }

    /**
     * 请求链接
     * 
     * @param mp
     * @return
     */
    @GetMapping("/{themeName}/links")
    public String links(@PathVariable(name="themeName",required = true)String themeName,ModelMap mp) {
     
        return webPageService.links(themeName, mp);
    }

    /**
     * 获取关于本站
     * 
     * @param mp
     * @return
     */
    @GetMapping("/{themeName}/about")
    public String about(@PathVariable(name="themeName",required = true)String themeName,ModelMap mp) {
     
        return webPageService.about(themeName, mp);
    }

    /**
     * 各种排行
     * 
     * @param modelMap
     * @return
     */
    @GetMapping("/{themeName}/rank")
    public String rank(@PathVariable(name="themeName",required = true)String themeName,ModelMap modelMap) {
        return webPageService.rank(themeName, modelMap);
    }

    /**
     * 时间线
     * 
     * @param modelMap
     * @param pageNum
     * @return
     */
    @GetMapping("/{themeName}/timeLine")
    public String timeLine(@PathVariable(name="themeName",required = true)String themeName,ModelMap modelMap, @RequestParam(defaultValue = "1") int pageNum,@RequestParam(defaultValue = "20") int pageSize) {
        
        return webPageService.timeLine(themeName, modelMap, pageNum,pageNum);
    }

    /**
     * 反馈联系
     * @param mp
     * @return
     */
    @GetMapping("/{themeName}/contact")
    public String contact(@PathVariable(name="themeName",required = true)String themeName,ModelMap mp) {
       
        return webPageService.contact(themeName, mp);
    }

}
