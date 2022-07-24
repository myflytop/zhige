package com.oly.cms.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.stereotype.Service;

import com.oly.cms.admin.mapper.CmsTagMapper;
import com.oly.cms.common.domain.entity.CmsTag;
import com.oly.cms.admin.service.ICmsTagService;
import com.oly.cms.common.constant.CacheConstant;
import com.oly.cms.common.event.CacheWebRefreshAllEvent;
import com.oly.cms.general.mapper.TagSearchMapper;
import com.ruoyi.common.constant.UserConstants;

@Service
public class CmsTagServiceImpl implements ICmsTagService {

    @Autowired
    private CmsTagMapper cmsTagMapper;

    @Autowired
    private TagSearchMapper tagSearchMapper;

    @Autowired
    private ApplicationEventPublisher app;

    @Override
    public int insertCmsTag(CmsTag cmsTag) {
        int re = cmsTagMapper.insertCmsTag(cmsTag);
        app.publishEvent(new CacheWebRefreshAllEvent(this, CacheConstant.TAGS_CACHE_KEY_PREFIX));
        return re;

    }

    @Override
    public int insertCmsTags(List<CmsTag> cmsTags) {
        int re = cmsTagMapper.insertCmsTags(cmsTags);
        app.publishEvent(new CacheWebRefreshAllEvent(this, CacheConstant.TAGS_CACHE_KEY_PREFIX));
        return re;

    }

    @Override
    public int deleteCmsTagById(long tagId) {
        int re = cmsTagMapper.deleteCmsTagById(tagId);
        app.publishEvent(new CacheWebRefreshAllEvent(this, CacheConstant.TAGS_CACHE_KEY_PREFIX));
        return re;

    }

    @Override
    public int deleteCmsTagByIds(Long[] tagIds) {
        int index = 0;
        for (Long tagId : tagIds) {
            if (cmsTagMapper.deleteCmsTagById(tagId) == 1) {
                index += 1;
            }
        }
        app.publishEvent(new CacheWebRefreshAllEvent(this, CacheConstant.TAGS_CACHE_KEY_PREFIX));
        return index;
    }

    @Override
    public int updateCmsTagById(CmsTag cmsTag) {
        int re = cmsTagMapper.updateCmsTagById(cmsTag);
        app.publishEvent(new CacheWebRefreshAllEvent(this, CacheConstant.TAGS_CACHE_KEY_PREFIX));
        return re;

    }

    @Override
    public CmsTag selectCmsTagById(long tagId) {
        return tagSearchMapper.selectCmsTagById(tagId);
    }

    @Override
    public String checkTagUnique(CmsTag cmsTag) {
        CmsTag checkTag = tagSearchMapper.checkTagUnique(cmsTag);
        Long tagId = cmsTag.getTagId() == null ? -1L : cmsTag.getTagId();
        if (checkTag == null || checkTag.getTagId().longValue() == tagId.longValue()) {
            return UserConstants.UNIQUE;
        }
        return UserConstants.NOT_UNIQUE;
    }

    @Override
    public List<CmsTag> listCmsTagByArticleId(Long articleId) {
        return tagSearchMapper.listCmsTagByArticleId(articleId);
    }

    @Override
    public int updateTagVisible(Long[] ids, Integer b) {
        int re = cmsTagMapper.updateTagVisible(ids, b);
        app.publishEvent(new CacheWebRefreshAllEvent(this, CacheConstant.TAGS_CACHE_KEY_PREFIX));
        return re;

    }

    @Override
    public List<CmsTag> listCmsTagByTag(CmsTag cmsTag) {
        return tagSearchMapper.listCmsTags(cmsTag);
    }

}
