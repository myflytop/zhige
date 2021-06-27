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
@RequestMapping("/taoke")
public class TaokeController extends CommonController {

    private static final String themeName = null;
    @Autowired
    private TaoPageService taoPageService;

    /**
     * 淘客主页
     * 
     * @param mp
     * @return
     */
    @GetMapping(value = { "", "/index", "/" })
    public String indexTaoKe(ModelMap mp) {

        return taoPageService.indexTaoKe(themeName, mp);
    }

    /**
     * 商品搜索主页
     * 
     * @param mp
     * @param taokeParm
     * @return
     */
    @GetMapping("/shop")
    public String shop(ModelMap mp, TaokeParm taokeParm) {

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
    @GetMapping(value = { "/weal", "/weal/category/{catId}", "/weal/ticket/{tagId}" })
    public String weal(@PathVariable(required = false, name = "catId") Long catId,
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
    @GetMapping("/weal/post/{articleId}")
    public String wealPost(@PathVariable("articleId") long articleId, ModelMap mp) {

        return taoPageService.wealPost(themeName, articleId, mp);
    }

    /**
     * @param mp
     * @return
     */
    @GetMapping("/callMe")
    public String callMe(ModelMap mp) {
        return taoPageService.callMe(themeName, mp);
    }

    /**
     * @param mp
     * @return
     */
    @GetMapping("/rank")
    public String rank(ModelMap mp) {

        return taoPageService.rank(themeName, mp);
    }

}
