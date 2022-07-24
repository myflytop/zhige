package com.oly.cms.general.taglib;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oly.cms.common.domain.entity.CmsUnion;
import com.oly.cms.common.model.enums.OrderEnums;
import com.oly.cms.common.model.enums.UnionSortEnums;
import com.oly.cms.general.service.cache.GeneralUnionCacheService;

@Service("unionTag")
public class UnionTag {
    @Autowired
    private GeneralUnionCacheService unionCacheService;

    public CmsUnion getCmsUnionByShopId(String shopId) {
        return unionCacheService.selectCmsUnionByShopId(shopId);
    }

    public List<CmsUnion> listCmsUnions(String cat, String tag, String unionType, int pageNum, int pageSize) {
        return unionCacheService.listCmsUnions(cat, tag, unionType, pageNum, pageSize,
                UnionSortEnums.CREATE_TIME.getOrder(OrderEnums.DESC));
    }

    public List<CmsUnion> listCmsUnionsByCat(String cat, int pageNum, int pageSize) {
        return unionCacheService.listCmsUnions(cat, null, null, pageNum, pageSize,
                UnionSortEnums.CREATE_TIME.getOrder(OrderEnums.DESC));
    }

    public List<CmsUnion> listCmsUnionsByTag(String tag, int pageNum, int pageSize) {
        return unionCacheService.listCmsUnions(null, tag, null, pageNum, pageSize,
                UnionSortEnums.CREATE_TIME.getOrder(OrderEnums.DESC));
    }

    public List<CmsUnion> listCmsUnionsByType(String unionType, int pageNum, int pageSize) {
        return unionCacheService.listCmsUnions(null, null, unionType, pageNum, pageSize,
                UnionSortEnums.CREATE_TIME.getOrder(OrderEnums.DESC));
    }
}
