package com.oly.cms.general.taglib;

import java.util.List;
import java.util.Map;
import com.oly.cms.common.domain.entity.CmsLink;
import com.oly.cms.general.service.cache.GeneralLinkCacheService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("linkTag")
public class LinkTag {
  @Autowired
  private GeneralLinkCacheService cmsLinkService;

  /**
   * 获取链接列表
   * 
   * @param GroupName
   * @return
   */
  public List<CmsLink> listLinkByGroupName(String groupName) {
    return cmsLinkService.listCmsLinksByGroupName(groupName);
  }

  /**
   * 获取链接通过ID
   * 
   * @param linkId
   * @return
   */
  public CmsLink getLinkById(long linkId) {
    return cmsLinkService.getCmsLinkById(linkId);
  }

  /**
   * 组名分组
   * 
   * @param groupName
   * @return
   */
  public Map<String, List<CmsLink>> groupLink(String groupName) {
    return cmsLinkService.mapCmsLinksGroupByName(groupName);
  }

}
