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
                UnionSortEnums.SHOP_PRICE.getOrder(OrderEnums.DESC));
    }

    public List<CmsUnion> listCmsUnionsByCat(String cat, int pageNum, int pageSize) {
        return unionCacheService.listCmsUnions(cat, null, null, pageNum, pageSize,
                UnionSortEnums.SHOP_PRICE.getOrder(OrderEnums.DESC));
    }

    public List<CmsUnion> listCmsUnionsByTag(String tag, int pageNum, int pageSize) {
        return unionCacheService.listCmsUnions(null, tag, null, pageNum, pageSize,
                UnionSortEnums.SHOP_PRICE.getOrder(OrderEnums.DESC));
    }

    public List<CmsUnion> listCmsUnionsByType(String unionType, int pageNum, int pageSize) {
        return unionCacheService.listCmsUnions(null, null, unionType, pageNum, pageSize,
                UnionSortEnums.SHOP_PRICE.getOrder(OrderEnums.DESC));
    }

    public List<CmsUnion> listCmsUnions(String unionType, String cat, String tag, UnionSortEnums unionSortEnums,
            OrderEnums orderEnums,
            int pageNum, int pageSize) {
        return unionCacheService.listCmsUnions(cat, tag, unionType, pageNum, pageSize,
                unionSortEnums.getOrder(orderEnums));
    }

    public List<CmsUnion> listCmsUnionsByTag(String unionType, String tagId, UnionSortEnums unionSortEnums,
            OrderEnums orderEnums,
            int pageNum, int pageSize) {
        return unionCacheService.listCmsUnions(null, tagId, unionType, pageNum, pageSize,
                unionSortEnums.getOrder(orderEnums));
    }
}
