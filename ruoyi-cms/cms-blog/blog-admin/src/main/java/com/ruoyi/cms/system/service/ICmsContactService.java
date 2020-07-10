package com.ruoyi.cms.system.service;

import com.ruoyi.cms.system.model.po.CmsContact;
import java.util.List;

/**
 * 反馈|建议Service接口
 * 
 * @author ruoyi
 * @date 2020-06-15
 */
public interface ICmsContactService 
{
    /**
     * 查询反馈|建议
     * 
     * @param contactId 反馈|建议ID
     * @return 反馈|建议
     */
    public CmsContact selectCmsContactById(Long contactId);

    /**
     * 查询反馈|建议列表
     * 
     * @param cmsContact 反馈|建议
     * @return 反馈|建议集合
     */
    public List<CmsContact> selectCmsContactList(CmsContact cmsContact);

    /**
     * 新增反馈|建议
     * 
     * @param cmsContact 反馈|建议
     * @return 结果
     */
    public int insertCmsContact(CmsContact cmsContact);

    /**
     * 修改反馈|建议
     * 
     * @param cmsContact 反馈|建议
     * @return 结果
     */
    public int updateCmsContact(CmsContact cmsContact);

    /**
     * 批量删除反馈|建议
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteCmsContactByIds(String ids);

    /**
     * 删除反馈|建议信息
     * 
     * @param contactId 反馈|建议ID
     * @return 结果
     */
    public int deleteCmsContactById(Long contactId);
}
