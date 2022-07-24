
package com.oly.cms.general.service.cache;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import com.oly.cms.common.constant.CacheConstant;
import com.oly.cms.common.domain.entity.CmsLink;
import com.oly.cms.general.service.search.GeneralLinkServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

@Service
@CacheConfig(cacheNames = CacheConstant.LINKS_CACHE_KEY_PREFIX)
public class GeneralLinkCacheService {

    @Autowired
    private GeneralLinkServiceImpl linkServiceImpl;

    @Cacheable(keyGenerator = "myKeyGenerator")
    public CmsLink getCmsLinkById(Long linkId) {

        return linkServiceImpl.getCmsLinkById(linkId);
    }

    @Cacheable(keyGenerator = "myKeyGenerator")
    public List<CmsLink> listCmsLinksByGroupName(String groupName) {
        return linkServiceImpl.listCmsLinksByGroupName(groupName);
    }

    @Cacheable(keyGenerator = "myKeyGenerator")
    public Map<String, List<CmsLink>> mapCmsLinksGroupByName(String groupName) {
        Map<String, List<CmsLink>> linkMap = linkServiceImpl.listCmsLinksByGroupName(groupName).stream()
                .collect(Collectors.groupingBy(CmsLink::getGroupName));
        return linkMap;
    }

    public List<CmsLink> listCmsLinks(CmsLink cmsLink) {
        return linkServiceImpl.listCmsLinks(cmsLink);
    }

}
