package com.oly.cms.general.taglib;

import java.util.List;

import com.oly.cms.common.domain.entity.CmsCat;
import com.oly.cms.general.service.cache.GeneralCategoryCacheService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 分类标签
 */
@Service("categoryTag")
public class CategoryTag {

    @Autowired
    private GeneralCategoryCacheService catCacheService;

    /**
     * 获取分类
     * 
     * @param catId
     * @return
     */
    public CmsCat getCatById(long catId) {
        return catCacheService.getCmsCatByCatId(catId);
    }

    /**
     * 
     * @param orderNum  排序
     * @param catType   类型
     * @param parentId  父ID
     * @param catId     节点ID
     * @param parent    节点类型
     * @param themeName 主题名字
     * @return
     */
    public List<CmsCat> listCmsCats(Long orderNum, Integer catType, Long parentId, Long catId, Integer parent,
            String themeName) {
        return catCacheService.listCmsCats(orderNum, catType, parentId, catId, parent, themeName);
    }

    /**
     * 
     * @param catType   标签类型
     * @param catId     标签Id
     * @param parent    节点类型
     * @param themeName 主题名字
     * @return
     */
    public List<CmsCat> listCmsCats(Integer catType, Long catId, Integer parent, String themeName) {

        return catCacheService.listCmsCats(null, catType, null, catId, parent, themeName);
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
    public CmsCat getCatsTree(Long orderNum, Integer catType, Long parentId, Long catId, Integer parent,
            String themeName) {
        return catCacheService.selectCmsCatsTrees(orderNum, catType, parentId, catId, parent, themeName);
    }

    /**
     * 分类树
     * 
     * @param catId
     * @param themeName
     * @return
     */
    public CmsCat getCatTreeById(long catId, String themeName) {
        return catCacheService.selectCmsCatsTrees(null, null, null, catId, null, themeName);
    }

    /**
     * 分类树
     * 
     * @param themeName
     * @return
     */
    public CmsCat getCatTreeByThemeName(String themeName) {
        return catCacheService.selectCmsCatsTrees(null, null, null, null, null, themeName);
    }

    /**
     * 分类树
     * 
     * @param catId
     * @param themeName
     * @return
     */
    public CmsCat getCatTreeById(long catId) {
        return catCacheService.selectCmsCatsTrees(null, null, null, catId, null, null);
    }

    /**
     * 通过分类id获取分类列表 包含自己及后代节点
     * 
     * @param catId
     * @param themeName 主题名字
     * @return
     */
    public List<CmsCat> listCategoryByCatId(long catId, String themeName) {
        return catCacheService.listCmsCats(null, null, null, catId, null, themeName);
    }

    /**
     * 儿子节点
     * 
     * @param catId
     * @param themeName 主题名字
     * @return
     */
    public List<CmsCat> listCategoryByParentId(long parentId, String themeName) {
        return catCacheService.listCmsCats(null, null, parentId, null, null, themeName);
    }

    /**
     * 
     * @param catType 类型
     * @param catId   分类Id
     * @return
     */
    public List<CmsCat> listCategoryByType(Integer catType, long catId) {
        return catCacheService.listCmsCats(null, catType, null, catId, null, null);
    }

    /**
     * 
     * @param orderNum  排序
     * @param catId     分类Id
     * @param themeName 主题名字
     * @return
     */
    public List<CmsCat> listCatsByOrderNum(Long orderNum, long catId, String themeName) {
        return catCacheService.listCmsCats(orderNum, null, null, catId, null, themeName);
    }

    /**
     * 
     * @param orderNum 排序
     * @param catId    分类Id
     * @return
     */
    public List<CmsCat> listCategoryByOrderNum(Long orderNum, long catId) {
        return catCacheService.listCmsCats(orderNum, null, null, catId, null, null);
    }

    /**
     * @param themeName 主题名
     * @return
     */
    public List<CmsCat> listCategoryByThemeName(String themeName) {
        return catCacheService.listCmsCats(null, null, null, null, null, themeName);
    }

    /**
     * 获取数量
     * 
     * @param themeName
     * @return
     */
    public int getCatNum(String themeName) {
        return catCacheService.getCatNum(themeName);
    }

    public List<CmsCat> listCmsCats(CmsCat cmsCat) {

        return catCacheService.listCmsCats(cmsCat);
    }

    public CmsCat getCmsCatsTree(CmsCat cmsCat) {

        return catCacheService.getCmsCatsTree(cmsCat);
    }

}
