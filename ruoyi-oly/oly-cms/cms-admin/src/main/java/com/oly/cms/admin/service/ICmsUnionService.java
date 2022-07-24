package com.oly.cms.admin.service;

import java.util.List;

import com.oly.cms.admin.model.enums.UnionTypeEnums;
import com.oly.cms.common.domain.entity.CmsUnion;

/**
 * 联盟推广Service接口
 * 
 * @author zg
 * @date 2022-05-30
 */
public interface ICmsUnionService {
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
    List<CmsUnion> selectCmsUnionList(CmsUnion cmsUnion);

    /**
     * 新增联盟推广
     * 
     * @param cmsUnion 联盟推广
     * @return 结果
     */
    int insertCmsUnion(CmsUnion cmsUnion);

    /**
     * 修改联盟推广
     * 
     * @param cmsUnion 联盟推广
     * @return 结果
     */
    int updateCmsUnion(CmsUnion cmsUnion);

    /**
     * 批量删除联盟推广
     * 
     * @param shopIds 需要删除的联盟推广主键集合
     * @return 结果
     */
    int deleteCmsUnionByShopIds(String shopIds);

    /**
     * 删除联盟推广信息
     * 
     * @param shopId 联盟推广主键
     * @return 结果
     */
    int deleteCmsUnionByShopId(String shopId);

    /**
     * 导入数据
     * 
     * @param unionList     数据
     * @param updateSupport 覆盖更新
     * @param unionType     来源
     * @param tags
     * @param cats
     * @return
     */
    String importUnions(List<CmsUnion> unionList, boolean updateSupport, UnionTypeEnums unionType, String tags,
            String cats);

    /**
     * 批量更新状态
     * 
     * @param ids
     * @param visible
     * @return
     */
    int updateCmsUnionVisible(String ids, int visible);
}
