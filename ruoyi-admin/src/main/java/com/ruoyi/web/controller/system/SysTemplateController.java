package com.ruoyi.web.controller.system;

import com.alibaba.fastjson.JSONObject;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.system.domain.SysTemplate;
import com.ruoyi.system.service.ISysTemplateService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.thymeleaf.context.Context;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/**
 * 数据模板Controller
 * 
 * @author ruoyi
 * @date 2020-03-22
 */
@Controller
@RequestMapping("/system/template")
public class SysTemplateController extends BaseController
{
    private String prefix = "system/template";

    @Autowired
    private ISysTemplateService sysTemplateService;


    @RequiresPermissions("system:template:view")
    @GetMapping()
    public String template()
    {
        return prefix + "/template";
    }

    /**
     * 查询数据模板列表
     */
    @RequiresPermissions("system:template:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(SysTemplate sysTemplate)
    {
        startPage();
        List<SysTemplate> list = sysTemplateService.selectSysTemplateList(sysTemplate);
        return getDataTable(list);
    }

    /**
     * 导出数据模板列表
     */
    @RequiresPermissions("system:template:export")
    @Log(title = "数据模板", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(SysTemplate sysTemplate)
    {
        List<SysTemplate> list = sysTemplateService.selectSysTemplateList(sysTemplate);
        ExcelUtil<SysTemplate> util = new ExcelUtil<SysTemplate>(SysTemplate.class);
        return util.exportExcel(list, "template");
    }

    /**
     * 新增数据模板
     */
    @RequiresPermissions("system:template:add")
    @GetMapping("/add/{templateId}")
    public String add(@PathVariable("templateId") Long templateId , ModelMap mmap)
    {   SysTemplate sysTemplate = sysTemplateService.selectSysTemplateById(templateId);
        if(sysTemplate==null)
        {
            sysTemplate=new SysTemplate();
        }
        mmap.put("sysTemplate", sysTemplate);
        return prefix + "/add";
    }
    @RequiresPermissions("system:template:example")
    @GetMapping("/example")
    public String example()
    {
        return prefix+ "/example";
    }

    @PostMapping("/checkTemplate")
    @ResponseBody 
    public AjaxResult checkTemplate(String templateHtml, String templateData ) {
        try{
            Context context=new Context();
            context.setLocale(Locale.getDefault());
            context.setVariables(JSONObject.parseObject(templateData));
            return AjaxResult.success(sysTemplateService.getTemplateEngine().process(templateHtml,context));
        }
        catch (Exception e)
        {
            return AjaxResult.error();
        }

    }

    /**
     * 模板演示
     */
    @RequiresPermissions("system:template:example")
    @GetMapping("/example/{templateId}")
    public void example(@PathVariable("templateId") Long templateId , @RequestParam Map<String, Object> map, HttpServletResponse response)
    {
        SysTemplate sysTemplate = sysTemplateService.selectSysTemplateById(templateId);
        PrintWriter writer = null;
        if (sysTemplate==null) {
            try {
                response.setContentType("text/html;charset=UTF-8");
                writer = response.getWriter();
                writer.write("<!doctype html><title>404 Not Found</title><h1 style=\"text-align: center\">404 Not Found</h1><hr/><p style=\"text-align: center\">Easy File Server</p>");
                writer.flush();
            } catch (IOException e) {
                e.printStackTrace();
            }
            finally {
                writer.close();
            }
        }
        else {
            try {
                response.setContentType("text/html;charset=UTF-8");
                writer = response.getWriter();
                Context context=new Context();
                context.setLocale(Locale.getDefault());
                context.setVariables(map);
                writer.write(sysTemplateService.getTemplateEngine().process(sysTemplate.getTemplateHtml(),context));
                writer.flush();
            } catch (IOException e) {
                e.printStackTrace();
            }
            finally {
                writer.close();
            }
        }
    }

    /**
     * 获取模板标题加文章名字
     * 形如name_id
     * @return
     */
    @RequiresPermissions("system:template:example")
    @GetMapping("/listTemNameId")
    @ResponseBody
    public AjaxResult listTemNameId(){
        return AjaxResult.success(sysTemplateService.listTemNameId());
    }

    @GetMapping("/getTemJson/{templateId}")
    @ResponseBody
    public AjaxResult getTemJson(@PathVariable("templateId") Long templateId){

        return AjaxResult.success("获取成功",sysTemplateService.getTemData(templateId));
    }

    /**
     * 新增保存数据模板
     */
    @RequiresPermissions("system:template:add")
    @Log(title = "数据模板", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(SysTemplate sysTemplate)
    {
        return toAjax(sysTemplateService.insertSysTemplate(sysTemplate));
    }

    /**
     * 修改数据模板
     */
    @RequiresPermissions("system:template:edit")
    @GetMapping("/edit/{templateId}")
    public String edit(@PathVariable("templateId") Long templateId, ModelMap mmap)
    {
        SysTemplate sysTemplate = sysTemplateService.selectSysTemplateById(templateId);
        mmap.put("sysTemplate", sysTemplate);
        return prefix + "/edit";
    }

    /**
     * 修改保存数据模板
     */
    @RequiresPermissions("system:template:edit")
    @Log(title = "数据模板", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(SysTemplate sysTemplate)
    {
        return toAjax(sysTemplateService.updateSysTemplate(sysTemplate));
    }

    /**
     * 删除数据模板
     */
    @RequiresPermissions("system:template:remove")
    @Log(title = "数据模板", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(sysTemplateService.deleteSysTemplateByIds(ids));
    }
}
