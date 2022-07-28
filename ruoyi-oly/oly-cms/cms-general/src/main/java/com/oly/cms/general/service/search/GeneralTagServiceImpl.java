package com.oly.cms.general.service.search;

import java.util.List;

import com.oly.cms.common.domain.entity.CmsTag;
import com.oly.cms.common.model.properties.OlyWebConfigProperties;
import com.oly.cms.general.mapper.TagSearchMapper;
import com.oly.cms.general.service.IGeneralSearchService;
import com.ruoyi.common.enums.CommonVisibleEnums;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.config.service.ISysConfigService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GeneralTagServiceImpl implements IGeneralSearchService {

    @Autowired
    private TagSearchMapper tsgSearchMapper;

    @Autowired
    private ISysConfigService configService;

    public List<CmsTag> listCmsTags(CmsTag cmsTag) {
        cmsTag.setVisible(CommonVisibleEnums.SHOW.ordinal());
        setSupportType(cmsTag, cmsTag.getSearchValue());
        return tsgSearchMapper.listCmsTags(cmsTag);
    }

    public CmsTag getCmsTagByTagId(long tagId) {
        return tsgSearchMapper.selectCmsTagById(tagId);
    }

    public List<CmsTag> listCmsTags(Integer tagType, Long orderNum, String themeName) {
        CmsTag cmsTag = new CmsTag();
        cmsTag.setTagType(tagType);
        cmsTag.setOrderNum(orderNum);
        cmsTag.setSearchValue(themeName);
        return this.listCmsTags(cmsTag);
    }

    private void setSupportType(CmsTag cmsTag, String themeName) {
        if (StringUtils.isEmpty(themeName)) {
            return;
        }
        String supportType = configService.selectConfigDefauleValue(themeName, OlyWebConfigProperties.ARTICLE_TYPES);
        if (StringUtils.isNotEmpty(supportType)) {
            cmsTag.getParams().put("supportType", supportType);
        }

    }

}