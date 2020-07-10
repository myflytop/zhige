package com.ruoyi.blog.service.impl;

import com.ruoyi.blog.mapper.BlogMapper;
import com.ruoyi.blog.mould.*;
import com.ruoyi.blog.mould.pam.BlogArticleSearchParam;
import com.ruoyi.blog.service.IBlogService;
import com.ruoyi.blog.utils.MenuTreeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("blogService")
public class BlogServiceImpl implements IBlogService {
    @Autowired
    private BlogMapper blogMapper;


    @Override
    public List<BlogMenu> listBlogMenus(BlogMenu blogMenu) {
        return blogMapper.listBlogMenus(blogMenu);
    }

    /**
     * parentId一样的
     * 属于同一个组
     * @param blogMenu
     * @return
     */
    @Override
    public BlogMenu listBlogMenuTree(BlogMenu blogMenu) {
        return MenuTreeUtils.getColumnTree(listBlogMenus(blogMenu),blogMenu.getColumnId());
    }
    /**
     * 获取未隐藏菜单
     * parentId一样的
     * 属于同一个组
     * @param columnId
     * @return
     */
    @Override
    public BlogMenu listBlogMenuTreeByColumnId(Long columnId) {
        BlogMenu blogMenu=new BlogMenu();
        blogMenu.setColumnId(columnId);
        blogMenu.setVisible((byte) 1);
        return MenuTreeUtils.getColumnTree(listBlogMenus(blogMenu),columnId);
    }

    @Override
    public List<BlogLink> listBlogLinks(BlogLink blogLink) {
        return blogMapper.listBlogLinks(blogLink);
    }

    @Override
    public List<BlogTag> listBlogTags(BlogTag blogTag) {
        return blogMapper.listBlogTags(blogTag);
    }
    @Override
    public List<BlogArticle> listBlogArticles(BlogArticleSearchParam blogArticleSearchParam){
        return blogMapper.listBlogArticles(blogArticleSearchParam);
    }

    @Override
    public BlogArticle getBlogArticle(BlogArticle blogArticle) {
        return blogMapper.getBlogArticle(blogArticle);
    }

    @Override
    public List<BlogArticle> listBlogArticlesByCatId(BlogArticleSearchParam blogArticleSearchParam){
        return blogMapper.listBlogArticlesByCatId(blogArticleSearchParam);
    }

    @Override
    public List<BlogArticle> listBlogArticlesByTagId(BlogArticleSearchParam blogArticleSearchParam){
        return blogMapper.listBlogArticlesByTagId(blogArticleSearchParam);
    }

    @Override
    public BlogTag getBlogTagByTagId(long tagId) {
        return blogMapper.getBlogTagByTagId(tagId);
    }

    @Override
    public BlogCat getBlogCatByCatId(long catId) {
        return blogMapper.getBlogCatByCatId(catId);
    }

    @Override
    public List<BlogCat> listHotCats(Long str[]) {
        return blogMapper.listHotCats(str);
    }
    @Override
    public List<BlogTag> listHotTags(Long str[]) {
        return blogMapper.listHotTags(str);
    }

    @Override
    public List<Long> listArticleIdsByCatId(long catId) {
        return  blogMapper.listArticleIdsByCatId(catId);
    }

    @Override
    public List<Long> listArticleIdsByTagId(long tagId) {
        return  blogMapper.listArticleIdsByTagId(tagId);
    }

    @Override
    public BlogMenu getBlogMenuByMenuUrl(String columnUrl) {
        return blogMapper.getBlogMenuByMenuUrl(columnUrl);
    }

    @Override
    public BlogTag getBlogTagByTagUrl(String tagUrl) {
        return blogMapper.getBlogTagByTagUrl(tagUrl);
    }

    @Override
    public BlogCat getBlogCatByCatUrl(String catUrl) {
        return blogMapper.getBlogCatByCatUrl(catUrl);
    }

    @Override
    public BlogArticle getBlogArticleByArticleUrl(String articleUrl) {
        return blogMapper.getBlogArticleByArticleUrl(articleUrl);
    }


    @Override
    public List<BlogCat> listBlogCats(BlogCat cat) {
        return blogMapper.listBlogCats(cat);
    }


}
