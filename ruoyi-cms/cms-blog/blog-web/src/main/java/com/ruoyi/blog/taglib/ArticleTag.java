package com.ruoyi.blog.taglib;

import com.github.pagehelper.PageHelper;
import com.ruoyi.blog.mould.BlogArticle;
import com.ruoyi.blog.mould.BlogArticleCountSort;
import com.ruoyi.blog.mould.BlogArticleSort;
import com.ruoyi.blog.service.impl.BlogArticleSortServiceImpl;
import com.ruoyi.blog.service.impl.BlogCacheService;
import com.ruoyi.blog.service.impl.BlogServiceImpl;
import com.ruoyi.cms.common.mould.support.PageData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 文章标签
 */
@Service("articleTag")
public class ArticleTag {
    @Autowired
    private BlogCacheService blogService;

    @Autowired
    private BlogArticleSortServiceImpl blogArticleSortService;

    /**
     *
     * @param orderString 排序标识
     * @return
     */
    private List<BlogArticle> listBlogArticle(int pageSize,String orderString){
        PageHelper.startPage(1,pageSize,orderString);
       return blogService.listBlogArticles(null);

    }

    /**
     * 获取文章
     * @param articleId
     * @return
     */
    public BlogArticle getBlogArticle(long articleId){
        BlogArticle blogArticle=new BlogArticle();
        blogArticle.setArticleId(articleId);
       return blogService.getBlogArticle(blogArticle);
    }

    /**
     * 获取文章
     * @param articleId  文章Id
     * @param  articleType 文章类型
     * @return
     */
    public BlogArticle getBlogArticle(long articleId,byte articleType){
        BlogArticle blogArticle=new BlogArticle();
        blogArticle.setArticleId(articleId);
        blogArticle.setArticleId(articleId);
        return blogService.getBlogArticle(blogArticle);
    }

    private List<BlogArticleSort> sort(int pageSize,String orderString){
        PageHelper.startPage(1,pageSize,orderString);
        return blogArticleSortService.listArticleSort(null);
    }

    /**
     * 依据时间排序
     * @param pageSize 获取条数
     * @return
     */
    public List<BlogArticleSort> listBlogArticleByTime(int  pageSize){
        return this.sort(pageSize,"create_time desc");
    }

    /**
     * 默认依据时间排序 默认10条
     * @return
     */
    public List<BlogArticleSort> listBlogArticleByTime(){
        return this.listBlogArticleByTime(10);
    }

    /**
     * 获取顶置文章
     * @param pageSize
     * @return
     */
    public List<BlogArticleSort> listBlogArticleByTop(int pageSize){
        return this.sort(pageSize,"article_top desc");
    }

    /**
     * 获取顶置文章
     * @return
     */
    public List<BlogArticleSort> listBlogArticleByTop(){
        return this.listBlogArticleByTop(10);
    }

    /**
     * 排序
     * @param pageSize 获取条数
     * @param orderString
     * @return
     */
    private List<BlogArticleCountSort> listBlogArticleCountSort(int pageSize,String orderString){
        PageHelper.startPage(1,pageSize,orderString);
        return blogArticleSortService.listArticlesCountSort(null);
    }



    /**
     * 依据浏览量排序
     * @param pageSize
     * @return
     */
    public List<BlogArticleCountSort> listBlogArticleByLook(int pageSize){

        return this.listBlogArticleCountSort(pageSize,"article_look desc");
    }
    public List<BlogArticleCountSort> listBlogArticleByLook(){

        return this.listBlogArticleByLook(10);
    }

    /**
     * 依据点赞数排序
     * @param pageSize
     * @return
     */
    public List<BlogArticleCountSort> listBlogArticleByLike(int pageSize){

        return this.listBlogArticleCountSort(pageSize,"article_like desc");
    }
    public List<BlogArticleCountSort> listBlogArticleByLike(){

        return this.listBlogArticleByLike(10);
    }

    /**
     * 依据讨厌排序
     * @param pageSize
     * @return
     */
    public List<BlogArticleCountSort> listBlogArticleByNasty(int pageSize){

        return this.listBlogArticleCountSort(pageSize,"article_nasty desc");
    }
    public List<BlogArticleCountSort> listBlogArticleByNasty(){

        return this.listBlogArticleByNasty(10);
    }

    /**
     * 依据分享数排序
     * @param pageSize
     * @return
     */
    public List<BlogArticleCountSort> listBlogArticleByShare(int pageSize){

        return this.listBlogArticleCountSort(pageSize,"article_share desc");
    }
    public List<BlogArticleCountSort> listBlogArticleByShare(){

        return this.listBlogArticleByShare(10);
    }

    /**
     * 依据评分排序
     * @param pageSize
     * @return
     */
    public List<BlogArticleCountSort> listBlogArticleByScore(int pageSize){

        return this.listBlogArticleCountSort(pageSize,"article_score desc");
    }
    public List<BlogArticleCountSort> listBlogArticleByScore(){

        return this.listBlogArticleByScore(10);
    }

    /**
     * 依据讨论数排序
     * @param pageSize
     * @return
     */
    public List<BlogArticleCountSort> listBlogArticleByDiscuss(int pageSize){

        return this.listBlogArticleCountSort(pageSize,"article_discuss desc");
    }
    public List<BlogArticleCountSort> listBlogArticleByDiscuss(){

        return this.listBlogArticleByDiscuss(10);
    }


    /**
     * 依据收藏数排序
     * @param pageSize
     * @return
     */
    public List<BlogArticleCountSort> listBlogArticleByCollect(int pageSize){

        return this.listBlogArticleCountSort(pageSize,"article_collect desc");
    }
    public List<BlogArticleCountSort> listBlogArticleByCollect(){

        return this.listBlogArticleByCollect(10);
    }


    public BlogArticle getBlogArticleById(long articleId){
        BlogArticle article=new BlogArticle();
        article.setArticleId(articleId);
        return blogService.getBlogArticle(article);
    }



    public BlogArticle getBlogArticleByArticleUrl(String articleUrl) {
        return blogService.getBlogArticleByArticleUrl(articleUrl);
    }

    /*首页缓存*/
    public PageData indexPosts(long pageSize){
        PageHelper.startPage(1, 72, "create_time desc");
        List<BlogArticle> list=blogService.listBlogArticles(null);
        PageData pageOne=PageData.getData(list);
        return pageOne;
    }
}
