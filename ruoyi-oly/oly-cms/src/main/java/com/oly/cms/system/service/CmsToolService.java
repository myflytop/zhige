package com.oly.cms.system.service;

import java.util.List;

import com.oly.cms.system.mapper.CmsToolMapper;

import com.oly.common.model.properties.OlyWebConfigProetries;
import com.oly.web.service.cache.BlogConfigCacheService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CmsToolService {
    @Autowired
    private CmsToolMapper cmsToolMapper;

    @Autowired
    private BlogConfigCacheService configBackService;

    public List<String> listCatIds(String beginTime,String themeName) {
        return cmsToolMapper.listCatIds(beginTime,configBackService.getBackConfigDefauleValue(themeName,OlyWebConfigProetries.ARTICLE_TYPES));
    }
    public List<String> listTagIds(String beginTime,String themeName) {
        return cmsToolMapper.listTagIds(beginTime, configBackService.getBackConfigDefauleValue(themeName, OlyWebConfigProetries.ARTICLE_TYPES));
    }
    public List<String> listPostIds(String beginTime,String themeName) {
        return cmsToolMapper.listPostIds(beginTime,configBackService.getBackConfigDefauleValue(themeName,OlyWebConfigProetries.ARTICLE_TYPES));
    }
}
