package com.oly.web.service.cache;

import java.util.List;

import com.oly.common.constant.CacheConstant;
import com.oly.web.model.po.BlogMenu;
import com.oly.web.service.search.BlogMenuServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

@Service

public class BlogMenuCacheService {

    @Autowired
    private BlogMenuServiceImpl menuServiceImpl;

    @Cacheable(value = CacheConstant.MENU_CACHE_KEY_PREFIX, key = "methodName + '_' + #p0")
    public BlogMenu getBlogMenuById(long columnId) {

        return menuServiceImpl.getBlogMenuByMenuId(columnId);
    }

    @Cacheable(value = CacheConstant.MENU_CACHE_KEY_PREFIX, key = "methodName + '_' + #p0")
    public List<BlogMenu> listBlogMenusById(long menuId) {

        return menuServiceImpl.listBlogMenusById(menuId);
    }

    @Cacheable(value = CacheConstant.MENU_CACHE_KEY_PREFIX, key = "methodName + '_' + #p0")
    public BlogMenu listBlogMenusTreeById(long menuId) {

        return menuServiceImpl.listBlogMenusTreeById(menuId);
    }

    public List<BlogMenu> listBlogMenus(BlogMenu blogMenu) {

        return menuServiceImpl.listBlogMenus(blogMenu);
    }

}
