package com.oly.cms.admin.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.stereotype.Service;

import com.oly.cms.admin.mapper.CmsCatMapper;
import com.oly.cms.common.domain.entity.CmsCat;
import com.oly.cms.admin.service.ICmsCatService;
import com.oly.cms.common.constant.CacheConstant;
import com.oly.cms.common.event.CacheWebRefreshAllEvent;
import com.oly.cms.general.mapper.CategorySearchMapper;
import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.core.domain.Ztree;
import com.ruoyi.common.exception.ServiceException;

@Service
public class CmsCatServiceImpl implements ICmsCatService {

    @Autowired
    private CmsCatMapper cmsCatMapper;

    @Autowired
    private CategorySearchMapper categorySearchMapper;

    @Autowired
    private ApplicationEventPublisher app;

    @Override
    public int insertCmsCat(CmsCat cmsCat) {
        CmsCat ca = null;
        if (cmsCat.getParentId() != 0) { // 获取插入点信息
            ca = categorySearchMapper.selectCmsCatById(cmsCat.getParentId());
            // 非目录不允许插入
            if (ca == null || ca.getParent() == 1) {
                throw new ServiceException("插入点不存在,或者插入点非根节点");
            }
        }
        // 验证分类唯一
        if (UserConstants.UNIQUE.equals(checkCatUnique(cmsCat))) {
            if (ca == null) {
                cmsCat.setAncestors("0");
            } else {
                cmsCat.setAncestors(ca.getAncestors() + "," + cmsCat.getParentId());
            }
            int re = cmsCatMapper.insertCmsCat(cmsCat);
            app.publishEvent(new CacheWebRefreshAllEvent(this, CacheConstant.CATS_CACHE_KEY_PREFIX));
            return re;
        } else {
            throw new ServiceException("请检查路径或者分类名是否重复");
        }
    }

    @Override
    public int updateCmsCat(CmsCat cmsCat) {
        CmsCat ca = null;
        if (cmsCat.getParentId() != 0) { // 获取插入点信息
            ca = categorySearchMapper.selectCmsCatById(cmsCat.getParentId());
            // 非目录不允许插入
            if (ca == null || ca.getParent() == 1) {
                throw new ServiceException("插入点不存在,或者插入点非根节点");
            }
        }
        // 验证分类唯一
        if (UserConstants.UNIQUE.equals(checkCatUnique(cmsCat))) {
            if (ca == null) {
                cmsCat.setAncestors("0");
            } else {
                cmsCat.setAncestors(ca.getAncestors() + "," + cmsCat.getParentId());
            }
            int c = cmsCatMapper.updateCmsCat(cmsCat);
            // 同时更新子节点
            updateChildNode(cmsCat.getCatId(), cmsCat.getAncestors() + "," + cmsCat.getCatId());
            app.publishEvent(new CacheWebRefreshAllEvent(this, CacheConstant.CATS_CACHE_KEY_PREFIX));
            return c;
        } else {
            throw new ServiceException("请检查路径或者分类名是否重复");
        }

    }

    @Override
    public int deleteCmsCatById(Long catId) {
        int re = cmsCatMapper.deleteCmsCatById(catId);
        app.publishEvent(new CacheWebRefreshAllEvent(this, CacheConstant.CATS_CACHE_KEY_PREFIX));
        return re;
    }

    @Override
    public List<CmsCat> listCmsCatByCat(CmsCat cmsCat) {
        return categorySearchMapper.listCmsCats(cmsCat);
    }

    @Override
    public CmsCat selectCmsCatById(long catId) {
        return categorySearchMapper.selectCmsCatById(catId);
    }

    @Override
    public List<Ztree> catTreeData(CmsCat cmsCat) {

        List<CmsCat> catList = categorySearchMapper.listCmsCats(cmsCat);
        List<Ztree> ztrees = initZtree(catList);
        return ztrees;
    }

    @Override
    public String checkCatUnique(CmsCat cmsCat) {
        Long catId = cmsCat.getCatId() == null ? -1L : cmsCat.getCatId();
        CmsCat checkCat = categorySearchMapper.checkCatUnique(cmsCat);
        if (checkCat == null || checkCat.getCatId().longValue() == catId) {
            return UserConstants.UNIQUE;
        }
        return UserConstants.NOT_UNIQUE;
    }

    @Override
    public int countArticleByCatId(Long catId) {
        return cmsCatMapper.countArticleByCatId(catId);
    }

    @Override
    public List<CmsCat> listCmsCatByArticleId(Long articleId) {
        return categorySearchMapper.listCmsCatByArticleId(articleId);
    }

    @Override
    public int updateTagVisible(Long catId, Integer visible) {
        int re = cmsCatMapper.updateTagVisible(catId, visible);
        app.publishEvent(new CacheWebRefreshAllEvent(this, CacheConstant.CATS_CACHE_KEY_PREFIX));
        return re;
    }

    /**
     * 对象转菜单树
     *
     * @param catList 菜单列表
     * @return 树结构列表
     */
    public List<Ztree> initZtree(List<CmsCat> catList) {
        List<Ztree> ztrees = new ArrayList<Ztree>();
        for (CmsCat cat : catList) {
            Ztree ztree = new Ztree();
            ztree.setId(cat.getCatId());
            ztree.setpId(cat.getParentId());
            ztree.setName(cat.getCatName());
            ztree.setTitle(cat.getCatName());
            ztrees.add(ztree);
        }
        return ztrees;
    }

    private void updateChildNode(Long parentId, String ancestors) {
        if (updateAncestors(parentId, ancestors) > 0) {
            List<Long> lis = parentIds(parentId);
            if (lis != null) {
                for (int i = 0; i < lis.size(); i++) {
                    updateAncestors(lis.get(i), ancestors + "," + lis.get(i));
                }
            }
        }
    }

    /**
     * 根据父亲Id修改Ancestors 根据父亲Id获取子元素子节点，循环遍历
     * 
     * @param catId
     * @return
     */
    private List<Long> parentIds(long parentId) {
        return cmsCatMapper.listCatIdsById(parentId);
    }

    private int updateAncestors(Long parentId, String ancestors) {

        return cmsCatMapper.updateAncestors(parentId, ancestors);
    }

}
