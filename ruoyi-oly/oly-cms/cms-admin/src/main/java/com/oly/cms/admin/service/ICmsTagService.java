package com.oly.cms.admin.service;

import com.oly.cms.common.domain.entity.CmsTag;
import java.util.List;

public interface ICmsTagService {
    /**
     * 插入单条
     * 
     * @param cmsTag
     * @return
     */
    int insertCmsTag(CmsTag cmsTag);

    /**
     * 插入批量
     * 
     * @param cmsTags
     * @return
     */
    int insertCmsTags(List<CmsTag> cmsTags);

    /**
     * 通过id删除
     * 
     * @param tagId
     * @return
     */
    int deleteCmsTagById(long tagId);

    /**
     * 通过id批量删除
     * 
     * @param tagIds
     * @return
     */
    int deleteCmsTagByIds(Long[] tagIds);

    /**
     * 单条更新
     * 
     * @param cmsTag
     * @return
     */
    int updateCmsTagById(CmsTag cmsTag);

    /**
     * 获取单条
     * 
     * @param tagId
     * @return
     */
    CmsTag selectCmsTagById(long tagId);

    /**
     * 批量获取
     * 
     * @param cmsTag
     * @return
     */
    List<CmsTag> listCmsTagByTag(CmsTag cmsTag);

    /**
     * 检查标唯一
     * 
     * @param cmsTag
     * @return
     */
    String checkTagUnique(CmsTag cmsTag);

    /**
     * 通过文章Id获取关联标签列表
     * 
     * @param articleId
     * @return
     */
    List<CmsTag> listCmsTagByArticleId(Long articleId);

    int updateTagVisible(Long[] ids, Integer b);

}
