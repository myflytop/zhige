package com.oly.web.web.api;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.oly.common.model.enums.OlyConfigCommonEnum;
import com.oly.common.model.support.PageData;
import com.oly.web.model.TaokeModel;
import com.oly.web.model.parm.TaokeParm;
import com.oly.web.service.impl.TaokeServiceImpl;
import com.oly.web.web.CommonController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.system.service.impl.SysConfigServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.thymeleaf.spring5.view.ThymeleafViewResolver;

@CrossOrigin
@RestController
@RequestMapping("/api/taoke")
public class TaoKeApiController extends CommonController {

    @Autowired
    private SysConfigServiceImpl sysConfigService;

    @Autowired
    private TaokeServiceImpl taokeService;

    @Autowired
    @Qualifier("thymeleafViewResolver")
    private ThymeleafViewResolver viewResolver;

    /**
     * 刷新淘客全局变量配置
     * 
     * @return
     */
    @GetMapping("/taokeConfigRefresh")
    public AjaxResult refreshConfig() {
        Map<String, Object> vars = new HashMap<>();
        vars.put("taoConfig", sysConfigService.selectConfigMap(OlyConfigCommonEnum.OLY_TAO_PREFIX.getValue()));
        viewResolver.setStaticVariables(vars);
        return AjaxResult.success();
    }

    @GetMapping("/list")
    public AjaxResult listTaoByTaoParam(TaokeParm taokeParm) {
        List<TaokeModel> list = new ArrayList<>();
        startDefaultPage();
        list = taokeService.listTaokeByTaoKe(taokeParm);
        // 封装分页
        PageData pageOne = PageData.getData(list);

        return AjaxResult.success(pageOne);
    }

    @GetMapping("/list/tagId/{tagId}/{pageSize}")
    public AjaxResult listTaoByTagId(@PathVariable("tagId") Long tagId, @PathVariable("pageSize") Integer pageSize) {
        List<TaokeModel> list = new ArrayList<>();
        startDefaultPage();
        list = taokeService.listTaoKeByTagId(tagId, 1, pageSize);
        // 封装分页
        PageData pageOne = PageData.getData(list);

        return AjaxResult.success(pageOne);
    }

    @GetMapping("/list/catId/{catId}/{pageSize}")
    public AjaxResult listTaoByCatId(@PathVariable("tagId") Long catId, @PathVariable("pageSize") Integer pageSize) {
        List<TaokeModel> list = new ArrayList<>();
        startDefaultPage();
        list = taokeService.listTaoKeByCatId(catId, 1, pageSize);
        // 封装分页
        PageData pageOne = PageData.getData(list);

        return AjaxResult.success(pageOne);
    }

    @GetMapping("/shopId/{shopId}")
    public AjaxResult getTaoByShopId(@PathVariable("tagId") String shopId) {
        return AjaxResult.success(taokeService.selectTaokeByShopId(shopId));
    }

    @GetMapping("/articleId/{articleId}")
    public AjaxResult getTaoByArticleId(@PathVariable("articleId") Long articleId) {
        return AjaxResult.success(taokeService.selectTaokeByArticleId(articleId));
    }

}