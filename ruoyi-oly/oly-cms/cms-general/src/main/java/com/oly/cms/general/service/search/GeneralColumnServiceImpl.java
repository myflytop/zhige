package com.oly.cms.general.service.search;

import java.util.List;

import com.oly.cms.common.domain.entity.CmsColumn;
import com.oly.cms.general.mapper.ColumnSearchMapper;
import com.oly.cms.general.service.IGeneralSearchService;
import com.oly.cms.general.utils.tree.MenuTreeUtils;
import com.ruoyi.common.enums.CommonVisibleEnums;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GeneralColumnServiceImpl implements IGeneralSearchService {
    @Autowired
    private ColumnSearchMapper columnSearchMapper;

    public CmsColumn getCmsColumnByMenuId(long columnId) {

        return columnSearchMapper.selectCmsColumnById(columnId);
    }

    public List<CmsColumn> listCmsColumns(CmsColumn cmsColumn) {

        return columnSearchMapper.listCmsColumns(cmsColumn);
    }

    /**
     * 获取节点及所有子节点
     * 
     * @param menuId
     * @return
     */
    public List<CmsColumn> listCmsColumnsById(long menuId) {
        CmsColumn cmsColumn = new CmsColumn();
        cmsColumn.setVisible(CommonVisibleEnums.SHOW.ordinal());
        cmsColumn.setColumnId(menuId);
        return this.listCmsColumns(cmsColumn);
    }

    /**
     * 转化为树
     * 
     * @param menuId
     * @return
     */
    public CmsColumn listCmsColumnsTreeById(long menuId) {
        return MenuTreeUtils.getColumnTree(this.listCmsColumnsById(menuId), menuId);
    }

    public CmsColumn listCmsColumnsTree(CmsColumn cmsColumn) {
        if (cmsColumn != null && cmsColumn.getColumnId() != null) {
            cmsColumn.setColumnId(0L);
        }
        return MenuTreeUtils.getColumnTree(this.listCmsColumns(cmsColumn), cmsColumn.getColumnId());
    }

}
