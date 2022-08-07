package com.oly.cms.general.controller.api;

import java.util.ArrayList;
import java.util.List;

import com.oly.cms.common.model.enums.OrderEnums;
import com.oly.cms.common.model.support.PageData;
import com.oly.cms.general.model.param.WebArticleSearchParam;
import com.oly.cms.general.model.po.WebArticle;
import com.oly.cms.general.taglib.ArticleTag;
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
@RequestMapping("/api/article")
public class ArticleApiController extends BaseController {

  @Autowired
  private ArticleTag articleService;

  /**
   * 文章综合查询
   * 
   * @param parm
   * @return
   */
  @GetMapping("/list")
  public AjaxResult listArticleByArticleParam(WebArticleSearchParam parm, String themeName) {
    List<WebArticle> list = new ArrayList<>();
    startPage();
    list = articleService.listWebArticles(parm, themeName);
    PageData pageOne = PageData.getData(list);
    return AjaxResult.success(pageOne);
  }

  /**
   * 获取文章HTML
   * 
   * @param articleId
   * @return
   */
  @GetMapping("/getHtml/{articleId}")
  public AjaxResult getArticleHtmlById(@PathVariable("articleId") String articleId) {

    return AjaxResult.success(articleService.getWebArticleHtmlById(articleId));
  }

  /**
   * 获取文章MD
   * 
   * @param articleId
   * @return
   */
  @GetMapping("/getMd/{articleId}")
  public AjaxResult getArticleMdById(@PathVariable("articleId") String articleId) {

    return AjaxResult.success(articleService.getWebArticleHtmlById(articleId));
  }

  /**
   * 
   * @param tagId
   * @param num
   * @param size
   * @param themeName
   * @return
   */
  @GetMapping("/list/tag/{tagId}/{num}/{size}/{themeName}")
  public AjaxResult listArticleByTagId(@PathVariable("tagId") long tagId, @PathVariable("num") Integer num,
      @PathVariable("size") Integer size, @PathVariable("themeName") String themeName) {
    return AjaxResult.success(articleService.listWebArticlesByTagId(tagId, num, size, themeName));
  }

  /**
   * 
   * @param tagId
   * @param num
   * @param size
   * @param themeName
   * @param order
   * @return
   */
  @GetMapping("/list/tag/{tagId}{themeName}/{num}/{size}/order/{order}")
  public AjaxResult listArticleByTagId(@PathVariable("tagId") long tagId, @PathVariable("num") Integer num,
      @PathVariable("size") Integer size, @PathVariable("themeName") String themeName,
      @PathVariable("order") OrderEnums order) {
    return AjaxResult.success(articleService.listWebArticlesOrderByTagId(tagId, themeName, num, size, order));
  }

  /**
   * 
   * @param tagId
   * @param num
   * @param size
   * @return
   */
  @GetMapping("/list/tag/{tagId}/{num}/{size}")
  public AjaxResult listArticleByTagId(@PathVariable("tagId") long tagId, @PathVariable("num") int num,
      @PathVariable("size") int size) {
    return AjaxResult.success(articleService.listWebArticlesByTagId(tagId, num, size));
  }

  /**
   * @param tagId
   * @param num
   * @param size
   * @param order
   * @return
   */
  @GetMapping("/list/tag/{tagId}/{num}/{size}/order/{order}")
  public AjaxResult listArticleByTagId(@PathVariable("tagId") long tagId, @PathVariable("num") int num,
      @PathVariable("size") int size, @PathVariable("order") OrderEnums order) {
    return AjaxResult.success(articleService.listWebArticlesOrderByTagId(tagId, num, size, order));
  }

  /**
   * 
   * @param catId
   * @param num
   * @param size
   * @param themeName
   * @return
   */
  @GetMapping("/list/cat/{catId}/{themeName}/{num}/{size}")
  public AjaxResult listArticleByCatId(@PathVariable("catId") long catId, @PathVariable("num") Integer num,
      @PathVariable("size") Integer size, @PathVariable("themeName") String themeName) {
    return AjaxResult.success(articleService.listWebArticlesByCatId(catId, num, size, themeName));
  }

  /**
   * 
   * @param catId
   * @param num
   * @param size
   * @param themeName
   * @param order
   * @return
   */
  @GetMapping("/list/cat/{catId}/{themeName}/{num}/{size}/order/{order}")
  public AjaxResult listArticleByCatId(@PathVariable("catId") long catId, @PathVariable("num") Integer num,
      @PathVariable("size") Integer size, @PathVariable("themeName") String themeName,
      @PathVariable("order") OrderEnums order) {
    return AjaxResult.success(articleService.listWebArticlesOrderByCatId(catId, themeName, num, size, order));
  }

  /**
   * 
   * @param catId
   * @param num
   * @param size
   * @return
   */
  @GetMapping("/list/cat/{catId}/{num}/{size}")
  public AjaxResult listArticleByCatId(@PathVariable("catId") long catId, @PathVariable("num") Integer num,
      @PathVariable("size") Integer size) {
    return AjaxResult.success(articleService.listWebArticlesByCatId(catId, num, size));
  }

  /**
   * 
   * @param catId
   * @param num
   * @param size
   * @param order
   * @return
   */
  @GetMapping("/list/cat/{catId}/{num}/{size}/order/{order}")
  public AjaxResult listArticleByCatId(@PathVariable("catId") long catId, @PathVariable("num") Integer num,
      @PathVariable("size") Integer size, @PathVariable("order") OrderEnums order) {
    return AjaxResult.success(articleService.listWebArticlesOrderByCatId(catId, num, size, order));
  }

  /**
   * 
   * @param type
   * @param size
   * @param themeName
   * @return
   */
  @GetMapping("/list/type/{type}/{num}/{size}")
  public AjaxResult listArticleByType(@PathVariable("type") int type, @PathVariable("size") Integer size,
      @PathVariable("num") int num) {

    return AjaxResult.success(articleService.listWebArticleByType(type, num, size));
  }

}
