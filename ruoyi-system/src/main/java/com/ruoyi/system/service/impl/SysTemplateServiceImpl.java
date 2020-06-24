package com.ruoyi.system.service.impl;

import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.system.domain.SysTemplate;
import com.ruoyi.system.mapper.SysTemplateMapper;
import com.ruoyi.system.service.ISysTemplateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.templateresolver.StringTemplateResolver;

import java.util.List;

/**
 * 数据模板Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-03-22
 */
@Service
public class SysTemplateServiceImpl implements ISysTemplateService
{
    @Autowired
    private SysTemplateMapper sysTemplateMapper;

    private TemplateEngine templateEngine;

    public SysTemplateServiceImpl(){
        templateEngine =new TemplateEngine();
        StringTemplateResolver stringTemplateResolver = new StringTemplateResolver();
        templateEngine.addTemplateResolver(stringTemplateResolver);
    }

    /**
     * 查询数据模板
     * 
     * @param templateId 数据模板ID
     * @return 数据模板
     */
    @Override
    public SysTemplate selectSysTemplateById(Long templateId)
    {
        return sysTemplateMapper.selectSysTemplateById(templateId);
    }

    /**
     * 查询数据模板列表
     * 
     * @param sysTemplate 数据模板
     * @return 数据模板
     */
    @Override
    public List<SysTemplate> selectSysTemplateList(SysTemplate sysTemplate)
    {
        return sysTemplateMapper.selectSysTemplateList(sysTemplate);
    }

    /**
     * 新增数据模板
     * 
     * @param sysTemplate 数据模板
     * @return 结果
     */
    @Override
    public int insertSysTemplate(SysTemplate sysTemplate)
    {
        sysTemplate.setCreateTime(DateUtils.getNowDate());
        return sysTemplateMapper.insertSysTemplate(sysTemplate);
    }

    /**
     * 修改数据模板
     * 
     * @param sysTemplate 数据模板
     * @return 结果
     */
    @Override
    public int updateSysTemplate(SysTemplate sysTemplate)
    {
        sysTemplate.setUpdateTime(DateUtils.getNowDate());
        return sysTemplateMapper.updateSysTemplate(sysTemplate);
    }

    /**
     * 删除数据模板对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteSysTemplateByIds(String ids)
    {
        return sysTemplateMapper.deleteSysTemplateByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除数据模板信息
     * 
     * @param templateId 数据模板ID
     * @return 结果
     */
    @Override
    public int deleteSysTemplateById(Long templateId)
    {
        return sysTemplateMapper.deleteSysTemplateById(templateId);
    }

    @Override
    public TemplateEngine getTemplateEngine() {
        return templateEngine;
    }

    @Override
    public List<String> listTemNameId() {
        return sysTemplateMapper.listTemNameId();
    }

    @Override
    public String getTemData(Long templateId) {
        return sysTemplateMapper.getTemData(templateId);
    }
}
