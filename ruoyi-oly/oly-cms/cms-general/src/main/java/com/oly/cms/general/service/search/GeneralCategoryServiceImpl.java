package com.oly.cms.general.service.search;

import java.util.List;

import com.oly.cms.common.domain.entity.CmsCat;
import com.oly.cms.common.model.properties.OlyWebConfigProperties;
import com.oly.cms.general.mapper.CategorySearchMapper;
import com.oly.cms.general.service.IGeneralSearchService;
import com.oly.cms.general.utils.tree.CategoryTreeUtils;
import com.ruoyi.common.enums.CommonVisibleEnums;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.config.service.ISysConfigService;

import org.apache.commons.lang3.ArrayUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GeneralCategoryServiceImpl implements IGeneralSearchService {
    @Autowired
    private CategorySearchMapper categorySearchMapper;

    @Autowired
    private ISysConfigService configService;

    public CmsCat getCmsCatByCatId(Long catId) {

        return categorySearchMapper.selectCmsCatById(catId);
    }

    /**
     * 获取分类列表
     * 
     * @param cmsCat
     * @return
     */
    public List<CmsCat> listCmsCats(CmsCat cmsCat) {
        cmsCat.setVisible(CommonVisibleEnums.SHOW.ordinal());
        setSupportType(cmsCat, cmsCat.getSearchValue());
        return categorySearchMapper.listCmsCats(cmsCat);
    }

    public CmsCat selectCmsCatsTree(CmsCat cmsCat) {
        if (cmsCat == null || cmsCat.getCatId() == null) {
            cmsCat.setCatId(0L);
        }
        return CategoryTreeUtils.getCatTree(this.listCmsCats(cmsCat), cmsCat.getCatId());
    }

    /**
     * 
     * @param orderNum
     * @param catType
     * @param parentId
     * @param catId
     * @param themeName
     * @return
     */
    public List<CmsCat> listCmsCats(Long orderNum, Integer catType, Long parentId, Long catId, Integer parent,
            String themeName) {
        CmsCat cmsCat = new CmsCat();
        cmsCat.setOrderNum(orderNum);
        cmsCat.setCatId(catId);
        cmsCat.setCatType(catType);
        cmsCat.setParentId(parentId);
        cmsCat.setParent(parent);
        cmsCat.setSearchValue(themeName);
        return this.listCmsCats(cmsCat);
    }

    /**
     * 
     * @param orderNum
     * @param catType
     * @param parentId
     * @param catId
     * @param parent
     * @param themeName
     * @return
     */
    public CmsCat selectCmsCatsTrees(Long orderNum, Integer catType, Long parentId, Long catId, Integer parent,
            String themeName) {
        return CategoryTreeUtils.getCatTree(this.listCmsCats(orderNum, catType, parentId, catId, parent, themeName),
                catId == null ? 0L : catId);
    }

    public int getCatNum(String themeName) {
        String supportType = configService.selectConfigDefaultValue(themeName, OlyWebConfigProperties.ARTICLE_TYPES);
        return categorySearchMapper.getCatNum(supportType);
    }

    private void setSupportType(CmsCat cmsCat, String themeName) {
        if (StringUtils.isEmpty(themeName)) {
            return;
        }
        String supportType = configService.selectConfigDefaultValue(themeName, OlyWebConfigProperties.ARTICLE_TYPES);
        if (StringUtils.isNotEmpty(supportType)) {
            cmsCat.getParams().put("supportType", supportType);
        }
    }

    public boolean checkSupportCat(String themeName, long catId) {
        CmsCat cat = categorySearchMapper.selectCmsCatById(catId);
        if (cat != null) {
            String[] types = StringUtils.split(
                    configService.selectConfigDefaultValue(themeName, OlyWebConfigProperties.ARTICLE_TYPES), ",");
            if (StringUtils.isEmpty(types) || ArrayUtils.contains(types, cat.getCatType().toString())) {
                return true;
            }
        }
        return false;
    }

}
