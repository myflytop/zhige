package com.oly.cms.general.mapper;

import java.util.List;

import com.oly.cms.common.domain.entity.CmsLink;

public interface LinkSearchMapper {
    /**
     * 获取链接列表
     * 
     * @param cmsLink
     * @return
     */
    List<CmsLink> listCmsLinks(CmsLink cmsLink);

    /**
     * 获取链接信息
     * 
     * @param linkId
     * @return
     */
    CmsLink selectCmsLinkById(long linkId);

}
