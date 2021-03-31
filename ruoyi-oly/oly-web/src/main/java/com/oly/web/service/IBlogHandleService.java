package com.oly.web.service;

import com.oly.web.mould.BlogContact;

import java.util.List;

public interface IBlogHandleService {

    int insertBlogContact(BlogContact blogContact);

    List<BlogContact> selectBlogContactList(BlogContact blogContact);

    BlogContact selectBlogContactById(Long contactId);

}
