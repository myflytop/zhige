package com.oly.web.service.search;

import java.util.List;

import com.oly.web.mapper.BlogSearchMapper;
import com.oly.web.model.po.BlogCat;
import com.oly.web.service.IBlogSearchService;
import com.oly.web.utils.tree.CategoryTreeUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BlogCategoryServiceImpl implements IBlogSearchService {
    @Autowired
    private BlogSearchMapper blogSearchMapper;

    public BlogCat getBlogCatByCatId(long catId) {

        return blogSearchMapper.getBlogCatByCatId(catId);
    }

    /**
     * 获取分类列表
     * 
     * @param blogCat
     * @return
     */
    public List<BlogCat> listBlogCats(BlogCat blogCat) {

        return blogSearchMapper.listBlogCats(blogCat);
    }

    public List<BlogCat> listBlogCatsByType(byte type) {
        BlogCat blogCat = new BlogCat();
        blogCat.setCatType(type);
        return blogSearchMapper.listBlogCats(blogCat);
    }

    public List<BlogCat> listBlogCatsById(Long catId) {
        BlogCat blogCat = new BlogCat();
        blogCat.setCatId(catId);
        return blogSearchMapper.listBlogCats(blogCat);
    }

    public BlogCat listBlogCatsTreeById(Long catId) {

        return CategoryTreeUtils.getCatTree(this.listBlogCatsById(catId), catId);
    }

    public BlogCat listBlogCatsTree(BlogCat blogCat) {
        if (blogCat != null && blogCat.getCatId() != null) {
            blogCat.setCatId(0L);
        }
        return CategoryTreeUtils.getCatTree(this.listBlogCats(blogCat), blogCat.getCatId());
    }
}
