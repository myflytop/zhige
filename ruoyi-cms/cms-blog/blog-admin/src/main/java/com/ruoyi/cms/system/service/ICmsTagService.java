package com.ruoyi.cms.system.service;

import com.ruoyi.cms.system.model.po.CmsTag;
import com.ruoyi.cms.system.model.vo.TagCountVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ICmsTagService {
    /**
     * 插入单条
     * @param cmsTag
     * @return
     */
    int insertCmsTag(CmsTag cmsTag);

    /**
     * 插入批量
     * @param cmsTags
     * @return
     */
    int insertCmsTags(List<CmsTag> cmsTags);

    /**
     * 通过id删除
     * @param tagId
     * @return
     */
    int deleteCmsTagById(Long tagId);

    /**
     * 通过id批量删除
     * @param tagIds
     * @return
     */
    int deleteCmsTagByIds(Long[] tagIds);

    /**
     * 单条更新
     * @param cmsTag
     * @return
     */
    int updateCmsTagById(CmsTag cmsTag);

    /**
     * 获取单条
     * @param tagId
     * @return
     */
    CmsTag getCmsTagById(Long tagId);

    /**
     *  包含统计
     * @param tagId
     * @return
     */
    TagCountVo getCmsTagCountById(Long tagId);

    /**
     * 批量获取
     * @param cmsTag
     * @return
     */
    List<CmsTag> listCmsTag(CmsTag cmsTag);

    /**
     * 包含统计
     * @param cmsTag
     * @return
     */
    List<TagCountVo> listCmsTagCountByTag(CmsTag cmsTag);

    /**
     * 检查标签名唯一
     * @param cmsTag
     * @return
     */
    String checkTagNameUnique(CmsTag cmsTag);

    /**
     * 检查标签路径唯一
     * @param cmsTag
     * @return
     */
    String checkTagUrlUnique(CmsTag cmsTag);

    /**
     * 获取标签列表
     * 文章关联标签
     * @param articleId
     * @return
     */
    List<CmsTag> listCmsTagByArticleTagId(Long articleId);

    int updateTagVisible(Long[] ids, Byte b);

    /**
     * 获取没有隐藏的列表
     * @return
     */
    List<CmsTag> listCmsTag();


    /**
     * 获取没有隐藏的列表 带文章统计
     * @param cmsTag
     * @return
     */
    List<TagCountVo> listTagCountVoByTag(CmsTag cmsTag);

    /**
     * 获取没有隐藏的列表 带文章统计
     * @return
     */
    List<TagCountVo> listTagCountVo();
}
