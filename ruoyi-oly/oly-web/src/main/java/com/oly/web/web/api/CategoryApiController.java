package com.oly.web.web.api;

import java.util.ArrayList;
import java.util.List;

import com.oly.common.model.support.PageData;
import com.oly.web.model.po.BlogCat;
import com.oly.web.service.cache.BlogCategoryCacheService;
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
@RequestMapping("/api/category")
public class CategoryApiController extends CommonController {

  @Autowired
  private BlogCategoryCacheService categoryService;

  @GetMapping("/get/{catId}")
  public AjaxResult getCatById(@PathVariable("catId") Long catId) {
    return AjaxResult.success(categoryService.getBlogCatByCatId(catId));
  }

  @GetMapping("/list/type/{type}/{id}")
  public AjaxResult listBlogCatByType(@PathVariable("type") Byte type, @PathVariable("id") Long id) {
    return AjaxResult.success(categoryService.listBlogCatsByType(type, id));
  }

  @GetMapping("/list/visible/{visible}/{id}")
  public AjaxResult listBlogCatByVisible(@PathVariable("visible") Byte visible, @PathVariable("id") Long id) {
    return AjaxResult.success(categoryService.listBlogCatsByType(visible, id));
  }

  @GetMapping({"/list/{id}/themeName/{themeName}","/list/{id}"})
  public AjaxResult listBlogCatById(@PathVariable("id") Long id,@PathVariable(value = "themeName",required = false)String themeName) {
    return AjaxResult.success(categoryService.listBlogCatsById(id,themeName));
  }

  @GetMapping({"/tree/{catId}/themeName/{themeName}","/tree/{catId}"})
  public AjaxResult getCatTreeById(@PathVariable("catId") Long catId,@PathVariable(value = "themeName",required = false)String themeName) {

    return AjaxResult.success(categoryService.listBlogCatsTreeById(catId,themeName));
  }

  @GetMapping("/list")
  public AjaxResult listCats(BlogCat blogCat) {
    List<BlogCat> list = new ArrayList<>();
    startDefaultPage();
    list = categoryService.listBlogCats(blogCat);
    PageData pageOne = PageData.getData(list);
    return AjaxResult.success(pageOne);
  }

  @GetMapping("/tree")
  public AjaxResult getCatTree(BlogCat blogCat) {
    return AjaxResult.success(categoryService.listBlogCatsTree(blogCat));
  }

}