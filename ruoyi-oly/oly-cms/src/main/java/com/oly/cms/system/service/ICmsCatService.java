package com.oly.cms.system.service;

import com.oly.cms.system.model.po.CmsCat;
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
     * 批量添加类目
     * 
     * @param cmsCats
     * @return
     */
    int insertCmsCats(List<CmsCat> cmsCats);

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
	 * 获取没有隐藏目录
	 * @return
	 */
	List<CmsCat> listCmsCatNotHide(CmsCat cmsCat);

    /**
     * 获取一条类目 所有字段
     * 
     * @param catId
     * @return
     */
    CmsCat getCmsCatById(Long catId);

    /**
     * 获取目录树
     * 
     * @param b 1目录 0非目录
     * @return
     */
    List<Ztree> catTreeData(Byte b);

    /**
     * 获取类目子列表 所有字段
     * 
     * @param parentId
     * @return
     */
    List<CmsCat> listCmsCatByParentId(Long parentId);

    /**
     * 获取类目名
     * 
     * @param catId
     * @return
     */
    String getCatNameById(Long catId);

    /**
     * 统计是否存在子节点的
     * 
     * @param parentId
     * @return
     */
    int countCatByParentId(Long parentId);

    /**
     * 验证同类目下类目名唯一
     * 
     * @param cmsCat
     * @return
     */
    String checkCatNameUnique(CmsCat cmsCat);

    /**
     * 验证路径
     * 
     * @param cmsCat
     * @return
     */
    String checkCatUrlUnique(CmsCat cmsCat);

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
     * @param catId
     * @param visible
     * @return
     */
    int updateTagVisible(Long catId, Integer visible);
}
