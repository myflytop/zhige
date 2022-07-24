package com.oly.cms.general.controller.api;

import java.util.ArrayList;
import java.util.List;

import com.oly.cms.common.domain.entity.CmsTag;
import com.oly.cms.common.model.support.PageData;
import com.oly.cms.general.taglib.TagTag;
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
@RequestMapping("/api/tag")
public class TagApiController extends BaseController {

  @Autowired
  private TagTag tagService;

  /**
   * 综合查询
   * 
   * @param tag
   * @return
   */
  @GetMapping({ "/list", "/list/{themeName}" })
  public AjaxResult listTags(CmsTag tag, @PathVariable(value = "themeName", required = false) String themeName) {
    List<CmsTag> list = new ArrayList<>();
    startDefaultPage();
    tag.setSearchValue(themeName);
    list = tagService.listCmsTags(tag);
    PageData pageOne = PageData.getData(list);
    return AjaxResult.success(pageOne);
  }

  /**
   * 获取标签
   * 
   * @param tagId
   * @return
   */
  @GetMapping("/get/{tagId}")
  public AjaxResult getTagById(@PathVariable("tagId") Long tagId) {
    return AjaxResult.success(tagService.getTagById(tagId));
  }

  /**
   * 通过类型获取标签列表 获取所有满足条件的标签
   * 
   * @param type
   * @param themeName 主题名
   * @return
   */
  @GetMapping({ "/list/type/{type}", "/list/type/{type}/themeName/{themeName}" })
  public AjaxResult listTagByType(@PathVariable("type") Integer type,
      @PathVariable(value = "themeName", required = false) String themeName) {
    return AjaxResult.success(tagService.listTagByType(type, themeName));
  }

  /**
   * @param orderNum  排序
   * @param themeName 主题名
   * @return
   */
  @GetMapping({ "/list/orderNum/{orderNum}", "/list/orderNum/{orderNum}/themeName/{themeName}" })
  public AjaxResult listTagByOrderNum(@PathVariable("orderNum") long orderNum,
      @PathVariable(value = "themeName", required = false) String themeName) {
    return AjaxResult.success(tagService.listTagByOrderNum(orderNum, themeName));
  }

  /**
   * @param type      类型
   * @param orderNum  排序
   * @param themeName 主题名
   * @return
   */
  @GetMapping({ "/list/type/{type}/orderNum/{orderNum}",
      "/list/type/{type}/orderNum/{orderNum}/themeName/{themeName}" })
  public AjaxResult listTagByType(@PathVariable("type") Integer type, @PathVariable("orderNum") long orderNum,
      @PathVariable(value = "themeName", required = false) String themeName) {
    return AjaxResult.success(tagService.listTagByTypeAndOrderNum(type, orderNum, themeName));
  }

}