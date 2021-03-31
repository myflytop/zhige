package com.oly.web.mapper;

import java.util.List;

import com.oly.web.mould.BlogContact;
import com.oly.web.mould.BlogTheme;

/**
 * 前端操作控制
 */
public interface BlogHandleMapper {
    int insertBlogContact(BlogContact blogContact);

    List<BlogContact> selectBlogContactList(BlogContact blogContact);

    BlogContact selectBlogContactById(Long contactId);

    int insertBlogTheme(BlogTheme blogTheme);

    int updateBlogThemeByName(BlogTheme blogTheme);
}
