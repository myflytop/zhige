package com.oly.cms.general.service.search;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.oly.cms.common.domain.entity.CmsUnion;
import com.oly.cms.general.mapper.UnionSearchMapper;
import com.oly.cms.general.service.IGeneralSearchService;
import com.ruoyi.common.enums.CommonVisibleEnums;

@Service
public class GeneralUnionServiceImpl implements IGeneralSearchService {

    @Autowired
    private UnionSearchMapper unionSearchMapper;

    /**
     * 查询联盟推广
     * 
     * @param shopId 联盟推广主键
     * @return 联盟推广
     */
    public CmsUnion selectCmsUnionByShopId(String shopId) {
        return unionSearchMapper.selectCmsUnionByShopId(shopId);
    }

    public List<CmsUnion> listCmsUnions(String cat, String tag, String unionType, int pageNum, int pageSize,
            String order) {
        CmsUnion cmsUnion = new CmsUnion();
        cmsUnion.setCats(cat);
        cmsUnion.setTags(tag);
        cmsUnion.setUnionType(unionType);
        cmsUnion.setVisible(CommonVisibleEnums.SHOW.ordinal());
        PageHelper.startPage(pageNum, pageSize, order);
        return this.listCmsUnions(cmsUnion);
    }

    /**
     * 查询联盟推广列表
     * 
     * @param cmsUnion 联盟推广
     * @return 联盟推广集合
     */
    public List<CmsUnion> listCmsUnions(CmsUnion cmsUnion) {

        return unionSearchMapper.listCmsUnions(cmsUnion);
    }
}
