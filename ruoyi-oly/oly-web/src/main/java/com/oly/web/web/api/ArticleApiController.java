package com.oly.web.web.api;

import java.util.ArrayList;
import java.util.List;

import com.github.pagehelper.PageHelper;
import com.oly.common.model.support.PageData;
import com.oly.web.model.pam.BlogArticleSearchParam;
import com.oly.web.model.po.BlogArticle;
import com.oly.web.service.search.BlogArticleServiceImpl;
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
  private BlogArticleServiceImpl articleService;

  /**
   * 文章综合查询
   * @param parm
   * @return
   */
  @GetMapping("/list")
    public AjaxResult listArticleByArticleParam(BlogArticleSearchParam parm){
      List<BlogArticle>  list=new ArrayList<>();
       startDefaultPage();
       list=articleService.listBlogArticles(parm);
       PageData pageOne= PageData.getData(list);
      return AjaxResult.success(pageOne);
    }
    
    /**
     * 获取文章
     * @param articleId
     * @return
     */
    @GetMapping("/get/{articleId}")
    public AjaxResult getAtticleById(@PathVariable("articleId") Long articleId){
    
      return AjaxResult.success(articleService.getBlogArticleById(articleId));
    }

     /**
     * 通过标签ID获取文章
     * @param tagId
     * @return
     */
    @GetMapping("/list/tag/{tagId}/{size}")
    public AjaxResult listArticleByTagId(@PathVariable("tagId") long tagId,@PathVariable("size") Integer size){
        PageHelper.startPage(1,size, "create_time asc");
        return AjaxResult.success(articleService.listBlogArticlesByTagId(tagId));
    }

    /**
     * 通过标签ID获取文章
     * @param tagId
     * @return
     */
    @GetMapping("/list/type/{type}/{size}")
    public AjaxResult listArticleByType(@PathVariable("type") Byte type,@PathVariable("size") Integer size){
      
        return AjaxResult.success(articleService.listBlogArticlesByType(type,size));
    }

      /**
     * 通过标签ID获取文章
     * @param tagId
     * @return
     */
    @GetMapping("/list/cat/{catId}/{size}")
    public AjaxResult listArticleByCatId(@PathVariable("catId") long catId,@PathVariable("size") Integer size){
        PageHelper.startPage(1,size, "create_time asc");
        return AjaxResult.success(articleService.listBlogArticlesByCatId(catId));
    }

}