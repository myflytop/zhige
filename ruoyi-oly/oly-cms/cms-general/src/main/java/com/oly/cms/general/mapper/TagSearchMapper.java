package com.oly.cms.general.mapper;

import java.util.List;

import com.oly.cms.common.domain.entity.CmsTag;

public interface TagSearchMapper {
    /**
     * 获取标签列表
     * 
     * @param cmsTag
     * @return
     */
    List<CmsTag> listCmsTags(CmsTag cmsTag);

    /**
     * 获取标签信息
     * 
     * @param tagId
     * @return
     */
    CmsTag selectCmsTagById(long tagId);

    /**
     * 获取标签信息
     * 
     * @param tagUrl
     * @return
     */
    CmsTag selectCmsTagByUrl(String tagUrl);

    /**
     * 获取标签列表 文章关联标签
     * 
     * @param articleId
     * @return
     */
    List<CmsTag> listCmsTagByArticleId(long articleId);

    /**
     * 验证标签唯一
     * 
     * @param cmsTag
     * @return
     */
    CmsTag checkTagUnique(CmsTag cmsTag);

}
