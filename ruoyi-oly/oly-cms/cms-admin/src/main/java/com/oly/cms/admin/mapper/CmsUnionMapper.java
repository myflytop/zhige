package com.oly.cms.admin.mapper;

import org.apache.ibatis.annotations.Param;

import com.oly.cms.common.domain.entity.CmsUnion;

/**
 * 联盟推广Mapper接口
 * 
 * @author zg
 * @date 2022-05-30
 */
public interface CmsUnionMapper {

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
     * 删除联盟推广
     * 
     * @param shopId 联盟推广主键
     * @return 结果
     */
    int deleteCmsUnionByShopId(String shopId);

    /**
     * 批量删除联盟推广
     * 
     * @param shopIds 需要删除的数据主键集合
     * @return 结果
     */
    int deleteCmsUnionByShopIds(String[] shopIds);

    /**
     * 批量更新状态
     * 
     * @param ids
     * @param visible
     * @return
     */
    int updateCmsUnionVisible(@Param("ids") String[] ids, @Param("visible") int visible);

}
