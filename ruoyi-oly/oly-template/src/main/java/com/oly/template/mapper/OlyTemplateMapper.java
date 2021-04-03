package com.oly.template.mapper;

import java.util.List;
import com.oly.template.domain.OlyTemplate;

/**
 * 模板模型Mapper接口
 * 
 * @author 止戈
 * @date 2020-12-20
 */
public interface OlyTemplateMapper 
{
    /**
     * 查询模板模型
     * 
     * @param templateId 模板模型ID
     * @return 模板模型
     */
    public OlyTemplate selectOlyTemplateById(Long templateId);

    /**
     * 查询模板模型列表
     * 
     * @param olyTemplate 模板模型
     * @return 模板模型集合
     */
    public List<OlyTemplate> selectOlyTemplateList(OlyTemplate olyTemplate);

    /**
     * 新增模板模型
     * 
     * @param olyTemplate 模板模型
     * @return 结果
     */
    public int insertOlyTemplate(OlyTemplate olyTemplate);

    /**
     * 修改模板模型
     * 
     * @param olyTemplate 模板模型
     * @return 结果
     */
    public int updateOlyTemplate(OlyTemplate olyTemplate);

    /**
     * 删除模板模型
     * 
     * @param templateId 模板模型ID
     * @return 结果
     */
    public int deleteOlyTemplateById(Long templateId);

    /**
     * 批量删除模板模型
     * 
     * @param templateIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteOlyTemplateByIds(String[] templateIds);

    public int countTemplate(Long templateId);
}
