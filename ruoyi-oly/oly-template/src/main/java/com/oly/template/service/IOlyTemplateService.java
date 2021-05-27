package com.oly.template.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.oly.template.domain.OlyTemplate;
import com.ruoyi.common.core.domain.Ztree;

import org.thymeleaf.TemplateEngine;

/**
 * 模板模型Service接口
 * 
 * @author 止戈
 * @date 2020-12-20
 */
public interface IOlyTemplateService {
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
     * 批量删除模板模型
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteOlyTemplateByIds(String ids);

    /**
     * 删除模板模型信息
     * 
     * @param templateId 模板模型ID
     * @return 结果
     */
    public int deleteOlyTemplateById(Long templateId);

    /**
     * 
     * @return
     */
    public TemplateEngine getTemplateEngine();

    /**
     * 查询模板模型树列表
     * 
     * @return 所有模板模型信息
     */
    public List<Ztree> selectOlyTemplateTree(int olType);

    public void getTemplateContent(String tUrl,HttpServletResponse response);

    public String getContentByTemplateUrl(String tUrl);
    
    /**
     * 
     * @param templateContent 模板内容
     * @param field 填充数据
     * @return
     */
    public String getContent(String templateContent,Map<String,Object> field);

    public int countTemplate(Long templateId);
}
