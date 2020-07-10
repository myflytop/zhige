package com.ruoyi.blog.mapper;

import com.ruoyi.blog.mould.BlogContact;

import java.util.List;

public interface BlogHandleMapper {
    int  insertBlogContact (BlogContact blogContact);

    List<BlogContact> selectBlogContactList(BlogContact blogContact);

    BlogContact selectBlogContactById(Long contactId);
}
