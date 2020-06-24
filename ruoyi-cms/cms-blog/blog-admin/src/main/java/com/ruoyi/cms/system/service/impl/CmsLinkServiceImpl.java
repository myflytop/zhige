package com.ruoyi.cms.system.service.impl;

import java.util.List;

import com.ruoyi.cms.system.mapper.CmsLinkMapper;
import com.ruoyi.cms.system.model.po.CmsLink;
import com.ruoyi.cms.system.service.ICmsLinkService;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.common.core.text.Convert;

/**
 * 友情链接Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-04-06
 */
@Service
public class CmsLinkServiceImpl implements ICmsLinkService
{
    @Autowired
    private CmsLinkMapper cmsLinkMapper;

    /**
     * 查询友情链接
     * 
     * @param linkId 友情链接ID
     * @return 友情链接
     */
    @Override
    public CmsLink selectCmsLinkById(Long linkId)
    {
        return cmsLinkMapper.selectCmsLinkById(linkId);
    }

    /**
     * 查询友情链接列表
     * 
     * @param cmsLink 友情链接
     * @return 友情链接
     */
    @Override
    public List<CmsLink> selectCmsLinkList(CmsLink cmsLink)
    {
        return cmsLinkMapper.selectCmsLinkList(cmsLink);
    }

    /**
     * 新增友情链接
     * 
     * @param cmsLink 友情链接
     * @return 结果
     */
    @Override
    public int insertCmsLink(CmsLink cmsLink)
    {
        cmsLink.setCreateTime(DateUtils.getNowDate());
        return cmsLinkMapper.insertCmsLink(cmsLink);
    }

    /**
     * 修改友情链接
     * 
     * @param cmsLink 友情链接
     * @return 结果
     */
    @Override
    public int updateCmsLink(CmsLink cmsLink)
    {
        cmsLink.setUpdateTime(DateUtils.getNowDate());
        return cmsLinkMapper.updateCmsLink(cmsLink);
    }

    /**
     * 删除友情链接对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteCmsLinkByIds(String ids)
    {
        return cmsLinkMapper.deleteCmsLinkByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除友情链接信息
     * 
     * @param linkId 友情链接ID
     * @return 结果
     */
    @Override
    public int deleteCmsLinkById(Long linkId)
    {
        return cmsLinkMapper.deleteCmsLinkById(linkId);
    }
}
