package com.oly.template.controller;

import java.util.List;

import com.oly.template.domain.OlyTemplate;
import com.oly.template.domain.enums.TemplateTypeEnum;
import com.oly.template.service.IOlyTemplateService;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.Ztree;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

/**
 * 模板模型Controller
 * 
 * @author 止戈
 * @date 2020-12-20
 */
@Controller
@RequestMapping("/oly/template")
public class OlyTemplateController extends BaseController {
    private String prefix = "oly/template";

    @Autowired
    private IOlyTemplateService olyTemplateService;

    @RequiresPermissions("oly:template:view")
    @GetMapping()
    public String template() {
        return prefix + "/template";
    }

    /**
     * 查询模板模型树列表
     */
    @RequiresPermissions("oly:template:list")
    @PostMapping("/list")
    @ResponseBody
    public List<OlyTemplate> list(OlyTemplate olyTemplate) {
        startPage();
        List<OlyTemplate> list = olyTemplateService.selectOlyTemplateList(olyTemplate);
        return list;
    }

    /**
     * 导出模板模型列表
     */
    @RequiresPermissions("oly:template:export")
    @Log(title = "模板模型", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(OlyTemplate olyTemplate) {
        List<OlyTemplate> list = olyTemplateService.selectOlyTemplateList(olyTemplate);
        ExcelUtil<OlyTemplate> util = new ExcelUtil<OlyTemplate>(OlyTemplate.class);
        return util.exportExcel(list, "template");
    }

    /**
     * 新增模板模型 templateId 父id
     */
    @GetMapping(value = { "/add/{templateId}", "/add/" })
    public String add(@PathVariable(value = "templateId", required = false) Long templateId, ModelMap mmap) {

        mmap.put("olyTemplate", gTemplate(templateId));
        return prefix + "/add";
    }

    /**
     * 新增保存模板模型
     */
    @RequiresPermissions("oly:template:add")
    @Log(title = "模板模型", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(OlyTemplate olyTemplate, String templateHtml, MultipartFile file) {
        if (TemplateTypeEnum.MENU.ordinal() == olyTemplate.getTemplateType()) {

        } else if (TemplateTypeEnum.HTML.ordinal() == olyTemplate.getTemplateType()) {

        }

        else {

        }
        return null;

    }

    /**
     * 修改模板模型
     */
    @GetMapping("/edit/{templateId}")
    public String edit(@PathVariable("templateId") Long templateId, ModelMap mmap) {
        OlyTemplate olyTemplate = olyTemplateService.selectOlyTemplateById(templateId);
        mmap.put("olyTemplate", olyTemplate);
        return prefix + "/edit";
    }

    /**
     * 修改保存模板模型
     */
    @RequiresPermissions("oly:template:edit")
    @Log(title = "模板模型", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(OlyTemplate olyTemplate) {
        return toAjax(olyTemplateService.updateOlyTemplate(olyTemplate));
    }

    /**
     * 删除
     */
    @RequiresPermissions("oly:template:remove")
    @Log(title = "模板模型", businessType = BusinessType.DELETE)
    @GetMapping("/remove/{templateId}")
    @ResponseBody
    public AjaxResult remove(@PathVariable("templateId") Long templateId) {
        return toAjax(olyTemplateService.deleteOlyTemplateById(templateId));
    }

    /**
     * 选择模板模型树
     */
    @GetMapping(value = { "/selectTemplateTree/{templateId}", "/selectTemplateTree/" })
    public String selectTemplateTree(@PathVariable(value = "templateId", required = false) Long templateId,
            ModelMap mmap) {
        if (StringUtils.isNotNull(templateId)) {
            mmap.put("olyTemplate", olyTemplateService.selectOlyTemplateById(templateId));
        }
        return prefix + "/tree";
    }

    /**
     * 加载模板模型树列表
     */
    @GetMapping("/treeData/{templateType}")
    @ResponseBody
    public List<Ztree> treeData(@PathVariable(value = "templateType", required = false) Integer templateType) {
        if (StringUtils.isNull(templateType)) {
            templateType = 0;
        }
        List<Ztree> ztrees = olyTemplateService.selectOlyTemplateTree(templateType);
        return ztrees;
    }

    /**
     * 检查参数是否为0 获取模板是否null
     * 
     * @param templateId
     * @return
     */
    private OlyTemplate gTemplate(Long templateId) {
        OlyTemplate olyTemplate = null;
        if (StringUtils.isNotNull(templateId)) {
            olyTemplate = olyTemplateService.selectOlyTemplateById(templateId);
            if (olyTemplate == null || templateId == 0) {
                olyTemplate = new OlyTemplate();
                olyTemplate.setTemplateId(0L);
                olyTemplate.setTemplateType(TemplateTypeEnum.HTML.ordinal());
                olyTemplate.setTemplateName("主目录");
            }
        }
        return olyTemplate;
    }

}
