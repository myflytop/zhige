package com.oly.web.web.api;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.oly.common.model.support.PageData;
import com.oly.web.model.po.BlogLink;
import com.oly.web.service.cache.BlogLinkCacheService;
import com.oly.web.web.CommonController;
import com.ruoyi.common.core.domain.AjaxResult;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@CrossOrigin
@RestController
@RequestMapping("/api/link")
public class LinkApiController extends CommonController {

  @Autowired
  private BlogLinkCacheService linkService;

  /**
   * 获取链接列表
   * 
   * @param groupName
   * @return
   */
  @GetMapping("/list/key/{groupKey}")
  public AjaxResult listLink(@PathVariable("groupKey") String groupKey) {
    return AjaxResult.success(linkService.listBlogLinksByKey(groupKey));
  }

   /**
   * 获取链接列表
   * @return
   */
  @GetMapping("/list")
  public AjaxResult list(BlogLink blogLink) {
    List<BlogLink> list = new ArrayList<>();
    startDefaultPage();
    list = linkService.listBlogLinks(blogLink);
    PageData pageOne = PageData.getData(list);
    return AjaxResult.success(pageOne);
  }


  /**
   * 获取链接通过ID
   * 
   * @param linkId
   * @return
   */
  @GetMapping("/get/{linkId}")
  public AjaxResult getLinkById(@PathVariable("linkId") Long linkId) {
    return AjaxResult.success(linkService.getBlogLinkById(linkId));
  }

  /**
   * 组名分组
   * 
   * @param groupName
   * @return
   */
  @GetMapping("/group/{groupKey}")
  public AjaxResult groupLink(@PathVariable("groupKey") String groupKey) {
    Map<String, List<BlogLink>> linkMap = linkService.listBlogLinksByKey(groupKey).stream()
        .collect(Collectors.groupingBy(BlogLink::getGroupName));
    return AjaxResult.success(linkMap);
  }

}