package com.oly.web.taglib;

import java.util.List;

import com.oly.web.model.po.BlogMenu;
import com.oly.web.service.cache.BlogCacheService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 菜单标签
 */
@Service("menuTag")
public class MenuTag {
    @Autowired
    private BlogCacheService blogService;

    /**
     * 不涉及分页（树形菜单）
     * 
     * @param columnId
     * @return
     */
    public BlogMenu getMenuTreeById(Long columnId) {
        return blogService.listBlogMenuTreeByColumnId(columnId);
    }

    /**
     * 不涉及分页（树形菜单）
     * 获取所有菜单
     * @param columnId
     * @return
     */
    public BlogMenu getMenuTreeById() {
        return blogService.listBlogMenuTreeByColumnId(0L);
    }
    
    
    /**
     * 通过id获取导航信息
     * @param columnId
     * @return
     */
    public BlogMenu getBlogMenuId(Long columnId) {
        return blogService.getBlogMenuById(columnId);
    }

  
    public List<BlogMenu> listBlogMenuById(Long columnId) {
        return blogService.listBlogMenus(columnId);
    }
    
    /**
     * 获取所有菜单列表
     * @return
     */
    public List<BlogMenu> listBlogMenuAll() {
    
        return blogService.listBlogMenus(0L);
    }
    
  


}
