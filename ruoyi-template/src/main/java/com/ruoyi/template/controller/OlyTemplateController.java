package com.ruoyi.template.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.Ztree;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.enums.CommonVisibleEnums;
import com.ruoyi.common.enums.OlyStageRoot;
import com.ruoyi.common.enums.OperateTitle;
import com.ruoyi.common.utils.ShiroUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.oss.service.impl.NativeOssHandler;
import com.ruoyi.template.domain.OlyTemplate;
import com.ruoyi.template.domain.enums.TemplateTypeEnum;
import com.ruoyi.template.service.IOlyTemplateService;
import com.ruoyi.template.utils.TemplatesUtil;

/**
 * 模板控制层
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

    /**
     * 查看模板
     * 
     * @return
     */
    @RequiresPermissions("oly:template:view")
    @GetMapping()
    public String template() {
        return prefix + "/template";
    }

    /**
     * 查询模板模型树列表
     * 
     * @param olyTemplate
     * @return
     */
    @RequiresPermissions("oly:template:list")
    @PostMapping("/list")
    @ResponseBody
    public List<OlyTemplate> list(OlyTemplate olyTemplate) {
        List<OlyTemplate> list = olyTemplateService.selectOlyTemplateList(olyTemplate);
        return list;
    }

    /**
     * 查询模板模型树列表
     * 
     * @param type 模板类型
     * @return
     */
    @RequiresPermissions("oly:template:list")
    @GetMapping("/listByType/{type}")
    @ResponseBody
    public List<OlyTemplate> listByType(@PathVariable("type") Integer type) {
        OlyTemplate olyTemplate = new OlyTemplate();
        olyTemplate.setTemplateType(type);
        olyTemplate.setVisible(CommonVisibleEnums.SHOW.ordinal());
        List<OlyTemplate> list = olyTemplateService.selectOlyTemplateList(olyTemplate);
        return list;
    }

    /**
     * 新增模板模型
     * 
     * @param templateId 模板id
     * @param map
     * @return
     */
    @RequiresPermissions("oly:template:add")
    @GetMapping(value = { "/add/{templateId}", "/add/" })
    public String add(@PathVariable(value = "templateId", required = false) Long templateId, ModelMap map) {
        map.put("olyTemplate", gTemplate(templateId));
        return prefix + "/add";
    }

    /**
     * 新增保存模板模型
     * 
     * @param olyTemplate  模板模型
     * @param templateHtml Html模板
     * @param file         文件
     * @return
     * @throws IOException
     */
    @RequiresPermissions("oly:template:add")
    @Log(title = OperateTitle.SYS_TEMPLATE, businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(OlyTemplate olyTemplate, String templateHtml) throws IOException {
        if (StringUtils.isEmpty(olyTemplate.getTemplateName())) {
            return error("模板名不能为空");
        }
        if (TemplateTypeEnum.HTML.ordinal() == olyTemplate.getTemplateType()
                || TemplateTypeEnum.DATAHTML.ordinal() == olyTemplate.getTemplateType()) {
            if (StringUtils.isEmpty(templateHtml)) {
                return error("模板内容不能为空");
            }
            String u = olyTemplate.getTemplateName() + ".html";
            TemplatesUtil.saveHtml(templateHtml, Paths.get(OlyStageRoot.TEMPLATE_DIR.getRoot(u)).toString());
            olyTemplate.setTemplateUrl("/" + u);
        }
        olyTemplate.setCreateBy(ShiroUtils.getUserIdStr());
        olyTemplateService.insertOlyTemplate(olyTemplate);
        return AjaxResult.success(olyTemplate);

    }

    /**
     * 修改模板模型
     */
    @RequiresPermissions("oly:template:edit")
    @GetMapping("/edit/{templateId}")
    public String edit(@PathVariable("templateId") Long templateId, ModelMap map) {
        String parentName = "根目录";
        OlyTemplate olyTemplate = olyTemplateService.selectOlyTemplateById(templateId);
        if (olyTemplate.getParentId() != 0L) {
            OlyTemplate parentOlyTemplate = olyTemplateService.selectOlyTemplateById(olyTemplate.getParentId());
            if (parentOlyTemplate != null) {
                parentName = parentOlyTemplate.getTemplateName();
            }
        }
        map.put("parentName", parentName);
        map.put("olyTemplate", olyTemplate);
        return prefix + "/edit";
    }

    /**
     * 修改保存模板模型
     */
    @RequiresPermissions("oly:template:edit")
    @Log(title = OperateTitle.SYS_TEMPLATE, businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(OlyTemplate olyTemplate, String templateHtml) {
        if (StringUtils.isEmpty(olyTemplate.getTemplateName())) {
            return error("模板名不能为空");
        }
        if (olyTemplate.getTemplateId() == olyTemplate.getParentId()) {
            return error("不能选择自己为父节点");
        }
        if (TemplateTypeEnum.HTML.ordinal() == olyTemplate.getTemplateType()
                || TemplateTypeEnum.DATAHTML.ordinal() == olyTemplate.getTemplateType()) {
            if (StringUtils.isEmpty(templateHtml)) {
                return error("模板内容不能为空");
            }
            String u = olyTemplate.getTemplateName() + ".html";
            TemplatesUtil.saveHtml(templateHtml, Paths.get(OlyStageRoot.TEMPLATE_DIR.getRoot(u)).toString());
            olyTemplate.setTemplateUrl("/" + u);
        }
        olyTemplate.setUpdateBy(ShiroUtils.getUserIdStr());
        olyTemplateService.updateOlyTemplate(olyTemplate);
        return AjaxResult.success(olyTemplate);

    }

    /**
     * 修改保存模板模型
     * 
     * @throws IOException
     */
    @RequiresPermissions("oly:template:edit")
    @Log(title = OperateTitle.SYS_TEMPLATE, businessType = BusinessType.UPDATE)
    @PostMapping("/templateUpload")
    @ResponseBody
    public AjaxResult templateUpload(MultipartFile file) throws IOException {
        return AjaxResult.success(ossHandler.ossAppointUpload(file, OlyStageRoot.TEMPLATE_DIR,
                FilenameUtils.getName(file.getOriginalFilename())));
    }

    /**
     * 删除
     */
    @RequiresPermissions("oly:template:remove")
    @Log(title = OperateTitle.SYS_TEMPLATE, businessType = BusinessType.DELETE)
    @GetMapping("/remove/{templateId}")
    @ResponseBody
    public AjaxResult remove(@PathVariable("templateId") Long templateId) {
        if (olyTemplateService.countTemplate(templateId) > 0) {
            return error("当前节点存在子节点");
        } else {
            OlyTemplate olyTemplate = olyTemplateService.selectOlyTemplateById(templateId);
            if ((byte) TemplateTypeEnum.MENU.ordinal() != olyTemplate.getTemplateType()) {
                File f = Paths.get(OlyStageRoot.TEMPLATE_DIR.getRoot(olyTemplate.getTemplateUrl())).toFile();
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
            ModelMap map) {
        if (StringUtils.isNotNull(templateId)) {
            map.put("olyTemplate", olyTemplateService.selectOlyTemplateById(templateId));
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
     * 模板演示
     */
    @RequiresPermissions("oly:template:example")
    @GetMapping("/example/{id}")
    public String exampleView(ModelMap mp, @PathVariable("id") Long id) {
        mp.put("templateId", id);

        return prefix + "/example";
    }

    /**
     * 模板演示
     */
    @RequiresPermissions("oly:template:example")
    @PostMapping("/example")
    @ResponseBody
    public String example(@RequestParam Map<String, Object> map, HttpServletResponse response) {
        return olyTemplateService.getContent(map.get("content").toString(), map);
    }

    @GetMapping("/getContent")
    public void download(String templateUrl, HttpServletResponse response) {
        olyTemplateService.getTemplateContent(templateUrl, response);
    }

    /**
     * 模板演示
     */
    @RequiresPermissions("oly:template:view")
    @GetMapping("/get/{id}")
    @ResponseBody
    public AjaxResult getTemplate(@PathVariable("id") Long id) {
        return AjaxResult.success(olyTemplateService.selectOlyTemplateById(id));
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
            olyTemplate.setBuilt(UserConstants.NO_SYSTEM);
            olyTemplate.setTemplateName("主目录");
        } else {
            olyTemplate = olyTemplateService.selectOlyTemplateById(templateId);
            if (olyTemplate == null) {
                olyTemplate = new OlyTemplate();
                olyTemplate.setTemplateId(0L);
                olyTemplate.setBuilt(UserConstants.NO_SYSTEM);
                olyTemplate.setTemplateName("主目录");
            }
        }
        olyTemplate.setTemplateType(TemplateTypeEnum.HTML.ordinal());
        return olyTemplate;
    }

}
