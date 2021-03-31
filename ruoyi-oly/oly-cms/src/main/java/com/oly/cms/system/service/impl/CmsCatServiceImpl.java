package com.oly.cms.system.service.impl;

import com.oly.cms.system.mapper.CmsCatMapper;
import com.oly.cms.system.model.CmsConstants;
import com.oly.cms.system.model.po.CmsCat;
import com.oly.cms.system.service.ICmsCatService;
import com.ruoyi.common.core.domain.Ztree;
import com.ruoyi.common.exception.BusinessException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CmsCatServiceImpl implements ICmsCatService {

    @Autowired
    private CmsCatMapper cmsCatMapper;

    @Override
    public int insertCmsCat(CmsCat cmsCat) {
        CmsCat ca = null;
        if (cmsCat.getParentId() != 0) { // 获取插入点信息
            ca = cmsCatMapper.getCmsCatById(cmsCat.getParentId());
            // 非目录不允许插入
            if (ca == null || ca.getParent() == 1) {
                throw new BusinessException("插入点不存在,或者插入点非根节点");
            }
        }
        // 判断当前类目下类目是否重复
        if (CmsConstants.UNIQUE.equals(checkCatNameUnique(cmsCat))) {
            // 判断路径是否重复
            if (CmsConstants.UNIQUE.equals(checkCatUrlUnique(cmsCat))) {
                if (ca == null) {
                    cmsCat.setAncestors("0");
                } else {
                    cmsCat.setAncestors(ca.getAncestors() + "," + cmsCat.getParentId());
                }

                return cmsCatMapper.insertCmsCat(cmsCat);
            }
        }
        throw new BusinessException("请检查路径或者分类名是否重复");
    }

    @Override
    public int insertCmsCats(List<CmsCat> cmsCats) {
        return cmsCatMapper.insertCmsCats(cmsCats);
    }

    @Override
    public int updateCmsCat(CmsCat cmsCat) {
        CmsCat ca = null;
        if (cmsCat.getParentId() != 0) { // 获取插入点信息
            ca = cmsCatMapper.getCmsCatById(cmsCat.getParentId());
            // 非目录不允许插入
            if (ca == null || ca.getParent() == 1) {
                throw new BusinessException("插入点不存在,或者插入点非根节点");
            }
        }
        // 判断当前类目下类目是否重复
        if (CmsConstants.UNIQUE.equals(checkCatNameUnique(cmsCat))) {
            // 判断路径是否重复
            if (CmsConstants.UNIQUE.equals(checkCatUrlUnique(cmsCat))) {
                if (ca == null) {
                    cmsCat.setAncestors("0");
                } else {
                    cmsCat.setAncestors(ca.getAncestors() + "," + cmsCat.getParentId());
                }
                int c = cmsCatMapper.updateCmsCat(cmsCat);
                // 同时更新子节点
                updateChildNode(cmsCat.getCatId(), cmsCat.getAncestors() + "," + cmsCat.getCatId());
                return c;
            }
        }
        throw new BusinessException("请检查路径或者分类名是否重复");
    }

    @Override
    public int deleteCmsCatById(Long catId) {
        return cmsCatMapper.deleteCmsCatById(catId);
    }

    @Override
    public List<CmsCat> listCmsCatByCat(CmsCat cmsCat) {
        return cmsCatMapper.listCmsCatByCat(cmsCat);
    }

    @Override
    public CmsCat getCmsCatById(Long catId) {
        return cmsCatMapper.getCmsCatById(catId);
    }

    @Override
    public List<Ztree> catTreeData(Byte b) {
        CmsCat cmsCat = new CmsCat();
        cmsCat.setParent((b));
        List<CmsCat> catList = cmsCatMapper.listCmsCatByCat(cmsCat);
        List<Ztree> ztrees = initZtree(catList);
        return ztrees;
    }

    @Override
    public List<CmsCat> listCmsCatByParentId(Long parentId) {
        return cmsCatMapper.listCmsCatByParentId(parentId);
    }

    @Override
    public String getCatNameById(Long catId) {
        return cmsCatMapper.getCatNameById(catId);
    }

    @Override
    public int countCatByParentId(Long catId) {
        return cmsCatMapper.countCatByParentId(catId);
    }

    @Override
    public String checkCatNameUnique(CmsCat cmsCat) {
        if (cmsCatMapper.checkCatNameUnique(cmsCat.getParentId(), cmsCat.getCatName(), cmsCat.getCatId()) == 0) {
            return CmsConstants.UNIQUE;
        }
        return CmsConstants.NOT_UNIQUE;
    }

    @Override
    public String checkCatUrlUnique(CmsCat cmsCat) {
        if (cmsCat.getCatUrl() == null || "".equals(cmsCat.getCatUrl())) {
            return CmsConstants.UNIQUE;
        }
        if (cmsCatMapper.checkCatUrlUnique(cmsCat.getCatId(), cmsCat.getCatUrl()) == 0) {
            return CmsConstants.UNIQUE;
        }
        return CmsConstants.NOT_UNIQUE;
    }

    @Override
    public int countArticleByCatId(Long catId) {
        return cmsCatMapper.countArticleByCatId(catId);
    }

    @Override
    public List<CmsCat> listCmsCatByArticleId(Long articleId) {
        return cmsCatMapper.listCmsCatByArticleId(articleId);
    }

    @Override
    public int updateTagVisible(Long catId, Byte visible) {
        return cmsCatMapper.updateTagVisible(catId, visible);
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

    private boolean checkPam() {

        return true;
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
    private List<Long> parentIds(Long catId) {
        return cmsCatMapper.listCatIdsById(catId);
    }

    private int updateAncestors(Long parentId, String ancestors) {

        return cmsCatMapper.updateAncestors(parentId, ancestors);
    }
}
