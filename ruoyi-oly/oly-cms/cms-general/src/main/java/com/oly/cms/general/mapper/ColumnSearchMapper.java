package com.oly.cms.general.mapper;

import java.util.List;

import com.oly.cms.common.domain.entity.CmsColumn;

public interface ColumnSearchMapper {
    /**
     * 获取菜单列表
     * 
     * @param cmsColumn
     * @return
     */
    List<CmsColumn> listCmsColumns(CmsColumn cmsColumn);

    /**
     * 获取菜单信息
     * 
     * @param columnId
     * @return
     */
    CmsColumn selectCmsColumnById(long columnId);

    /**
     * 验证同栏目下栏目名唯一
     * 
     * @param cmsColumn
     * @return
     */
    CmsColumn checkColumnNameUnique(CmsColumn cmsColumn);
}
