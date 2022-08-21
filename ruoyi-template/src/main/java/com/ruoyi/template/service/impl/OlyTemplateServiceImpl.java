package com.ruoyi.template.service.impl;

import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;
import org.thymeleaf.templateresolver.StringTemplateResolver;

import com.ruoyi.common.core.domain.Ztree;
import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.file.FileUtils;
import com.ruoyi.template.domain.OlyTemplate;
import com.ruoyi.template.mapper.OlyTemplateMapper;
import com.ruoyi.template.service.IOlyTemplateService;

/**
 * 模板模型Service业务层处理
 * 
 * @author 止戈
 * @date 2020-12-20
 */
@Service
public class OlyTemplateServiceImpl implements IOlyTemplateService {
    @Autowired
    private OlyTemplateMapper olyTemplateMapper;

    private TemplateEngine templateEngine;

    public OlyTemplateServiceImpl() {
        templateEngine = new TemplateEngine();
        StringTemplateResolver stringTemplateResolver = new StringTemplateResolver();
        templateEngine.addTemplateResolver(stringTemplateResolver);
    }

    /**
     * 查询模板模型
     * 
     * @param templateId 模板模型ID
     * @return 模板模型
     */
    @Override
    public OlyTemplate selectOlyTemplateById(Long templateId) {
        return olyTemplateMapper.selectOlyTemplateById(templateId);
    }

    /**
     * 查询模板模型列表
     * 
     * @param olyTemplate 模板模型
     * @return 模板模型
     */
    @Override
    public List<OlyTemplate> selectOlyTemplateList(OlyTemplate olyTemplate) {
        return olyTemplateMapper.selectOlyTemplateList(olyTemplate);
    }

    /**
     * 新增模板模型
     * 
     * @param olyTemplate 模板模型
     * @return 结果
     */
    @Override
    public int insertOlyTemplate(OlyTemplate olyTemplate) {
        olyTemplate.setCreateTime(DateUtils.getNowDate());
        return olyTemplateMapper.insertOlyTemplate(olyTemplate);
    }

    /**
     * 修改模板模型
     * 
     * @param olyTemplate 模板模型
     * @return 结果
     */
    @Override
    public int updateOlyTemplate(OlyTemplate olyTemplate) {
        olyTemplate.setUpdateTime(DateUtils.getNowDate());
        return olyTemplateMapper.updateOlyTemplate(olyTemplate);
    }

    /**
     * 删除模板模型对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteOlyTemplateByIds(String ids) {
        return olyTemplateMapper.deleteOlyTemplateByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除模板模型信息
     * 
     * @param templateId 模板模型ID
     * @return 结果
     */
    @Override
    public int deleteOlyTemplateById(Long templateId) {
        return olyTemplateMapper.deleteOlyTemplateById(templateId);
    }

    @Override
    public TemplateEngine getTemplateEngine() {
        return templateEngine;
    }

    /**
     * 查询模板模型树列表
     * 
     * @return 所有模板模型信息
     */
    @Override
    public List<Ztree> selectOlyTemplateTree(int olType) {
        OlyTemplate oly = new OlyTemplate();
        oly.setTemplateType(olType);
        List<OlyTemplate> olyTemplateList = olyTemplateMapper.selectOlyTemplateList(oly);
        List<Ztree> ztrees = new ArrayList<Ztree>();
        if (olyTemplateList == null || olyTemplateList.size() == 0) {
            Ztree ztree = new Ztree();
            ztree.setId(0L);
            ztree.setpId(0L);
            ztree.setName("根目录");
            ztree.setTitle("根目录");
            ztrees.add(ztree);

        } else {
            for (OlyTemplate olyTemplate : olyTemplateList) {
                Ztree ztree = new Ztree();
                ztree.setId(olyTemplate.getTemplateId());
                ztree.setpId(olyTemplate.getParentId());
                ztree.setName(olyTemplate.getTemplateName());
                ztree.setTitle(olyTemplate.getTemplateName());
                ztrees.add(ztree);
            }
        }
        return ztrees;
    }

    @Override
    public int countTemplate(Long templateId) {

        return olyTemplateMapper.countTemplate(templateId);
    }

    @Override
    public String getContent(String templateContent, Map<String, Object> field) {
        try {
            Context context = new Context();
            context.setLocale(Locale.getDefault());
            context.setVariables(field);
            return this.getTemplateEngine().process(templateContent, context);
        } catch (Exception e) {
            throw new ServiceException("模板解析异常");
        }
    }

    @Override
    public String getContentByTemplateUrl(Path path) {

        return FileUtils.readFileContent(path);
    }
}
