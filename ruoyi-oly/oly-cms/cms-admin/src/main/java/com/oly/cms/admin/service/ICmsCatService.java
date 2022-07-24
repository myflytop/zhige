package com.oly.cms.admin.service;

import com.oly.cms.common.domain.entity.CmsCat;
import com.ruoyi.common.core.domain.Ztree;

import java.util.List;

public interface ICmsCatService {
    /**
     * 添加类目
     * 
     * @param cmsCat
     * @return
     */
    int insertCmsCat(CmsCat cmsCat);

    /**
     * 修改类目
     * 
     * @param cmsCat
     * @return
     */
    int updateCmsCat(CmsCat cmsCat);

    /**
     * 删除单个类目导航
     * 
     * @param catId
     * @return
     */
    int deleteCmsCatById(Long catId);

    /**
     * 获取列表
     * 
     * @param cmsCat
     * @return
     */
    List<CmsCat> listCmsCatByCat(CmsCat cmsCat);

    /**
     * 获取一条类目 所有字段
     * 
     * @param catId
     * @return
     */
    CmsCat selectCmsCatById(long catId);

    /**
     * 获取目录树
     * 
     * @param cmsCat
     * @return
     */
    List<Ztree> catTreeData(CmsCat cmsCat);

    /**
     * 验证同类目下类目名唯一
     * 
     * @param cmsCat
     * @return
     */
    String checkCatUnique(CmsCat cmsCat);

    /**
     * 统计关联文章
     * 
     * @param catId
     * @return
     */
    int countArticleByCatId(Long catId);

    /**
     * 获取类目列表通过文章id 文章关联类目
     * 
     * @param articleId
     * @return
     */
    List<CmsCat> listCmsCatByArticleId(Long articleId);

    /**
     * 更新分类状态
     * 
     * @param catId
     * @param visible
     * @return
     */
    int updateTagVisible(Long catId, Integer visible);
}
