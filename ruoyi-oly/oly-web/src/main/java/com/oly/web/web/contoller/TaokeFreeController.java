package com.oly.web.web.contoller;

import com.oly.web.model.parm.TaokeParm;
import com.oly.web.web.CommonController;
import com.oly.web.web.service.TaoPageService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/ztaoke")
public class TaokeFreeController extends CommonController {
  
    @Autowired
    private TaoPageService taoPageService;
    /**
     * 淘客主页
     * 
     * @param mp
     * @return
     */
    @GetMapping(value = {"/{themeName}", "/{themeName}/index" })
    public String indexTaoKe(@PathVariable(name="themeName",required = true)String themeName,ModelMap mp) {
      return taoPageService.indexTaoKe(themeName, mp);
    }

    /**
     * 商品搜索主页
     * 
     * @param mp
     * @param taokeParm
     * @return
     */
    @GetMapping("/{themeName}/shop")
    public String shop(@PathVariable(name="themeName",required = true)String themeName,ModelMap mp, TaokeParm taokeParm) {
        return taoPageService.shop(themeName, mp, taokeParm);
    }

    /**
     * 福利文章页
     * 
     * @param catId
     * @param tagId
     * @param mp
     * @return
     */
    @GetMapping(value = { "/{themeName}/weal", "/{themeName}/weal/category/{catId}", "/{themeName}/weal/ticket/{tagId}" })
    public String weal(@PathVariable(name="themeName",required = true)String themeName,@PathVariable(required = false, name = "catId") Long catId,
            @PathVariable(required = false, name = "tagId") Long tagId, ModelMap mp) {
                return taoPageService.weal(themeName, catId, tagId, mp);
    }

    /**
     * 获取福利文章教程
     * 
     * @param articleId
     * @param mp
     * @return
     */
    @GetMapping("/{themeName}/weal/post/{articleId}")
    public String wealPost(@PathVariable(name="themeName",required = true)String themeName,@PathVariable("articleId") long articleId, ModelMap mp) {
    return taoPageService.wealPost(themeName, articleId, mp);
    }

    /**
     * @param mp
     * @return
     */
    @GetMapping("/{themeName}/callMe")
    public String callMe(@PathVariable(name="themeName",required = true)String themeName,ModelMap mp) {
        return taoPageService.callMe(themeName, mp);
    }

    /**
     * @param mp
     * @return
     */
    @GetMapping("/{themeName}/rank")
    public String rank(@PathVariable(name="themeName",required = true)String themeName,ModelMap mp) {
        return taoPageService.rank(themeName, mp);
    }

}
