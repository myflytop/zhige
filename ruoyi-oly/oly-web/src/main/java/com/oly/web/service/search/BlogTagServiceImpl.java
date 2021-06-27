package com.oly.web.service.search;

import java.util.List;

import com.oly.common.model.properties.OlyWebConfigProetries;
import com.oly.web.mapper.BlogSearchMapper;
import com.oly.web.model.po.BlogTag;
import com.oly.web.service.IBlogSearchService;
import com.oly.web.service.cache.BlogConfigCacheService;
import com.ruoyi.common.utils.StringUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BlogTagServiceImpl implements IBlogSearchService {

    @Autowired
    private BlogSearchMapper blogSearchMapper;

    @Autowired
    private BlogConfigCacheService commonService;

    public List<BlogTag> listBlogTags(BlogTag blogTag) {
        return blogSearchMapper.listBlogTags(blogTag);
    }

    public BlogTag getBlogTagByTagId(long tagId) {
        return blogSearchMapper.getBlogTagByTagId(tagId);
    }

    public List<BlogTag> getBlogTagByVisibleAndType(Byte tagType,Integer visible,String themeName) {
     String supportType=  commonService.getBackConfigDefauleValue(themeName,OlyWebConfigProetries.ARTICLE_TYPES);
     
        BlogTag blogTag = new BlogTag();
        blogTag.setTagType(tagType);
        blogTag.setVisible(visible);
        if(StringUtils.isNotEmpty(supportType))
        {  
            blogTag.getParams().put("supportType", supportType);
        } 
        return this.listBlogTags(blogTag);
    }
}
