package com.oly.cms.admin.mapper;

import com.oly.cms.common.domain.entity.CmsLink;

import java.util.List;

/**
 * 友情链接Mapper接口
 * 
 * @author zg
 * @date 2020-04-06
 */
public interface CmsLinkMapper {

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
     * 删除友情链接
     * 
     * @param linkId 友情链接ID
     * @return 结果
     */
    public int deleteCmsLinkById(Long linkId);

    /**
     * 批量删除友情链接
     * 
     * @param linkIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteCmsLinkByIds(String[] linkIds);

    /**
     * 获取外外链组别名
     * 
     * @return
     */
    public List<String> listLinkGroupNames();
}
