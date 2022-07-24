package com.oly.cms.general.controller.api;

import com.oly.cms.common.domain.entity.CmsColumn;
import com.oly.cms.general.service.cache.GeneralColumnCacheService;
import com.ruoyi.common.core.controller.BaseController;
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
public class ColumnApiController extends BaseController {

  @Autowired
  private GeneralColumnCacheService menuService;

  /**
   * 不涉及分页（树形菜单）
   * 
   * @param id
   * @return
   */
  @GetMapping("/tree/{id}")
  public AjaxResult getMenuTreeById(@PathVariable("id") Long id) {
    return AjaxResult.success(menuService.listCmsColumnsTreeById(id));
  }

  /**
   * 通过id获取导航树
   * 
   * @param columnId
   * @return
   */
  @GetMapping("/get/{columnId}")
  public AjaxResult getCmsColumnId(@PathVariable("columnId") Long columnId) {
    return AjaxResult.success(menuService.getCmsColumnById(columnId));
  }

  /**
   * 通过Id获取导航列表
   * 
   * @param columnId
   * @return
   */
  @GetMapping("/list/{columnId}")
  public AjaxResult listCmsColumnById(@PathVariable("columnId") Long columnId) {
    return AjaxResult.success(menuService.listCmsColumnsById(columnId));
  }

  /**
   * 综合查询
   * 
   * @param cmsColumn
   * @return
   */
  @GetMapping("/list")
  public AjaxResult listCmsColumn(CmsColumn cmsColumn) {
    return AjaxResult.success(menuService.listCmsColumns(cmsColumn));
  }

}
