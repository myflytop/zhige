package com.oly.cms.general.mapper;

import java.util.List;

import com.oly.cms.common.domain.entity.CmsCat;

public interface CategorySearchMapper {
    /**
     * 获取分类列表
     * 
     * @param webCat
     * @return
     */
    List<CmsCat> listCmsCats(CmsCat cmsCat);

    /**
     * 获取分类信息
     * 
     * @param catId
     * @return
     */
    CmsCat selectCmsCatById(long catId);

    /**
     * 获取分类信息
     * 
     * @param catUrl
     * @return
     */
    CmsCat selectCmsCatByUrl(String catUrl);

    /**
     * 如果路径不为空，路径不允许重复
     * 同级目录下分类名不能重复
     * 
     * @param cmsCat
     * @return
     */
    CmsCat checkCatUnique(CmsCat cmsCat);

    /**
     * 通过文章id获取文章关联列表
     * 
     * @param articleId
     * @return
     */
    List<CmsCat> listCmsCatByArticleId(Long articleId);

}
