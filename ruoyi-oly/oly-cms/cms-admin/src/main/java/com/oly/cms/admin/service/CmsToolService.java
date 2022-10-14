package com.oly.cms.admin.service;

import java.util.List;

import com.oly.cms.admin.mapper.CmsToolMapper;
import com.oly.cms.common.model.properties.OlyWebConfigProperties;
import com.ruoyi.system.config.service.ISysConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CmsToolService {
    @Autowired
    private CmsToolMapper cmsToolMapper;

    @Autowired
    private ISysConfigService configService;

    public List<String> listCatIds(String beginTime, String themeName) {

        return cmsToolMapper.listCatIds(beginTime,
                configService.selectConfigDefaultValue(themeName, OlyWebConfigProperties.ARTICLE_TYPES));
    }

    public List<String> listTagIds(String beginTime, String themeName) {
        return cmsToolMapper.listTagIds(beginTime,
                configService.selectConfigDefaultValue(themeName, OlyWebConfigProperties.ARTICLE_TYPES));
    }

    public List<String> listPostIds(String beginTime, String themeName) {
        return cmsToolMapper.listPostIds(beginTime,
                configService.selectConfigDefaultValue(themeName, OlyWebConfigProperties.ARTICLE_TYPES));
    }
}
