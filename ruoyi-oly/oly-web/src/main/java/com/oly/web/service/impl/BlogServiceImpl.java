package com.oly.web.service.impl;

import com.oly.common.model.enums.ArticleVisibleEnums;
import com.oly.common.model.enums.CommonVisibleEnums;
import com.oly.web.mapper.BlogMapper;
import com.oly.web.mould.*;
import com.oly.web.mould.pam.BlogArticleSearchParam;
import com.oly.web.service.IBlogService;
import com.oly.web.utils.MenuTreeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("blogService")
public class BlogServiceImpl implements IBlogService {
    @Autowired
    private BlogMapper blogMapper;

    @Override
    public List<BlogMenu> listBlogMenus(BlogMenu blogMenu) {
       if(blogMenu.getVisible()==null||blogMenu.getVisible()==(byte)CommonVisibleEnums.HIDE.ordinal())
       {
           blogMenu.setVisible((byte)CommonVisibleEnums.SHOW.ordinal());
       }
        return blogMapper.listBlogMenus(blogMenu);
    }

    /**
     * parentId一样的 属于同一个组
     * 
     * @param blogMenu
     * @return
     */
    @Override
    public BlogMenu listBlogMenuTree(BlogMenu blogMenu) {
        return MenuTreeUtils.getColumnTree(listBlogMenus(blogMenu), blogMenu.getColumnId());
    }

    /**
     * parentId一样的 属于同一个组
     * 
     * @param columnId
     * @return
     */
    @Override
    public BlogMenu listBlogMenuTreeByColumnId(Long columnId) {
        BlogMenu blogMenu = new BlogMenu();
        blogMenu.setColumnId(columnId);
        return MenuTreeUtils.getColumnTree(listBlogMenus(blogMenu), columnId);
    }

    @Override
    public BlogMenu getBlogMenuById(Long menuId){
        BlogMenu blogMenu=blogMapper.getBlogMenuByMenuId(menuId);
        if(blogMenu==null)
        {
            blogMenu=new BlogMenu();
        }
    return blogMenu;
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
    public List<BlogArticle> listBlogArticles(BlogArticleSearchParam blogArticleSearchParam) {
        if(blogArticleSearchParam==null)
        {
            blogArticleSearchParam=new BlogArticleSearchParam();
        }
        blogArticleSearchParam.setVisible(ArticleVisibleEnums.PASS.ordinal());
        return blogMapper.listBlogArticles(blogArticleSearchParam);
    }

    @Override
    public BlogArticle getBlogArticle(BlogArticle blogArticle) {
        return blogMapper.getBlogArticle(blogArticle);
    }

    @Override
    public List<BlogArticle> listBlogArticlesByCatId(BlogArticleSearchParam blogArticleSearchParam) {
        blogArticleSearchParam.setVisible(ArticleVisibleEnums.PASS.ordinal());
        if(blogMapper.checkCatIsHidden(blogArticleSearchParam.getCatId())==0)
        {
        return null;
        }
        return blogMapper.listBlogArticlesByCatId(blogArticleSearchParam);
    }

    @Override
    public List<BlogArticle> listBlogArticlesByTagId(BlogArticleSearchParam blogArticleSearchParam) {
        blogArticleSearchParam.setVisible(ArticleVisibleEnums.PASS.ordinal());
        if(blogMapper.checkTagIsHidden(blogArticleSearchParam.getTagId())==0)
        {
        return null;
        }
        return blogMapper.listBlogArticlesByTagId(blogArticleSearchParam);
    }

    @Override
    public BlogTag getBlogTagByTagId(long tagId) {
        return blogMapper.getBlogTagByTagId(tagId);
    }

    @Override
    public BlogCat getBlogCatByCatId(long catId) {
        BlogCat blogCat=blogMapper.getBlogCatByCatId(catId);
        if(blogCat==null)
        {
            blogCat=new BlogCat();
        }

        return blogCat;
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
        return blogMapper.listArticleIdsByCatId(catId);
    }

    @Override
    public List<Long> listArticleIdsByTagId(long tagId) {
        return blogMapper.listArticleIdsByTagId(tagId);
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

    @Override
    public BlogArticle getBlogArticleByArticleId(long articleId) {
        
        return blogMapper.getBlogArticleByArticleId(articleId);
    }

    @Override
    public BlogLink getBlogLinkById(Long linkId) {
        //
        return blogMapper.getBlogLinkById(linkId);
          
    } 

}
