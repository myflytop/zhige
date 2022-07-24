package com.oly.cms.hand.service.impl;

import java.util.List;

import com.oly.cms.common.domain.entity.CmsContact;
import com.oly.cms.hand.mapper.HandleMapper;

import com.oly.cms.hand.service.IHandleService;
import com.ruoyi.common.core.domain.entity.SysUser;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HandleServiceImpl implements IHandleService {
    @Autowired
    private HandleMapper webHandleMapper;

    @Override
    public int insertCmsContact(CmsContact cmsContact) {
        return webHandleMapper.insertCmsContact(cmsContact);
    }

    @Override
    public List<CmsContact> selectCmsContactList(CmsContact cmsContact) {
        return webHandleMapper.selectCmsContactList(cmsContact);
    }

    @Override
    public CmsContact selectCmsContactById(Long contactId) {
        return webHandleMapper.selectCmsContactById(contactId);
    }

    @Override
    public SysUser selectUserById(Long userId) {
        return webHandleMapper.selectUserById(userId);
    }
}
