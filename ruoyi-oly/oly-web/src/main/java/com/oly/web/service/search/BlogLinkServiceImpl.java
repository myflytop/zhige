package com.oly.web.service.search;

import java.util.List;

import com.oly.web.mapper.BlogSearchMapper;
import com.oly.web.model.po.BlogLink;
import com.oly.web.service.IBlogSearchService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BlogLinkServiceImpl implements IBlogSearchService {
    @Autowired
    private BlogSearchMapper blogSearchMapper;

    public List<BlogLink> listBlogLinks(BlogLink blogLink) {
        return blogSearchMapper.listBlogLinks(blogLink);
    }

    public BlogLink getBlogLinkById(Long linkId) {
        return blogSearchMapper.getBlogLinkById(linkId);
    }

    public List<BlogLink> listBlogLinksByKey(String groupKey) {
        BlogLink blogLink = new BlogLink();
        blogLink.setGroupKey(groupKey);
        return blogSearchMapper.listBlogLinks(blogLink);
    }

}
