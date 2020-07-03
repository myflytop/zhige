package com.ruoyi.blog.taglib;

import com.ruoyi.blog.mould.BlogMenu;
import com.ruoyi.blog.service.impl.BlogCacheService;
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
     * @param columnId
     * @return
     */
    public BlogMenu getMenu(Long columnId){
        return blogService.listBlogMenuTreeByColumnId(columnId);
    }
    public BlogMenu getBlogMenuByMenuUrl(String columnUrl) {
        return blogService.getBlogMenuByMenuUrl(columnUrl);
    }


}
