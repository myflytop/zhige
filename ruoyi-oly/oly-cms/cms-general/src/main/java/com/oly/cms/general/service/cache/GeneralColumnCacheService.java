package com.oly.cms.general.service.cache;

import java.util.List;

import com.oly.cms.common.constant.CacheConstant;
import com.oly.cms.common.domain.entity.CmsColumn;
import com.oly.cms.general.service.search.GeneralColumnServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

@Service
@CacheConfig(cacheNames = CacheConstant.MENU_CACHE_KEY_PREFIX)
public class GeneralColumnCacheService {

    @Autowired
    private GeneralColumnServiceImpl menuServiceImpl;

    @Cacheable(keyGenerator = "myKeyGenerator")
    public CmsColumn getCmsColumnById(long columnId) {

        return menuServiceImpl.getCmsColumnByMenuId(columnId);
    }

    @Cacheable(keyGenerator = "myKeyGenerator")
    public List<CmsColumn> listCmsColumnsById(long menuId) {

        return menuServiceImpl.listCmsColumnsById(menuId);
    }

    @Cacheable(keyGenerator = "myKeyGenerator")
    public CmsColumn listCmsColumnsTreeById(long menuId) {

        return menuServiceImpl.listCmsColumnsTreeById(menuId);
    }

    public List<CmsColumn> listCmsColumns(CmsColumn cmsColumn) {

        return menuServiceImpl.listCmsColumns(cmsColumn);
    }

}
