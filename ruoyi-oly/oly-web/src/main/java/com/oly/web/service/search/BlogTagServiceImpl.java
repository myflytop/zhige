package com.oly.web.service.search;


import java.util.List;

import com.oly.web.mapper.BlogSearchMapper;
import com.oly.web.model.po.BlogTag;
import com.oly.web.service.IBlogSearchService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BlogTagServiceImpl implements IBlogSearchService {
    @Autowired
    private BlogSearchMapper blogSearchMapper;

    List<BlogTag> listBlogTags(BlogTag blogTag){
     return blogSearchMapper.listBlogTags(blogTag);
    }

    BlogTag getBlogTagByTagId(long tagId){
     return blogSearchMapper.getBlogTagByTagId(tagId);
    }

    List<BlogTag> listBlogTagsByType(Byte type){
        BlogTag blogTag=new BlogTag();
        blogTag.setTagType(type);
        return this.listBlogTags(blogTag);
    }


}
