package com.oly.web.taglib;

import java.util.List;

import com.oly.web.model.po.BlogMenu;
import com.oly.web.service.cache.BlogMenuCacheService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 菜单标签
 */
@Service("menuTag")
public class MenuTag {
    @Autowired
    private BlogMenuCacheService blogMenuService;

    /**
     * 不涉及分页（树形菜单）
     * 
     * @param columnId
     * @return
     */
    public BlogMenu getMenuTreeById(Long columnId) {
        return blogMenuService.listBlogMenusTreeById(columnId);
    }

    /**
     * 不涉及分页（树形菜单）
     * 获取所有菜单
     * @param columnId
     * @return
     */
    public BlogMenu getMenuTreeById() {
        return blogMenuService.listBlogMenusTreeById(0L);
    }
    
    
    /**
     * 通过id获取导航信息
     * @param columnId
     * @return
     */
    public BlogMenu getBlogMenuId(Long columnId) {
        return blogMenuService.getBlogMenuById(columnId);
    }

  
    public List<BlogMenu> listBlogMenuById(Long columnId) {
        return blogMenuService.listBlogMenusById(columnId);
    }
    
    /**
     * 获取所有菜单列表
     * @return
     */
    public List<BlogMenu> listBlogMenuAll() {
    
        return blogMenuService.listBlogMenusById(0L);
    }
    
  


}
