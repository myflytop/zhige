package com.oly.cms.general.service.cache;

import java.util.List;

import com.oly.cms.common.constant.CacheConstant;
import com.oly.cms.common.domain.entity.CmsCat;
import com.oly.cms.general.service.search.GeneralCategoryServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

@Service
@CacheConfig(cacheNames = CacheConstant.CATS_CACHE_KEY_PREFIX)
public class GeneralCategoryCacheService {

    @Autowired
    private GeneralCategoryServiceImpl categoryServiceImpl;

    @Cacheable(keyGenerator = "myKeyGenerator")
    public CmsCat getCmsCatByCatId(long catId) {

        return categoryServiceImpl.getCmsCatByCatId(catId);
    }

    @Cacheable(keyGenerator = "myKeyGenerator")
    public List<CmsCat> listCmsCats(Long orderNum, Integer catType, Long parentId, Long catId, Integer parent,
            String themeName) {

        return categoryServiceImpl.listCmsCats(orderNum, catType, parentId, catId, parent, themeName);
    }

    @Cacheable(keyGenerator = "myKeyGenerator")
    public CmsCat selectCmsCatsTrees(Long orderNum, Integer catType, Long parentId, Long catId, Integer parent,
            String themeName) {
        return categoryServiceImpl.selectCmsCatsTrees(orderNum, catType, parentId, catId, parent, themeName);
    }

    @Cacheable(keyGenerator = "myKeyGenerator")
    public int getCatNum(String themeName) {
        return categoryServiceImpl.getCatNum(themeName);
    }

    public List<CmsCat> listCmsCats(CmsCat cmsCat) {

        return categoryServiceImpl.listCmsCats(cmsCat);
    }

    public CmsCat getCmsCatsTree(CmsCat cmsCat) {

        return categoryServiceImpl.selectCmsCatsTree(cmsCat);
    }

    @Cacheable(keyGenerator = "myKeyGenerator")
    public boolean checkSupportCat(String themeName, long catId) {
        return categoryServiceImpl.checkSupportCat(themeName, catId);
    }

}
