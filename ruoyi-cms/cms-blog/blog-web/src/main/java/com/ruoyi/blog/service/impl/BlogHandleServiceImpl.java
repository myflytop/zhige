package com.ruoyi.blog.service.impl;

import com.ruoyi.blog.mapper.BlogHandleMapper;
import com.ruoyi.blog.mould.BlogContact;
import com.ruoyi.blog.service.IBlogHandleService;
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
