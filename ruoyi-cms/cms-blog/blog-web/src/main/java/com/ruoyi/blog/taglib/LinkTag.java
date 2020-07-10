package com.ruoyi.blog.taglib;

import com.ruoyi.blog.mould.BlogLink;
import com.ruoyi.blog.service.impl.BlogCacheService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service("linkTag")
public class LinkTag {
    @Autowired
    private BlogCacheService blogService;

    /**
     * 获取链接列表
     * @param groupName
     * @return
     */
  public List<BlogLink> listLink(String groupName){
      BlogLink blogLink=new BlogLink();
      blogLink.setGroupName(groupName);
    return   blogService.listBlogLinks(blogLink);
  }

    /**
     * 获取列表安装组名排序
     * @param groupName
     * @return
     */
    public Map<String,List<BlogLink>> groupLink(String groupName){
        BlogLink blogLink=new BlogLink();
        blogLink.setGroupName(groupName);
        Map<String, List<BlogLink>> linkMap=blogService.listBlogLinks(blogLink).stream().collect(Collectors.groupingBy(BlogLink::getGroupName));
       return linkMap;
    }

}
