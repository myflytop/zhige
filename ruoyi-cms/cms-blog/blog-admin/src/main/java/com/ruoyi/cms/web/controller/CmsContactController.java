package com.ruoyi.cms.web.controller;

import java.util.List;

import com.ruoyi.cms.system.model.po.CmsContact;
import com.ruoyi.cms.system.service.ICmsContactService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 反馈|建议Controller
 * 
 * @author ruoyi
 * @date 2020-06-15
 */
@Controller
@RequestMapping("/cms/contact")
public class CmsContactController extends BaseController
{
    private String prefix = "blog/admin/contact";

    @Autowired
    private ICmsContactService cmsContactService;

    @RequiresPermissions("cms:contact:view")
    @GetMapping()
    public String contact()
    {
        return prefix + "/contact";
    }

    /**
     * 查询反馈|建议列表
     */
    @RequiresPermissions("cms:contact:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(CmsContact cmsContact)
    {
        startPage();
        List<CmsContact> list = cmsContactService.selectCmsContactList(cmsContact);
        return getDataTable(list);
    }

    /**
     * 导出反馈|建议列表
     */
    @RequiresPermissions("cms:contact:export")
    @Log(title = "反馈|建议", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(CmsContact cmsContact)
    {
        List<CmsContact> list = cmsContactService.selectCmsContactList(cmsContact);
        ExcelUtil<CmsContact> util = new ExcelUtil<CmsContact>(CmsContact.class);
        return util.exportExcel(list, "contact");
    }

    /**
     * 新增反馈|建议
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存反馈|建议
     */
    @RequiresPermissions("cms:contact:add")
    @Log(title = "反馈|建议", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(CmsContact cmsContact)
    {
        return toAjax(cmsContactService.insertCmsContact(cmsContact));
    }

    /**
     * 修改反馈|建议
     */
    @GetMapping("/edit/{contactId}")
    public String edit(@PathVariable("contactId") Long contactId, ModelMap mmap)
    {
        CmsContact cmsContact = cmsContactService.selectCmsContactById(contactId);
        mmap.put("cmsContact", cmsContact);
        return prefix + "/edit";
    }

    /**
     * 修改保存反馈|建议
     */
    @RequiresPermissions("cms:contact:edit")
    @Log(title = "反馈|建议", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(CmsContact cmsContact)
    {
        return toAjax(cmsContactService.updateCmsContact(cmsContact));
    }

    /**
     * 删除反馈|建议
     */
    @RequiresPermissions("cms:contact:remove")
    @Log(title = "反馈|建议", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(cmsContactService.deleteCmsContactByIds(ids));
    }
}
