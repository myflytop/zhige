package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.SysTemplate;

import java.util.List;

/**
 * 数据模板Mapper接口
 * 
 * @author ruoyi
 * @date 2020-03-22
 */
public interface SysTemplateMapper 
{
    /**
     * 查询数据模板
     * 
     * @param templateId 数据模板ID
     * @return 数据模板
     */
    public SysTemplate selectSysTemplateById(Long templateId);

    /**
     * 查询数据模板列表
     * 
     * @param sysTemplate 数据模板
     * @return 数据模板集合
     */
    public List<SysTemplate> selectSysTemplateList(SysTemplate sysTemplate);

    /**
     * 新增数据模板
     * 
     * @param sysTemplate 数据模板
     * @return 结果
     */
    public int insertSysTemplate(SysTemplate sysTemplate);

    /**
     * 修改数据模板
     * 
     * @param sysTemplate 数据模板
     * @return 结果
     */
    public int updateSysTemplate(SysTemplate sysTemplate);

    /**
     * 删除数据模板
     * 
     * @param templateId 数据模板ID
     * @return 结果
     */
    public int deleteSysTemplateById(Long templateId);

    /**
     * 批量删除数据模板
     * 
     * @param templateIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteSysTemplateByIds(String[] templateIds);

    /**
     * 获取字符串模板名字
     * name_id
     * @return
     */
    List<String> listTemNameId();

    /**
     * 获取json
     * @param templateId
     * @return
     */
    String getTemData(Long templateId);
}
