package com.oly.cms.system.service;

import com.oly.cms.system.model.po.CmsLink;

import java.util.List;

/**
 * 友情链接Service接口
 * 
 * @author ruoyi
 * @date 2020-04-06
 */
public interface ICmsLinkService {
    /**
     * 查询友情链接
     * 
     * @param linkId 友情链接ID
     * @return 友情链接
     */
    public CmsLink selectCmsLinkById(Long linkId);

    /**
     * 查询友情链接列表
     * 
     * @param cmsLink 友情链接
     * @return 友情链接集合
     */
    public List<CmsLink> selectCmsLinkList(CmsLink cmsLink);

    /**
     * 新增友情链接
     * 
     * @param cmsLink 友情链接
     * @return 结果
     */
    public int insertCmsLink(CmsLink cmsLink);

    /**
     * 修改友情链接
     * 
     * @param cmsLink 友情链接
     * @return 结果
     */
    public int updateCmsLink(CmsLink cmsLink);

    /**
     * 批量删除友情链接
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteCmsLinkByIds(String ids);

    public List<String> listLinkGroupNames();

    /**
     * 删除友情链接信息
     * 
     * @param linkId 友情链接ID
     * @return 结果
     */
    public int deleteCmsLinkById(Long linkId);
}
