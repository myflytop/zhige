package com.oly.template.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.oly.oss.service.impl.NativeOssHandler;
import com.oly.template.domain.OlyTemplate;
import com.oly.template.domain.enums.TemplateTypeEnum;
import com.oly.template.service.IOlyTemplateService;
import com.oly.template.utils.TemplatesUtil;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.Ztree;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.enums.OlyStageRoot;
import com.ruoyi.common.utils.ShiroUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;

import org.apache.commons.io.FilenameUtils;
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

    @Autowired
    private NativeOssHandler ossHandler;

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
     * 
     * @throws IOException
     */
    @RequiresPermissions("oly:template:add")
    @Log(title = "模板模型", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(OlyTemplate olyTemplate, String templateHtml, MultipartFile file) throws IOException {
        if (StringUtils.isEmpty(olyTemplate.getTemplateName())) {
            return error("文件名不能为空");
        }

        if (TemplateTypeEnum.HTML.ordinal() == olyTemplate.getTemplateType()) {
            if (StringUtils.isEmpty(templateHtml)) {
                return error("模板内容不能为空");
            }
            String u = olyTemplate.getTemplateName() + ".html";
            TemplatesUtil.saveHtml(templateHtml,
                    Paths.get(RuoYiConfig.getWorkPath(), OlyStageRoot.TEMPLATE_DIR.getDir(), u).toString());
            olyTemplate.setTemplateUrl("/" + u);
        }

        olyTemplate.setCreateBy(ShiroUtils.getUserId());
        olyTemplateService.insertOlyTemplate(olyTemplate);
        return AjaxResult.success(olyTemplate);

    }

    /**
     * 修改模板模型
     */
    @GetMapping("/edit/{templateId}")
    public String edit(@PathVariable("templateId") Long templateId, ModelMap mmap) {
        String parentName = "根目录";
        OlyTemplate olyTemplate = olyTemplateService.selectOlyTemplateById(templateId);

        if (olyTemplate.getParentId() != 0L) {
            OlyTemplate parentOlyTemplate = olyTemplateService.selectOlyTemplateById(olyTemplate.getParentId());
            if (parentOlyTemplate != null) {
                parentName = parentOlyTemplate.getTemplateName();
            }

        }
        mmap.put("parentName", parentName);
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
    public AjaxResult editSave(OlyTemplate olyTemplate, String templateHtml) {
        if (TemplateTypeEnum.HTML.ordinal() == olyTemplate.getTemplateType()) {
            if (StringUtils.isEmpty(templateHtml)) {
                return error("模板内容不能为空");
            }
            String u = olyTemplate.getTemplateName() + ".html";
            TemplatesUtil.saveHtml(templateHtml,
                    Paths.get(RuoYiConfig.getWorkPath(), OlyStageRoot.TEMPLATE_DIR.getDir(), u).toString());
            olyTemplate.setTemplateUrl("/" + u);
        }
        olyTemplate.setUpdateBy(ShiroUtils.getUserId());
        olyTemplateService.updateOlyTemplate(olyTemplate);
        return AjaxResult.success(olyTemplate);

    }

    /**
     * 修改保存模板模型
     * 
     * @throws IOException
     */
    @RequiresPermissions("oly:template:edit")
    @Log(title = "上传模板", businessType = BusinessType.INSERT)
    @PostMapping("/templateUpload")
    @ResponseBody
    public AjaxResult templateUpload(MultipartFile file) throws IOException {

        return AjaxResult.success(ossHandler
                .ossAppointUpload(file, OlyStageRoot.TEMPLATE_DIR, FilenameUtils.getName(file.getOriginalFilename()))
                .getData());
    }

    /**
     * 删除
     */
    @RequiresPermissions("oly:template:remove")
    @Log(title = "模板模型", businessType = BusinessType.DELETE)
    @GetMapping("/remove/{templateId}")
    @ResponseBody
    public AjaxResult remove(@PathVariable("templateId") Long templateId) {
        if (olyTemplateService.countTemplate(templateId) > 0) {
            return error("当前节点存在子节点");
        } else {
            OlyTemplate olyTemplate = olyTemplateService.selectOlyTemplateById(templateId);
            if ((byte) TemplateTypeEnum.MENU.ordinal() != olyTemplate.getTemplateType()) {
                File f = Paths.get(RuoYiConfig.getWorkPath(), OlyStageRoot.TEMPLATE_DIR.getDir(),
                        olyTemplate.getTemplateUrl()).toFile();
                if (f.exists() && f.isFile())
                    f.delete();
            }
        }
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

    @GetMapping("/getContent")
    public void download(String tUrl, HttpServletResponse response) {
        olyTemplateService.getTemolateContent(tUrl, response);
    }

    /**
     * 检查参数是否为0 获取模板是否null
     * 
     * @param templateId
     * @return
     */
    private OlyTemplate gTemplate(Long templateId) {
        OlyTemplate olyTemplate = null;
        if (templateId == 0L) {
            olyTemplate = new OlyTemplate();
            olyTemplate.setTemplateId(0L);
            olyTemplate.setBuilt((byte) 1);
            olyTemplate.setTemplateName("主目录");
        } else {
            olyTemplate = olyTemplateService.selectOlyTemplateById(templateId);
            if (olyTemplate == null) {
                olyTemplate = new OlyTemplate();
                olyTemplate.setTemplateId(0L);
                olyTemplate.setBuilt((byte) 1);
                olyTemplate.setTemplateName("主目录");
            }
        }
        olyTemplate.setTemplateType(TemplateTypeEnum.HTML.ordinal());
        return olyTemplate;
    }

}
