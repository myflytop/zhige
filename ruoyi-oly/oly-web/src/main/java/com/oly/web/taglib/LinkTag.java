package com.oly.web.taglib;

import java.util.List;
import java.util.Map;

import com.oly.web.model.po.BlogLink;
import com.oly.web.service.cache.BlogLinkCacheService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("linkTag")
public class LinkTag {
  @Autowired
  private BlogLinkCacheService blogLinkService;

  /**
   * 获取链接列表
   * 
   * @param groupKey
   * @return
   */
  public List<BlogLink> listLink(String groupKey) {
    return blogLinkService.listBlogLinksByKey(groupKey);
  }

  /**
   * 获取链接通过ID
   * 
   * @param linkId
   * @return
   */
  public BlogLink getLinkById(Long linkId) {
    return blogLinkService.getBlogLinkById(linkId);
  }

  /**
   * 组名分组
   * 
   * @param groupKey
   * @return
   */
  public Map<String, List<BlogLink>> groupLink(String groupKey) {
    return blogLinkService.listBlogLinksGroupByKey(groupKey);
  }

}
