package com.oly.cms.general.taglib;

import java.util.List;

import com.oly.cms.common.domain.entity.CmsColumn;
import com.oly.cms.general.service.cache.GeneralColumnCacheService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 菜单标签
 */
@Service("menuTag")
public class ColumnTag {
    @Autowired
    private GeneralColumnCacheService cmsColumnService;

    /**
     * 不涉及分页（树形菜单）
     * 
     * @param columnId
     * @return
     */
    public CmsColumn getMenuTreeById(long columnId) {
        return cmsColumnService.listCmsColumnsTreeById(columnId);
    }

    /**
     * 不涉及分页（树形菜单） 获取所有菜单
     * 
     * @param columnId
     * @return
     */
    public CmsColumn getMenuTreeById() {
        return cmsColumnService.listCmsColumnsTreeById(0L);
    }

    /**
     * 通过id获取导航信息
     * 
     * @param columnId
     * @return
     */
    public CmsColumn getCmsColumnId(long columnId) {
        return cmsColumnService.getCmsColumnById(columnId);
    }

    public List<CmsColumn> listCmsColumnById(long columnId) {
        return cmsColumnService.listCmsColumnsById(columnId);
    }

    /**
     * 获取所有菜单列表
     * 
     * @return
     */
    public List<CmsColumn> listCmsColumnAll() {

        return cmsColumnService.listCmsColumnsById(0L);
    }

}
