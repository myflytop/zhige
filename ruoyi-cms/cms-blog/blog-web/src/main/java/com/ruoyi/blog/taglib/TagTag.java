package com.ruoyi.blog.taglib;

import com.github.pagehelper.PageHelper;
import com.ruoyi.blog.mould.BlogArticle;
import com.ruoyi.blog.mould.BlogTag;
import com.ruoyi.blog.mould.pam.BlogArticleSearchParam;
import com.ruoyi.blog.service.impl.BlogCacheService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("tagTag")
public class TagTag {
    @Autowired
    private BlogCacheService blogService;

    /**
     * 获取所有标签
     * @return
     */
    public List<BlogTag> listTag(){

        return blogService.listBlogTags(null);
    }

    /**
     * 推荐标签
     * @return
     */
    public List<BlogTag> listTuiTag(){
         BlogTag blogTag=new BlogTag();
         blogTag.setVisible((byte) 2);
        return blogService.listBlogTags(blogTag);
    }

    /**
     * 通过标签Id获取文章列表
     * 按照发布时间倒序
     * @return
     */
    public List<BlogArticle> listArticleByTagId(Long tagId,int pageSize){

        PageHelper.startPage(1,pageSize,"create_time desc");
        BlogArticleSearchParam bl=new BlogArticleSearchParam();
        bl.setTagId(tagId);
        return blogService.listBlogArticlesByTagId(bl);
    }
    /**
     * 通过标签Id获取文章列表
     * 按照发布时间倒序
     * @return
     */
    public List<BlogArticle> listArticleByTagId(Long tagId,byte b,int pageSize){

        PageHelper.startPage(1,pageSize,"create_time desc");
        BlogArticleSearchParam bl=new BlogArticleSearchParam();
        bl.setTagId(tagId);
        bl.setArticleType(b);
        return blogService.listBlogArticlesByTagId(bl);
    }

    /**
     * 通过标签Id获取文章列表
     * 按照发布时间倒序
     * @return
     */
    public List<BlogArticle> listArticleByCategoryId(Long tagId){
        return this.listArticleByTagId(tagId,10);
    }



    public BlogTag getBlogTagByTagUrl(String tagUrl) {
        return blogService.getBlogTagByTagUrl(tagUrl);
    }

}
