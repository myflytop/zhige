package com.oly.web.web.api.contoller;

import com.oly.common.model.enums.OlyCommonEnum;
import com.oly.framework.event.AddArticleEvent;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.system.service.impl.SysConfigServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.thymeleaf.spring5.view.ThymeleafViewResolver;

import java.util.HashMap;
import java.util.Map;

/**
 *
 */
@RestController
@RequestMapping("/api")
public class BlogApiController {
    private final String CONFIG_PREIGX = OlyCommonEnum.OLY_WBE_PREIFX.getValue();
    @Autowired
    private SysConfigServiceImpl sysConfigService;

    @Autowired
    ApplicationContext applicationContext;

    @Autowired
    @Qualifier("thymeleafViewResolver")
    private ThymeleafViewResolver viewResolver;

    /**
     * 刷新全局变量配置
     * 
     * @return
     */
    @GetMapping("/blogConfigRefresh")
    public AjaxResult refreshConfig() {
        Map<String, Object> vars = new HashMap<>();
        vars.put("blogConfig", sysConfigService.selectConfigMap(CONFIG_PREIGX));
        viewResolver.setStaticVariables(vars);
        return AjaxResult.success();
    }

    @GetMapping("/t")
    public AjaxResult onfig() {
        System.out.println("________________________________");
       applicationContext.publishEvent(new AddArticleEvent(this, 1));
        return AjaxResult.success();
    }
    

    //获取菜单
    @GetMapping("/menu/{menuId}")
    public AjaxResult getMenu(@PathVariable("menuId") long menuId)
    {

        return null;
    }

    //获取菜单列表
    @GetMapping("/list/menu/{size}/{visible}")
    public AjaxResult listMenu(@PathVariable("size")int size,@PathVariable(value="visible",required=false) byte visible)
    {

        return null;
    }

    /**
     * 获取标签
     * @param tagId
     * @return
     */
    @GetMapping("/tag/{tagId}")
    public AjaxResult getTag(@PathVariable("tagId") long tagId)
    {

        return null;
    }

    /**
     * 获取标签列表
     * @param size
     * @param visible
     * @return
     */
    @GetMapping("/list/tag/{size}/{num}/{visible}")
    public AjaxResult listTag(@PathVariable("size")int size,@PathVariable(value="num",required=false) int num,@PathVariable(value="visible",required=false) byte visible)
    {

        return null;
    }
    /**
     * 通过标签ID获取文章
     * @param tagId
     * @return
     */
    @GetMapping("/list/article/tag/{tagId}")
    public AjaxResult listArticleByTagId(@PathVariable("tagId") long tagId){
        return null;
    }
/**
     * 获取分类
     * @param catId
     * @return
     */
    @GetMapping("/cat/{catId}")
    public AjaxResult getCat(@PathVariable("catId") long catId)
    {

        return null;
    }

    /**
     * 获取分类列表
     * @param size
     * @param visible
     * @return
     */
    @GetMapping("/list/cat/{size}/{visible}")
    public AjaxResult listCat(@PathVariable("size")int size,@PathVariable(value="visible",required=false) byte visible)
    {

        return null;
    }

     /**
     * 获取节点及子节点
     * @param size
     * @return
     */
    @GetMapping("/list/catParent/{size}/{catId}")
    public AjaxResult listCatParent(@PathVariable("size")int size,@PathVariable(value="catId",required=false) long catId)
    {

        return null;
    }

    /**
     * 
     * @param catId
     * @return
     */
    @GetMapping("/list/article/cat/{catId}/{size}")
    public AjaxResult listArticleByCatId(@PathVariable("catId") long catId,@PathVariable("size")int size){
        return null;
    }

    /**
     * 通过链接ID获取文章
     * @param cId
     * @return
     */
    @GetMapping("/list/links/{size}")
    public AjaxResult listLinks(@PathVariable("size")int size){

        return null;
    }





}
