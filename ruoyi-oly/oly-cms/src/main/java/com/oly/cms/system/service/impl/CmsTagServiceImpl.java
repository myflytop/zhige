package com.oly.cms.system.service.impl;

import com.oly.cms.system.mapper.CmsTagMapper;
import com.oly.cms.system.model.CmsConstants;
import com.oly.cms.system.model.po.CmsTag;
import com.oly.cms.system.service.ICmsTagService;
import com.oly.common.constant.CacheConstant;
import com.oly.framework.event.CacheWebRefreshEvent;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CmsTagServiceImpl implements ICmsTagService {

    @Autowired
    private CmsTagMapper cmsTagMapper;

    @Autowired
    private ApplicationEventPublisher app;

    @Override
    public int insertCmsTag(CmsTag cmsTag) {
        int re=cmsTagMapper.insertCmsTag(cmsTag);
        app.publishEvent(new CacheWebRefreshEvent(this,CacheConstant.TAGS_CACHE_KEY_PREFIX));
        return re;
     
    }

    @Override
    public int insertCmsTags(List<CmsTag> cmsTags) {
        int re=cmsTagMapper.insertCmsTags(cmsTags);
        app.publishEvent(new CacheWebRefreshEvent(this,CacheConstant.TAGS_CACHE_KEY_PREFIX));
        return re;
        
    }

    @Override
    public int deleteCmsTagById(Long tagId) {
        int re=cmsTagMapper.deleteCmsTagById(tagId);
        app.publishEvent(new CacheWebRefreshEvent(this,CacheConstant.TAGS_CACHE_KEY_PREFIX));
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
        app.publishEvent(new CacheWebRefreshEvent(this,CacheConstant.TAGS_CACHE_KEY_PREFIX));
        return index;
    }

    @Override
    public int updateCmsTagById(CmsTag cmsTag) {
        int re=cmsTagMapper.updateCmsTagById(cmsTag);
        app.publishEvent(new CacheWebRefreshEvent(this,CacheConstant.TAGS_CACHE_KEY_PREFIX));
        return re;
      
    }

    @Override
    public CmsTag getCmsTagById(Long tagId) {
        return cmsTagMapper.getCmsTagById(tagId);
    }

    @Override
    public String checkTagNameUnique(CmsTag cmsTag) {
        if (cmsTagMapper.checkTagNameUnique(cmsTag.getTagName(), cmsTag.getTagId()) == 0) {
            return CmsConstants.UNIQUE;
        }
        return CmsConstants.NOT_UNIQUE;
    }

    @Override
    public String checkTagUrlUnique(CmsTag cmsTag) {
        if (cmsTag.getTagUrl() == null || "".equals(cmsTag.getTagUrl())) {
            return CmsConstants.UNIQUE;
        }
        if (cmsTagMapper.checkTagUrlUnique(cmsTag.getTagUrl(), cmsTag.getTagId()) == 0) {
            return CmsConstants.UNIQUE;
        }
        return CmsConstants.NOT_UNIQUE;
    }

    @Override
    public List<CmsTag> listCmsTagByArticleId(Long articleId) {
        return cmsTagMapper.listCmsTagByArticleId(articleId);
    }

    @Override
    public int updateTagVisible(Long[] ids, Byte b) {
        int re=cmsTagMapper.updateTagVisible(ids, b);
        app.publishEvent(new CacheWebRefreshEvent(this,CacheConstant.TAGS_CACHE_KEY_PREFIX));
        return re;
  
    }

    @Override
    public List<CmsTag> listCmsTagByTag(CmsTag cmsTag) {       
        return cmsTagMapper.listCmsTagByTag(cmsTag);
    }

}
