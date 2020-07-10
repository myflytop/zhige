package com.ruoyi.cms.system.service.impl;

import java.util.List;

import com.ruoyi.cms.system.mapper.CmsContactMapper;
import com.ruoyi.cms.system.model.po.CmsContact;
import com.ruoyi.cms.system.service.ICmsContactService;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ruoyi.common.core.text.Convert;

/**
 * 反馈|建议Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-06-15
 */
@Service
public class CmsContactServiceImpl implements ICmsContactService
{
    @Autowired
    private CmsContactMapper cmsContactMapper;

    /**
     * 查询反馈|建议
     * 
     * @param contactId 反馈|建议ID
     * @return 反馈|建议
     */
    @Override
    public CmsContact selectCmsContactById(Long contactId)
    {
        return cmsContactMapper.selectCmsContactById(contactId);
    }

    /**
     * 查询反馈|建议列表
     * 
     * @param cmsContact 反馈|建议
     * @return 反馈|建议
     */
    @Override
    public List<CmsContact> selectCmsContactList(CmsContact cmsContact)
    {
        return cmsContactMapper.selectCmsContactList(cmsContact);
    }

    /**
     * 新增反馈|建议
     * 
     * @param cmsContact 反馈|建议
     * @return 结果
     */
    @Override
    public int insertCmsContact(CmsContact cmsContact)
    {
        cmsContact.setCreateTime(DateUtils.getNowDate());
        return cmsContactMapper.insertCmsContact(cmsContact);
    }

    /**
     * 修改反馈|建议
     * 
     * @param cmsContact 反馈|建议
     * @return 结果
     */
    @Override
    public int updateCmsContact(CmsContact cmsContact)
    {
        return cmsContactMapper.updateCmsContact(cmsContact);
    }

    /**
     * 删除反馈|建议对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteCmsContactByIds(String ids)
    {
        return cmsContactMapper.deleteCmsContactByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除反馈|建议信息
     * 
     * @param contactId 反馈|建议ID
     * @return 结果
     */
    @Override
    public int deleteCmsContactById(Long contactId)
    {
        return cmsContactMapper.deleteCmsContactById(contactId);
    }
}
