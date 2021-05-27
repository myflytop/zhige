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

  /**
   * 分类树
   * 
   * @param catId
   * @return
   */
  @GetMapping("/tree/{catId}")
  public AjaxResult getCatTreeById(@PathVariable("catId") Long catId) {

    return AjaxResult.success(categoryService.listBlogCatsTreeById(catId));
  }


  /**
   * @param catId
   * @return
   */
  @GetMapping("/get/{catId}")
  public AjaxResult getCatById(@PathVariable("catId") Long catId) {
    return AjaxResult.success(categoryService.getBlogCatByCatId(catId));
  }

  @GetMapping("/list/type/{type}")
  public AjaxResult listBlogCatByType(@PathVariable("type") Byte type) {

    return AjaxResult.success(categoryService.listBlogCatsByType(type));
  }

  @GetMapping("/list")
  public AjaxResult listCats(BlogCat blogCat) {
    List<BlogCat> list = new ArrayList<>();
    startDefaultPage();
    list = categoryService.listBlogCats(blogCat);
    PageData pageOne = PageData.getData(list);
    return AjaxResult.success(pageOne);
  }

}