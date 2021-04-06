package com.oly.web.web.api.contoller;

import com.oly.common.model.enums.OlyCommonEnum;
import com.oly.framework.event.AddArticleEvent;
import com.oly.web.mould.BlogLink;
import com.oly.web.mould.BlogMenu;
import com.oly.web.service.cache.BlogCacheService;
import com.oly.web.service.impl.BlogServiceImpl;
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
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

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
    private BlogCacheService blogService;

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

  
    /**
     * 获取菜单
     * @param menuId
     * @return
     */
    @GetMapping("/menu/{menuId}")
    public AjaxResult getMenu(@PathVariable("menuId") long menuId)
    {
        return AjaxResult.success(blogService.getBlogMenuById(menuId));
    }

    /**
     * 获取节点及子节点
     * @param menuId
     * @return
     */
    @GetMapping("/list/menu/{menuId}")
    public AjaxResult listMenu(@PathVariable("menuId")long menuId)
    {  
        
        return AjaxResult.success(blogService.listBlogMenus(menuId));
    }

    /**
     * 树菜单
     * @param menuId
     * @return
     */
    @GetMapping("/list/menuTree/{menuId}")
    public AjaxResult listMenuTree(@PathVariable("menuId")long menuId)
    {  
        
        return AjaxResult.success(blogService.listBlogMenuTreeByColumnId(menuId));
    }

    /**
     * 获取标签
     * @param tagId
     * @return
     */
    @GetMapping("/tag/{tagId}")
    public AjaxResult getTag(@PathVariable("tagId") long tagId)
    {

        return AjaxResult.success(blogService.getBlogTagByTagId(tagId));
    }

    /**
     * 获取标签列表
     * @param size
     * @return
     */
    @GetMapping("/list/tag/{size}")
    public AjaxResult listTag(@PathVariable("size")int size)
    {

        return AjaxResult.success(blogService.listBlogTags(size,"visible,create_time desc")); 
    }
    /**
     * 通过标签ID获取文章
     * @param tagId
     * @return
     */
    @GetMapping("/list/article/tag/{tagId}")
    public AjaxResult listArticleByTagId(@PathVariable("tagId") long tagId){
        return AjaxResult.success(blogService.listBlogArticlesByTagId(tagId, 100));
    }
/**
     * 获取分类
     * @param catId
     * @return
     */
    @GetMapping("/cat/{catId}")
    public AjaxResult getCat(@PathVariable("catId") long catId)
    {

        return AjaxResult.success(blogService.getBlogMenuById(catId));
    }


     /**
     * 获取节点及子节点
     * @param catId
     * @return
     */
    @GetMapping("/list/catParent/{catId}")
    public AjaxResult listCatParent(@PathVariable(value="catId") long catId)
    {
        return AjaxResult.success(blogService.listBlogMenus(catId));
    }

    /**
     * 通过分类ID获取文章
     * @param catId
     * @return
     */
    @GetMapping("/list/article/cat/{catId}")
    public AjaxResult listArticleByCatId(@PathVariable("catId") long catId){
        return AjaxResult.success(blogService.listBlogArticlesByCatId(catId, 100));
    }

    /**
     * 通过外联组获取外联列表
     * @param groupName
     * @return
     */
    @GetMapping("/list/links/{groupName}")
    public AjaxResult listLinks(@PathVariable(value = "groupName",required = false)String groupName){
        return AjaxResult.success(AjaxResult.success(blogService.listBlogLinks(groupName)));
    }

    /**
     * 将所有外联转换为map
     * @param groupName
     * @return
     */
    @GetMapping("/list/linksGroup")
    public AjaxResult listLinksGroup(){
        Map<String, List<BlogLink>> linkMap = blogService.listBlogLinks(null).stream()
        .collect(Collectors.groupingBy(BlogLink::getGroupName)); 
        return AjaxResult.success(linkMap);
    }






}
