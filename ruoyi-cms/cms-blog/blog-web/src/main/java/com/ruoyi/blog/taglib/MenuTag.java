package com.ruoyi.blog.taglib;

import com.ruoyi.blog.mould.BlogMenu;
import com.ruoyi.blog.service.impl.BlogServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 菜单标签
 */
@Service("menuTag")
public class MenuTag {
    @Autowired
    private BlogServiceImpl blogService;

    /**
     * 不涉及分页（树形菜单）
     * @param columnId
     * @return
     */
    public BlogMenu getMenu(Long columnId){
        return blogService.listBlogMenuTreeByColumnId(columnId);
    }
}
