package com.oly.cms.general.mapper;

import java.util.List;

import com.oly.cms.common.domain.entity.CmsUnion;

public interface UnionSearchMapper {

    /**
     * 查询联盟推广
     * 
     * @param shopId 联盟推广主键
     * @return 联盟推广
     */
    CmsUnion selectCmsUnionByShopId(String shopId);

    /**
     * 查询联盟推广列表
     * 
     * @param cmsUnion 联盟推广
     * @return 联盟推广集合
     */
    List<CmsUnion> listCmsUnions(CmsUnion cmsUnion);
}
