package com.oly.cms.general.service.search;

import java.util.List;

import com.oly.cms.common.domain.entity.CmsLink;
import com.oly.cms.general.mapper.LinkSearchMapper;
import com.oly.cms.general.service.IGeneralSearchService;
import com.ruoyi.common.enums.CommonVisibleEnums;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GeneralLinkServiceImpl implements IGeneralSearchService {

    @Autowired
    private LinkSearchMapper linkSearchMapper;

    public List<CmsLink> listCmsLinks(CmsLink cmsLink) {
        cmsLink.setVisible(CommonVisibleEnums.SHOW.ordinal());
        return linkSearchMapper.listCmsLinks(cmsLink);
    }

    public CmsLink getCmsLinkById(long linkId) {
        CmsLink cmsLink = linkSearchMapper.selectCmsLinkById(linkId);
        cmsLink = (cmsLink == null || cmsLink.getVisible() != CommonVisibleEnums.SHOW.ordinal()) ? null : cmsLink;
        return linkSearchMapper.selectCmsLinkById(linkId);
    }

    public List<CmsLink> listCmsLinksByGroupName(String groupName) {
        CmsLink cmsLink = new CmsLink();
        cmsLink.setGroupName(groupName);
        return this.listCmsLinks(cmsLink);
    }

}
