package com.oly.cms.general.service.impl;

import com.github.pagehelper.PageHelper;
import com.oly.cms.common.model.properties.OlyWebConfigProperties;
import com.oly.cms.general.mapper.GeneralArticleSortMapper;
import com.oly.cms.common.domain.entity.CmsArticleCount;
import com.oly.cms.general.service.IGeneralArticleSortService;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.config.service.ISysConfigService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 文章排序相关
 */
@Service
public class GeneralArticleSortServiceImpl implements IGeneralArticleSortService {

    @Autowired
    private GeneralArticleSortMapper webArticleSortMapper;

    @Autowired
    private ISysConfigService configService;

    @Override
    public List<CmsArticleCount> listArticlesCountSort(String themeName) {
        return webArticleSortMapper.listArticlesCountSort(themeName);
    }

    @Override
    public List<CmsArticleCount> listArticlesCountSort(int num, int size, String order, String themeName) {
        themeName = getThemeName(themeName);
        PageHelper.startPage(num, size, order);
        return this.listArticlesCountSort(themeName);
    }

    private String getThemeName(String themeName) {
        if (StringUtils.isEmpty(themeName)) {
            return "";
        }
        return StringUtils
                .isEmpty(configService.selectConfigDefauleValue(themeName, OlyWebConfigProperties.ARTICLE_TYPES)) ? ""
                        : themeName;
    }

}
