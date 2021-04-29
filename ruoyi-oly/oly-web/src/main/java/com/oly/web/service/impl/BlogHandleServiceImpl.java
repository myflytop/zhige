package com.oly.web.service.impl;

import com.oly.web.mapper.BlogHandleMapper;
import com.oly.web.model.po.BlogContact;
import com.oly.web.service.IBlogHandleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BlogHandleServiceImpl implements IBlogHandleService {
    @Autowired
    private BlogHandleMapper blogHandleMapper;

    @Override
    public int insertBlogContact(BlogContact blogContact) {
        return blogHandleMapper.insertBlogContact(blogContact);
    }

    @Override
    public List<BlogContact> selectBlogContactList(BlogContact blogContact) {
        return blogHandleMapper.selectBlogContactList(blogContact);
    }

    @Override
    public BlogContact selectBlogContactById(Long contactId) {
        return blogHandleMapper.selectBlogContactById(contactId);
    }
}
