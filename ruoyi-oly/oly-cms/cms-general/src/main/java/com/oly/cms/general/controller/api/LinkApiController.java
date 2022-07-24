package com.oly.cms.general.controller.api;

import java.util.ArrayList;
import java.util.List;

import com.oly.cms.common.domain.entity.CmsLink;
import com.oly.cms.common.model.support.PageData;
import com.oly.cms.general.service.cache.GeneralLinkCacheService;
import com.ruoyi.common.core.controller.BaseController;
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
public class LinkApiController extends BaseController {

  @Autowired
  private GeneralLinkCacheService linkService;

  /**
   * 综合查询
   * 
   * @param cmsLink
   * @return
   */
  @GetMapping("/list")
  public AjaxResult list(CmsLink cmsLink) {
    List<CmsLink> list = new ArrayList<>();
    startDefaultPage();
    list = linkService.listCmsLinks(cmsLink);
    PageData pageOne = PageData.getData(list);
    return AjaxResult.success(pageOne);
  }

  /**
   * 获取链接列表
   * 
   * @param groupName
   * @return
   */
  @GetMapping("/list/groupName/{groupName}")
  public AjaxResult listLinkByKey(@PathVariable("groupName") String groupName) {
    return AjaxResult.success(linkService.listCmsLinksByGroupName(groupName));
  }

  /**
   * 获取链接通过ID
   * 
   * @param linkId
   * @return
   */
  @GetMapping("/get/{linkId}")
  public AjaxResult getLinkById(@PathVariable("linkId") Long linkId) {
    return AjaxResult.success(linkService.getCmsLinkById(linkId));
  }

  /**
   * 组名分组支持模糊查询 确保分组key与组名唯一
   * 
   * @param groupKey
   * @return
   */
  @GetMapping("/group/{groupName}")
  public AjaxResult groupLink(@PathVariable("groupName") String groupName) {
    return AjaxResult.success(linkService.mapCmsLinksGroupByName(groupName));
  }

}
