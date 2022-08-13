package com.oly.cms.admin.controller.page;

import java.util.List;

import com.oly.cms.common.domain.entity.CmsContact;
import com.oly.cms.admin.service.ICmsContactService;
import com.oly.cms.admin.web.CmsCommonController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.enums.CommonVisibleEnums;
import com.ruoyi.common.enums.OperateTitle;
import com.ruoyi.common.utils.ShiroUtils;
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

/**
 * 反馈|建议Controller
 * 
 * @author zg
 * @date 2020-06-15
 */
@Controller
@RequestMapping("/cms/contact")
public class CmsContactController extends CmsCommonController {
    private String prefix = acceptPrefix + "contact";

    @Autowired
    private ICmsContactService cmsContactService;

    @RequiresPermissions("cms:contact:view")
    @GetMapping()
    public String contact() {
        return prefix + "/contact";
    }

    /**
     * 查询反馈|建议列表
     */
    @RequiresPermissions("cms:contact:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(CmsContact cmsContact) {
        startPage();
        List<CmsContact> list = cmsContactService.selectCmsContactList(cmsContact);
        return getDataTable(list);
    }

    /**
     * 导出反馈|建议列表
     */
    @RequiresPermissions("cms:contact:export")
    @Log(title = OperateTitle.CMS_CONTACT, businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(CmsContact cmsContact) {
        List<CmsContact> list = cmsContactService.selectCmsContactList(cmsContact);
        ExcelUtil<CmsContact> util = new ExcelUtil<CmsContact>(CmsContact.class);
        return util.exportExcel(list, "contact");
    }

    /**
     * 新增反馈|建议
     */
    @GetMapping("/add")
    @RequiresPermissions("cms:contact:add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 新增保存反馈|建议
     */
    @RequiresPermissions("cms:contact:add")
    @Log(title = OperateTitle.CMS_CONTACT, businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(CmsContact cmsContact) {
        cmsContact.setCreateBy(ShiroUtils.getUserIdStr());
        return toAjax(cmsContactService.insertCmsContact(cmsContact));
    }

    /**
     * 查看反馈|建议
     */
    @GetMapping("/detail/{contactId}")
    @RequiresPermissions("cms:contact:view")
    public String detail(@PathVariable("contactId") Long contactId, ModelMap mm) {
        CmsContact cmsContact = cmsContactService.selectCmsContactById(contactId);
        mm.put("cmsContact", cmsContact);
        return prefix + "/detail";
    }

    /**
     * 修改反馈|建议
     */
    @RequiresPermissions("cms:contact:edit")
    @GetMapping("/edit/{contactId}")
    public String edit(@PathVariable("contactId") Long contactId, ModelMap mm) {
        CmsContact cmsContact = cmsContactService.selectCmsContactById(contactId);
        mm.put("cmsContact", cmsContact);
        return prefix + "/edit";
    }

    /**
     * 处理反馈
     */
    @RequiresPermissions("cms:contact:edit")
    @Log(title = OperateTitle.CMS_CONTACT, businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(CmsContact cmsContact) {
        if (cmsContact.getVisible() == CommonVisibleEnums.SHOW.ordinal()) {
            cmsContact.setHandler(ShiroUtils.getUserIdStr());
        }
        return toAjax(cmsContactService.updateCmsContact(cmsContact));
    }

    /**
     * 删除反馈 物理删除
     */
    @RequiresPermissions("cms:contact:remove")
    @Log(title = OperateTitle.CMS_CONTACT, businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(cmsContactService.deleteCmsContactByIds(ids));
    }
}
