package com.oly.cms.general.service.cache;

import java.util.List;

import com.oly.cms.common.constant.CacheConstant;
import com.oly.cms.common.domain.entity.CmsTag;
import com.oly.cms.general.service.search.GeneralTagServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

@Service
@CacheConfig(cacheNames = CacheConstant.LINKS_CACHE_KEY_PREFIX)
public class GeneralTagCacheService {
    @Autowired
    private GeneralTagServiceImpl tagServiceImpl;

    @Cacheable(keyGenerator = "myKeyGenerator")
    public CmsTag getCmsTagByTagId(long tagId) {
        return tagServiceImpl.getCmsTagByTagId(tagId);
    }

    @Cacheable(keyGenerator = "myKeyGenerator")
    public List<CmsTag> listCmsTagsByTypeAndOrderNum(Integer tagType, Long orderNum, String themeName) {
        return tagServiceImpl.listCmsTags(tagType, orderNum, themeName);
    }

    public List<CmsTag> listCmsTags(CmsTag cmsTag) {
        return tagServiceImpl.listCmsTags(cmsTag);
    }
}
