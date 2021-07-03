package com.oly.web.web.api;

import java.util.ArrayList;
import java.util.List;

import com.oly.common.model.support.PageData;
import com.oly.web.model.pam.BlogArticleSearchParam;
import com.oly.web.model.po.BlogArticle;
import com.oly.web.service.cache.BlogArticleCacheService;
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
@RequestMapping("/api/article")
public class ArticleApiController extends CommonController {

  @Autowired
  private BlogArticleCacheService articleService;

  /**
   * 文章综合查询
   * 
   * @param parm
   * @return
   */
  @GetMapping("/list")
  public AjaxResult listArticleByArticleParam(BlogArticleSearchParam parm, String themeName) {
    List<BlogArticle> list = new ArrayList<>();
    startDefaultPage();
    list = articleService.listBlogArticles(parm, themeName);
    PageData pageOne = PageData.getData(list);
    return AjaxResult.success(pageOne);
  }

  /**
   * 获取文章
   * 
   * @param articleId
   * @return
   */
  @GetMapping("/getHtml/{articleId}")
  public AjaxResult getArticleHtmlById(@PathVariable("articleId") Long articleId) {

    return AjaxResult.success(articleService.getBlogArticleHtmlById(articleId));
  }

  /**
   * 获取文章
   * 
   * @param articleId
   * @return
   */
  @GetMapping("/getMd/{articleId}")
  public AjaxResult getArticleMdById(@PathVariable("articleId") Long articleId) {

    return AjaxResult.success(articleService.getBlogArticleHtmlById(articleId));
  }

  /**
   * 
   * @param tagId     标签Id
   * @param size      大小
   * @param themeName
   * @return
   */
  @GetMapping({ "/list/tag/{tagId}/size/{size}", "/list/tag/{tagId}/size/{size}/themeName/{themeName}" })
  public AjaxResult listArticleByTagId(@PathVariable("tagId") long tagId, @PathVariable("size") Integer size,
      @PathVariable(value = "themeName", required = false) String themeName) {

    return AjaxResult.success(articleService.listBlogArticlesByTagId(tagId, size, themeName));
  }

  @GetMapping({ "/list/type/{type}/{size}", "/list/type/{type}/{size}/themeName/{themeName}" })
  public AjaxResult listArticleByType(@PathVariable("type") Byte type, @PathVariable("size") Integer size,
      @PathVariable(value = "themeName", required = false) String themeName) {

    return AjaxResult.success(articleService.listBlogArticlesByType(type, size, themeName));
  }

  /**
   * 通过标签ID获取文章
   * 
   * @param catId
   * @return
   */
  @GetMapping("/list/cat/{catId}/{size}")
  public AjaxResult listArticleByCatId(@PathVariable("catId") long catId, @PathVariable("size") Integer size,
      @PathVariable(value = "themeName", required = false) String themeName) {
    return AjaxResult.success(articleService.listBlogArticlesByCatId(catId, size, themeName));
  }

}
