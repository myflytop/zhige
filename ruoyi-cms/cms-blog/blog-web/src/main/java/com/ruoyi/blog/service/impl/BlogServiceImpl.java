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

@Service
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
    @Cacheable("blogMenusTree")
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
    @Cacheable("listBlogMenuTreeByColumnId")
    public BlogMenu listBlogMenuTreeByColumnId(Long columnId) {
        BlogMenu blogMenu=new BlogMenu();
        blogMenu.setColumnId(columnId);
        blogMenu.setVisible((byte) 1);
        return MenuTreeUtils.getColumnTree(listBlogMenus(blogMenu),columnId);
    }

    @Override
    @Cacheable("listBlogLinks")
    public List<BlogLink> listBlogLinks(BlogLink blogLink) {
        return blogMapper.listBlogLinks(blogLink);
    }

    @Override
    @Cacheable("listBlogTags")
    public List<BlogTag> listBlogTags(BlogTag blogTag) {
        return blogMapper.listBlogTags(blogTag);
    }
    @Override
    @Cacheable("listBlogArticles")
    public List<BlogArticle> listBlogArticles(BlogArticleSearchParam blogArticleSearchParam){
        return blogMapper.listBlogArticles(blogArticleSearchParam);
    }

    @Override
    @Cacheable("getBlogArticle")
    public BlogArticle getBlogArticle(BlogArticle blogArticle) {
        return blogMapper.getBlogArticle(blogArticle);
    }

    @Override
    @Cacheable("listBlogArticlesByCatId")
    public List<BlogArticle> listBlogArticlesByCatId(BlogArticleSearchParam blogArticleSearchParam){
        return blogMapper.listBlogArticlesByCatId(blogArticleSearchParam);
    }

    @Override
    @Cacheable("listBlogArticlesByTagId")
    public List<BlogArticle> listBlogArticlesByTagId(BlogArticleSearchParam blogArticleSearchParam){
        return blogMapper.listBlogArticlesByTagId(blogArticleSearchParam);
    }

    @Override
    @Cacheable("getBlogTagByTagId")
    public BlogTag getBlogTagByTagId(long tagId) {
        return blogMapper.getBlogTagByTagId(tagId);
    }

    @Override
    @Cacheable("getBlogCatByCatId")
    public BlogCat getBlogCatByCatId(long catId) {
        return blogMapper.getBlogCatByCatId(catId);
    }

    @Override
    @Cacheable("listHotCats")
    public List<BlogCat> listHotCats(Long str[]) {
        return blogMapper.listHotCats(str);
    }

    @Override
    @Cacheable("listHotTags")
    public List<BlogTag> listHotTags(Long str[]) {
        return blogMapper.listHotTags(str);
    }

    @Override
    @Cacheable("listArticleIdsByCatId")
    public List<Long> listArticleIdsByCatId(long catId) {
        return  blogMapper.listArticleIdsByCatId(catId);
    }

    @Override
    @Cacheable("listArticleIdsByTagId")
    public List<Long> listArticleIdsByTagId(long tagId) {
        return  blogMapper.listArticleIdsByTagId(tagId);
    }

    @Override
    @Cacheable("listBlogCats")
    public List<BlogCat> listBlogCats(BlogCat cat) {
        return blogMapper.listBlogCats(cat);
    }


}
