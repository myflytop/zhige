package com.oly.cms.hand.mapper;

import java.util.List;

import com.oly.cms.common.domain.entity.CmsContact;
import com.ruoyi.common.core.domain.entity.SysUser;

/**
 * 前端操作控制
 */
public interface HandleMapper {
    int insertCmsContact(CmsContact cmsContact);

    List<CmsContact> selectCmsContactList(CmsContact cmsContact);

    CmsContact selectCmsContactById(Long contactId);

    /**
     * 通过用户ID查询用户
     * 
     * @param userId 用户ID
     * @return 用户对象信息
     */
    public SysUser selectUserById(Long userId);

}
