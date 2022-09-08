package com.oly.cms.general.taglib;

import java.util.List;

import com.oly.cms.common.domain.entity.CmsTag;
import com.oly.cms.general.service.cache.GeneralTagCacheService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 如果为列表，默认获取第一页
 */
@Service("tagTag")
public class TagTag {
    @Autowired
    private GeneralTagCacheService tagCacheService;

    /****
     * 通过id获取标签信息
     * 
     * @param tagId 标签ID
     * @return
     */
    public CmsTag getTagById(long tagId) {
        return tagCacheService.getCmsTagByTagId(tagId);
    }

    /**
     * 
     * @param tagType
     * @param themeName 主题名
     * @return
     */
    public List<CmsTag> listTagByType(Integer tagType, String themeName) {
        return this.listTagByTypeAndOrderNum(tagType, null, themeName);
    }

    /**
     * 获取推荐标签
     * 
     * @param orderNum  排序
     * @param themeName 主题名字
     * @return
     */
    public List<CmsTag> listTagByOrderNum(Long orderNum, String themeName) {
        return this.listTagByTypeAndOrderNum(null, orderNum, themeName);
    }

    /**
     * 获取推荐标签
     * 
     * @param themeName 主题名字
     * @return
     */
    public List<CmsTag> listTagByThemeName(String themeName) {
        return this.listTagByTypeAndOrderNum(null, null, themeName);
    }

    /**
     * @param tagType   类型
     * @param orderNum  排序
     * @param themeName 主题名字
     * @return
     */
    public List<CmsTag> listTagByTypeAndOrderNum(Integer tagType, Long orderNum, String themeName) {
        return tagCacheService.listCmsTagsByTypeAndOrderNum(tagType, orderNum, themeName);
    }

    /**
     * 获取数量
     * 
     * @param themeName
     * @return
     */
    public int getTagNum(String themeName) {
        return tagCacheService.getTagNum(themeName);
    }

    public boolean checkSupportTag(String themeName, long tagId) {
        return tagCacheService.checkSupportTag(themeName, tagId);

    }

    public List<CmsTag> listCmsTags(CmsTag cmsTag) {
        return tagCacheService.listCmsTags(cmsTag);
    }
}
