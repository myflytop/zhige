package com.oly.web.service.search;

import java.util.List;

import com.oly.web.mapper.BlogSearchMapper;
import com.oly.web.model.po.BlogMenu;
import com.oly.web.service.IBlogSearchService;
import com.oly.web.utils.tree.MenuTreeUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BlogMenuServiceImpl implements IBlogSearchService {
    @Autowired
    private BlogSearchMapper blogSearchMapper;

    public BlogMenu getBlogMenuByMenuId(long columnId) {

        return blogSearchMapper.getBlogMenuByMenuId(columnId);
    }

    public List<BlogMenu> listBlogMenus(BlogMenu blogMenu) {

        return blogSearchMapper.listBlogMenus(blogMenu);
    }

    /**
     * 获取节点及所有子节点
     * 
     * @param menuId
     * @return
     */
    public List<BlogMenu> listBlogMenusById(long menuId) {
        BlogMenu blogMenu = new BlogMenu();
        blogMenu.setColumnId(menuId);
        return this.listBlogMenus(blogMenu);
    }

    /**
     * 转化为树
     * 
     * @param menuId
     * @return
     */
    public BlogMenu listBlogMenusTreeById(long menuId) {
        return MenuTreeUtils.getColumnTree(this.listBlogMenusById(menuId), menuId);
    }

    public BlogMenu listBlogMenusTree(BlogMenu blogMenu) {

        if (blogMenu != null && blogMenu.getColumnId() != null) {
            blogMenu.setColumnId(0L);
        }
        return MenuTreeUtils.getColumnTree(this.listBlogMenus(blogMenu), blogMenu.getColumnId());
    }

}
