package com.oly.web.service.search;

import java.util.List;

import com.oly.common.model.properties.OlyWebConfigProetries;
import com.oly.web.mapper.BlogSearchMapper;
import com.oly.web.model.po.BlogCat;
import com.oly.web.service.IBlogSearchService;
import com.oly.web.service.cache.BlogConfigCacheService;
import com.oly.web.utils.tree.CategoryTreeUtils;
import com.ruoyi.common.utils.StringUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BlogCategoryServiceImpl implements IBlogSearchService {
    @Autowired
    private BlogSearchMapper blogSearchMapper;

    @Autowired
    private BlogConfigCacheService commonService;

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

    public List<BlogCat> listBlogCatsByType(Byte catType,Long catId) {
        BlogCat blogCat = new BlogCat();
        blogCat.setCatType(catType);
        blogCat.setCatId(catId);
        return blogSearchMapper.listBlogCats(blogCat);
    }

    public List<BlogCat> listBlogCatsByVisible(Integer visible,Long catId,String themeName) {
        BlogCat blogCat = new BlogCat();
        blogCat.setVisible(visible);
        blogCat.setCatId(catId);
        setSupportType(blogCat, themeName);
        return this.listBlogCats(blogCat);
    }

    public List<BlogCat> listBlogCatsById(Long catId,String themeName) {
        BlogCat blogCat = new BlogCat();
        blogCat.setCatId(catId);
        setSupportType(blogCat, themeName);
        return this.listBlogCats(blogCat);
    }

    public BlogCat listBlogCatsTreeById(Long catId,String themeName) {
        return CategoryTreeUtils.getCatTree(this.listBlogCatsById(catId,themeName), catId);
    }

    public BlogCat listBlogCatsTree(BlogCat blogCat) {
        if (blogCat != null && blogCat.getCatId() != null) {
            blogCat.setCatId(0L);
        }
        return CategoryTreeUtils.getCatTree(this.listBlogCats(blogCat), blogCat.getCatId());
    }

    private void setSupportType(BlogCat blogCat,String themeName){
        String supportType=commonService.getBackConfigDefauleValue(themeName,OlyWebConfigProetries.ARTICLE_TYPES);
        if(StringUtils.isNotEmpty(supportType))
        {  
            blogCat.getParams().put("supportType",supportType);
        } 
      
    }
}
