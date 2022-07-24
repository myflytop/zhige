package com.oly.cms.general.controller.api;

import java.util.ArrayList;
import java.util.List;

import com.oly.cms.common.domain.entity.CmsCat;
import com.oly.cms.common.model.support.PageData;
import com.oly.cms.general.taglib.CategoryTag;
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
@RequestMapping("/api/category")
public class CategoryApiController extends BaseController {

  @Autowired
  private CategoryTag categoryService;

  /**
   * 获取分类信息
   * 
   * @param catId
   * @return
   */
  @GetMapping("/get/{catId}")
  public AjaxResult getCatById(@PathVariable("catId") Long catId) {
    return AjaxResult.success(categoryService.getCatById(catId));
  }

  /**
   * 通过类型获取分类列表
   * 
   * @param type 类型
   * @param id
   * @return
   */
  @GetMapping("/list/type/{type}/{id}")
  public AjaxResult listCmsCatByType(@PathVariable("type") Integer type, @PathVariable("id") Long id) {
    return AjaxResult.success(categoryService.listCategoryByType(type, id));
  }

  @GetMapping("/list/orderNum/{orderNum}/{id}")
  public AjaxResult listCmsCatByOrderNum(@PathVariable("orderNum") long orderNum, @PathVariable("id") long id) {
    return AjaxResult.success(categoryService.listCategoryByOrderNum(orderNum, id));
  }

  @GetMapping({ "/list/{id}/themeName/{themeName}", "/list/{id}" })
  public AjaxResult listCmsCatById(@PathVariable("id") Long id,
      @PathVariable(value = "themeName", required = false) String themeName) {
    return AjaxResult.success(categoryService.listCategoryByCatId(id, themeName));
  }

  @GetMapping({ "/tree/{catId}/themeName/{themeName}", "/tree/{catId}" })
  public AjaxResult getCatTreeById(@PathVariable("catId") Long catId,
      @PathVariable(value = "themeName", required = false) String themeName) {

    return AjaxResult.success(categoryService.getCatTreeById(catId, themeName));
  }

  @GetMapping({ "/list", "/list/{themeName}" })
  public AjaxResult listCats(CmsCat cmsCat, @PathVariable(value = "themeName", required = false) String themeName) {
    cmsCat.setSearchValue(themeName);
    List<CmsCat> list = new ArrayList<>();
    startDefaultPage();
    list = categoryService.listCmsCats(cmsCat);
    PageData pageOne = PageData.getData(list);
    return AjaxResult.success(pageOne);
  }

  @GetMapping("/tree")
  public AjaxResult getCatTree(CmsCat cmsCat) {
    return AjaxResult.success(categoryService.getCmsCatsTree(cmsCat));
  }

}