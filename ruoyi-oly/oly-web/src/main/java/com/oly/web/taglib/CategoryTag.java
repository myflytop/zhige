package com.oly.web.taglib;

import java.util.List;

import com.oly.web.model.po.BlogCat;
import com.oly.web.service.cache.BlogCategoryCacheService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 分类标签
 */
@Service("categoryTag")
public class CategoryTag {

    @Autowired
    private BlogCategoryCacheService catCacheService;

    /**
     * 分类树
     * 
     * @param catId
     * @return
     */
    public BlogCat getCatTreeById(Long catId, String themeName) {
        return catCacheService.listBlogCatsTreeById(catId, themeName);
    }

    /**
     * 获取分类
     * 
     * @param catId
     * @return
     */
    public BlogCat getCatById(Long catId) {
        return catCacheService.getBlogCatByCatId(catId);
    }

    /**
     * 通过分类id获取分类列表
     * 
     * @param catId
     * @param themeName 主题名字
     * @return
     */
    public List<BlogCat> listCategoryByCatId(Long catId, String themeName) {
        return catCacheService.listBlogCatsById(catId, themeName);
    }

    /**
     * 
     * @param catType 类型
     * @param catId   分类Id
     * @return
     */
    public List<BlogCat> listCategoryByType(Byte catType, Long catId) {
        return catCacheService.listBlogCatsByType(catType, catId);
    }

    /**
     * 
     * @param Visible   状态 1|2
     * @param catId     分类Id
     * @param themeName 主题名字
     * @return
     */
    public List<BlogCat> listCategoryByVisible(Integer visible, Long catId, String themeName) {
        return catCacheService.listBlogCatsByVisible(visible, catId, themeName);
    }

}
