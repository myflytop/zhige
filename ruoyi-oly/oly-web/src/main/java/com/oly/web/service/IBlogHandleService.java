package com.oly.web.service;

import java.util.List;

import com.oly.web.model.po.BlogContact;

public interface IBlogHandleService {

    int insertBlogContact(BlogContact blogContact);

    List<BlogContact> selectBlogContactList(BlogContact blogContact);

    BlogContact selectBlogContactById(Long contactId);

}
