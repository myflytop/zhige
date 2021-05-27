package com.oly.web.web.api;

import java.util.ArrayList;
import java.util.List;

import com.oly.common.model.support.PageData;
import com.oly.web.model.po.BlogTag;
import com.oly.web.service.cache.BlogTagCacheService;
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
@RequestMapping("/api/tag")
public class TagApiController extends CommonController {

  @Autowired
  private BlogTagCacheService tagService;

  @GetMapping("/list")
  public AjaxResult listBlogTags(BlogTag tag) {
    List<BlogTag> list = new ArrayList<>();
    startDefaultPage();
    list = tagService.listBlogTags(tag);
    PageData pageOne = PageData.getData(list);
    return AjaxResult.success(pageOne);
  }

  @GetMapping("/get/{tagId}")
  public AjaxResult getBlogTagById(@PathVariable("tagId") Long tagId) {
    return AjaxResult.success(tagService.getBlogTagByTagId(tagId));
  }

  @GetMapping("/list/type/{type}")
  public AjaxResult listBlogTagbyType(@PathVariable("type") Byte type) {
    return AjaxResult.success(tagService.listBlogTagsByType(type, 20, "order_num,create_time desc"));
  }

}