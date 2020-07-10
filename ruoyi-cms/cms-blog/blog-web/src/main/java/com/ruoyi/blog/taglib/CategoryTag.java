package com.ruoyi.blog.taglib;


import com.github.pagehelper.PageHelper;
import com.ruoyi.blog.mould.BlogArticle;
import com.ruoyi.blog.mould.BlogCat;
import com.ruoyi.blog.mould.pam.BlogArticleSearchParam;
import com.ruoyi.blog.service.impl.BlogCacheService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service("categoryTag")
public class CategoryTag {
    @Autowired
    private BlogCacheService blogService;

    /**
     * 获取分类列表不分页
     * @return
     */
    public List<BlogCat> listCategory(){
        return blogService.listBlogCats(null);
    }

    /**
     * 获取分类列表不分页
     * @return
     */
    public List<BlogCat> listTuiCategory(){
        BlogCat blogCat=new BlogCat();
        blogCat.setVisible((byte) 2);
        return blogService.listBlogCats(blogCat);
    }

    /**
     * 通过分类Id获取文章列表
     * 按照发布时间倒序
     * @return
     */
    public List<BlogArticle> listArticleByCategoryId(Long catId,int pageSize){

        PageHelper.startPage(1,pageSize,"create_time desc");
        BlogArticleSearchParam bl=new BlogArticleSearchParam();
        bl.setCatId(catId);
        return blogService.listBlogArticlesByCatId(bl);
    }
    /**
     * 通过分类Id获取文章列表
     * 按照发布时间倒序
     * @return
     */
    public List<BlogArticle> listArticleByCategoryId(Long catId,byte articleType,int pageSize){

        PageHelper.startPage(1,pageSize,"create_time desc");
        BlogArticleSearchParam bl=new BlogArticleSearchParam();
        bl.setCatId(catId);
        bl.setArticleType(articleType);
        return blogService.listBlogArticlesByCatId(bl);
    }
    /**
     * 通过分类Id获取文章列表
     * 按照发布时间倒序
     * @return
     */
    public List<BlogArticle> listArticleByCategoryId(Long catId){
        return this.listArticleByCategoryId(catId,10);
    }






    public BlogCat getBlogCatByCatUrl(String catUrl) {
        return blogService.getBlogCatByCatUrl(catUrl);
    }
}
