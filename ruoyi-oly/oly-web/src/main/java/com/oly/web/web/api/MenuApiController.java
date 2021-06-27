package com.oly.web.web.api;

import com.oly.web.model.po.BlogMenu;
import com.oly.web.service.cache.BlogMenuCacheService;
import com.oly.web.web.CommonController;
import com.ruoyi.common.core.domain.AjaxResult;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@CrossOrigin
@RestController
@RequestMapping("/api/menu")
public class MenuApiController extends CommonController {

  @Autowired
  private BlogMenuCacheService menuService;

  /**
   * 不涉及分页（树形菜单）
   * 
   * @param id
   * @return
   */
  @GetMapping("/tree/{id}")
  public AjaxResult getMenuTreeById(@PathVariable("id") Long id) {
    return AjaxResult.success(menuService.listBlogMenusTreeById(id));
  }
  /**
   * 通过id获取导航树
   * 
   * @param columnId
   * @return
   */
  @GetMapping("/get/{columnId}")
  public AjaxResult getBlogMenuId(@PathVariable("columnId") Long columnId) {
    return AjaxResult.success(menuService.getBlogMenuById(columnId));
  }
  
  /**
   * 通过Id获取导航列表
   * @param columnId
   * @return
   */
  @GetMapping("/list/{columnId}")
  public AjaxResult listBlogMenuById(@PathVariable("columnId") Long columnId) {
    return AjaxResult.success(menuService.listBlogMenusById(columnId));
  }
  
  /**
   * 综合查询
   * @param blogMenu
   * @return
   */
  @GetMapping("/list")
  public AjaxResult listBlogMenu(BlogMenu blogMenu) {
    return AjaxResult.success(menuService.listBlogMenus(blogMenu));
  }



}
