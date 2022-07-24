package com.oly.cms.general.service.cache;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.oly.cms.common.constant.CacheConstant;
import com.oly.cms.common.domain.entity.CmsUnion;
import com.oly.cms.general.service.search.GeneralUnionServiceImpl;

@Service
@CacheConfig(cacheNames = CacheConstant.UNION_CACHE_KEY_PREFIX)
public class GeneralUnionCacheService {

    @Autowired
    private GeneralUnionServiceImpl unionService;

    /**
     * 查询联盟推广
     * 
     * @param shopId 联盟推广主键
     * @return 联盟推广
     */
    @Cacheable(keyGenerator = "myKeyGenerator")
    public CmsUnion selectCmsUnionByShopId(String shopId) {
        return unionService.selectCmsUnionByShopId(shopId);
    }

    @Cacheable(keyGenerator = "myKeyGenerator")
    public List<CmsUnion> listCmsUnions(String cat, String tag, String unionType, int pageNum, int pageSize,
            String order) {
        return unionService.listCmsUnions(cat, tag, unionType, pageNum, pageSize, order);
    }

    /**
     * 查询联盟推广列表
     * 
     * @param cmsUnion 联盟推广
     * @return 联盟推广集合
     */
    public List<CmsUnion> listCmsUnions(CmsUnion cmsUnion) {
        return unionService.listCmsUnions(cmsUnion);
    }
}
