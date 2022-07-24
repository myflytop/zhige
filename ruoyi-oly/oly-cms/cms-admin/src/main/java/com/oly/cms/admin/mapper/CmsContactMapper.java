package com.oly.cms.admin.mapper;

import com.oly.cms.common.domain.entity.CmsContact;
import java.util.List;

/**
 * 反馈|建议Mapper接口
 * 
 * @author zg
 * @date 2020-06-15
 */
public interface CmsContactMapper {
    /**
     * 查询反馈|建议
     * 
     * @param contactId 反馈|建议ID
     * @return 反馈|建议
     */
    CmsContact selectCmsContactById(Long contactId);

    /**
     * 查询反馈|建议列表
     * 
     * @param cmsContact 反馈|建议
     * @return 反馈|建议集合
     */
    List<CmsContact> selectCmsContactList(CmsContact cmsContact);

    /**
     * 新增反馈|建议
     * 
     * @param cmsContact 反馈|建议
     * @return 结果
     */
    int insertCmsContact(CmsContact cmsContact);

    /**
     * 修改反馈|建议
     * 
     * @param cmsContact 反馈|建议
     * @return 结果
     */
    int updateCmsContact(CmsContact cmsContact);

    /**
     * 删除反馈|建议
     * 
     * @param contactId 反馈|建议ID
     * @return 结果
     */
    int deleteCmsContactById(Long contactId);

    /**
     * 批量删除反馈|建议
     * 
     * @param contactIds 需要删除的数据ID
     * @return 结果
     */
    int deleteCmsContactByIds(String[] contactIds);
}
