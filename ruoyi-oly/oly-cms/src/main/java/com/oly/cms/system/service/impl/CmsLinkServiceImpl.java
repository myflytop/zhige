package com.oly.cms.system.service.impl;

import java.util.List;

import com.oly.cms.system.mapper.CmsLinkMapper;
import com.oly.cms.system.model.po.CmsLink;
import com.oly.cms.system.service.ICmsLinkService;
import com.oly.common.constant.CacheConstant;
import com.oly.framework.event.CacheWebRefreshEvent;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.stereotype.Service;
import com.ruoyi.common.core.text.Convert;

/**
 * 友情链接Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-04-06
 */
@Service
public class CmsLinkServiceImpl implements ICmsLinkService {
    @Autowired
    private CmsLinkMapper cmsLinkMapper;

    @Autowired
    private ApplicationEventPublisher app;

    /**
     * 查询友情链接
     * 
     * @param linkId 友情链接ID
     * @return 友情链接
     */
    @Override
    public CmsLink selectCmsLinkById(Long linkId) {
        return cmsLinkMapper.selectCmsLinkById(linkId);
    }

    /**
     * 查询友情链接列表
     * 
     * @param cmsLink 友情链接
     * @return 友情链接
     */
    @Override
    public List<CmsLink> selectCmsLinkList(CmsLink cmsLink) {
        return cmsLinkMapper.selectCmsLinkList(cmsLink);
    }

    /**
     * 新增友情链接
     * 
     * @param cmsLink 友情链接
     * @return 结果
     */
    @Override
    public int insertCmsLink(CmsLink cmsLink) {
        cmsLink.setCreateTime(DateUtils.getNowDate());
        int re=cmsLinkMapper.insertCmsLink(cmsLink);
        app.publishEvent(new CacheWebRefreshEvent(this,CacheConstant.LINKS_CACHE_KEY_PREFIX));
        return re;
    }

    /**
     * 修改友情链接
     * 
     * @param cmsLink 友情链接
     * @return 结果
     */
    @Override
    public int updateCmsLink(CmsLink cmsLink) {
        cmsLink.setUpdateTime(DateUtils.getNowDate());
        int re=cmsLinkMapper.updateCmsLink(cmsLink);
        app.publishEvent(new CacheWebRefreshEvent(this,CacheConstant.LINKS_CACHE_KEY_PREFIX));
        return re;
     
    }

    /**
     * 删除友情链接对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteCmsLinkByIds(String ids) {
        int re=cmsLinkMapper.deleteCmsLinkByIds(Convert.toStrArray(ids));
        app.publishEvent(new CacheWebRefreshEvent(this,CacheConstant.LINKS_CACHE_KEY_PREFIX));
        return re;
    
    }

    /**
     * 删除友情链接信息
     * 
     * @param linkId 友情链接ID
     * @return 结果
     */
    @Override
    public int deleteCmsLinkById(Long linkId) {
        int re=cmsLinkMapper.deleteCmsLinkById(linkId);
        app.publishEvent(new CacheWebRefreshEvent(this,CacheConstant.LINKS_CACHE_KEY_PREFIX));
        return re;
    }

    @Override
    public List<String> listLinkGroupNames() {
       
        return  cmsLinkMapper.listLinkGroupNames();
    }
}
