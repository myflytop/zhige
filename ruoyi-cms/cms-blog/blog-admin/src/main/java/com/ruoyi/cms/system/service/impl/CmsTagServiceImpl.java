package com.ruoyi.cms.system.service.impl;

import com.ruoyi.cms.system.mapper.CmsTagMapper;
import com.ruoyi.cms.system.model.CmsConstants;
import com.ruoyi.cms.system.model.po.CmsTag;
import com.ruoyi.cms.system.model.vo.TagCountVo;
import com.ruoyi.cms.system.service.ICmsTagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CmsTagServiceImpl implements ICmsTagService {

    @Autowired
    private CmsTagMapper cmsTagMapper;
    @Override
    public int insertCmsTag(CmsTag cmsTag) {

        return cmsTagMapper.insertCmsTag(cmsTag);
    }

    @Override
    public int insertCmsTags(List<CmsTag> cmsTags) {
        return cmsTagMapper.insertCmsTags(cmsTags);
    }

    @Override
    public int deleteCmsTagById(Long tagId) {
        return cmsTagMapper.deleteCmsTagById(tagId);
    }

    @Override
    public int deleteCmsTagByIds(Long[] tagIds) {
        int index=0;
        for (Long tagId:tagIds) {
            if (cmsTagMapper.deleteCmsTagById(tagId)==1)
            {
                index+=1;
            }
        }
        return index;
    }

    @Override
    public int updateCmsTagById(CmsTag cmsTag) {
        return cmsTagMapper.updateCmsTagById(cmsTag);
    }

    @Override
    public CmsTag getCmsTagById(Long tagId) {
        return cmsTagMapper.getCmsTagById(tagId);
    }

    @Override
    public TagCountVo getCmsTagCountById(Long tagId) {
        return cmsTagMapper.getCmsTagCountById(tagId);
    }

    @Override
    public List<CmsTag> listCmsTag(CmsTag cmsTag) {
        return cmsTagMapper.listCmsTag(cmsTag);
    }

    @Override
    public List<TagCountVo> listCmsTagCountByTag(CmsTag cmsTag) {
        return cmsTagMapper.listCmsTagCountByTag(cmsTag);
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
        if (cmsTag.getTagUrl()==null||"".equals(cmsTag.getTagUrl()))
        {
            return CmsConstants.UNIQUE;
        }
        if (cmsTagMapper.checkTagUrlUnique(cmsTag.getTagUrl(),cmsTag.getTagId()) == 0) {
            return CmsConstants.UNIQUE;
        }
        return CmsConstants.NOT_UNIQUE;
    }

    @Override
    public List<CmsTag> listCmsTagByArticleTagId(Long articleId) {
        return cmsTagMapper.listCmsTagByArticleTagId(articleId);
    }

    @Override
    public int updateTagVisible(Long[] ids, Byte b) {
        return cmsTagMapper.updateTagVisible(ids,b);
    }
    @Override
    public List<CmsTag> listCmsTag() {
        return cmsTagMapper.listCmsTagNoHide();
    }

    @Override
    public List<TagCountVo> listTagCountVoByTag(CmsTag cmsTag) {
        return cmsTagMapper.listTagCountVoByTag(cmsTag);
    }

    @Override
    public List<TagCountVo> listTagCountVo() {
        return cmsTagMapper.listTagCountVoNoHide();
    }
}
