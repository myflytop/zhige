package com.ruoyi.blog.service;

import com.ruoyi.blog.mould.BlogContact;

import java.util.List;

public interface IBlogHandleService {

    int  insertBlogContact (BlogContact blogContact);

    List<BlogContact> selectBlogContactList(BlogContact blogContact);

    BlogContact selectBlogContactById(Long contactId);


}
