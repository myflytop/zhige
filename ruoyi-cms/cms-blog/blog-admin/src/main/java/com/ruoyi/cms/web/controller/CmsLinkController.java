package com.ruoyi.cms.web.controller;

import java.util.List;
import com.ruoyi.cms.system.model.po.CmsLink;
import com.ruoyi.cms.system.service.ICmsLinkService;
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
 * 友情链接Controller
 * 
 * @author ruoyi
 * @date 2020-04-06
 */
@Controller
@RequestMapping("/cms/link")
public class CmsLinkController extends BaseController
{
    private String prefix = "blog/admin/link";

    @Autowired
    private ICmsLinkService cmsLinkService;

    @RequiresPermissions("cms:link:view")
    @GetMapping()
    public String link()
    {
        return prefix + "/link";
    }

    /**
     * 查询友情链接列表
     */
    @RequiresPermissions("cms:link:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(CmsLink cmsLink)
    {
        startPage();
        List<CmsLink> list = cmsLinkService.selectCmsLinkList(cmsLink);
        return getDataTable(list);
    }

    /**
     * 导出友情链接列表
     */
    @RequiresPermissions("cms:link:export")
    @Log(title = "友情链接", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(CmsLink cmsLink)
    {
        List<CmsLink> list = cmsLinkService.selectCmsLinkList(cmsLink);
        ExcelUtil<CmsLink> util = new ExcelUtil<CmsLink>(CmsLink.class);
        return util.exportExcel(list, "link");
    }

    /**
     * 新增友情链接
     */
    @GetMapping("/add")
    @RequiresPermissions("cms:link:add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存友情链接
     */
    @RequiresPermissions("cms:link:add")
    @Log(title = "友情链接", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(CmsLink cmsLink)
    {
        return toAjax(cmsLinkService.insertCmsLink(cmsLink));
    }

    /**
     * 修改友情链接
     */
    @GetMapping("/edit/{linkId}")
    @RequiresPermissions("cms:link:edit")
    public String edit(@PathVariable("linkId") Long linkId, ModelMap mmap)
    {
        CmsLink cmsLink = cmsLinkService.selectCmsLinkById(linkId);
        mmap.put("cmsLink", cmsLink);
        return prefix + "/edit";
    }

    /**
     * 修改保存友情链接
     */
    @RequiresPermissions("cms:link:edit")
    @Log(title = "友情链接", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(CmsLink cmsLink)
    {
        return toAjax(cmsLinkService.updateCmsLink(cmsLink));
    }

    /**
     * 删除友情链接
     */
    @RequiresPermissions("cms:link:remove")
    @Log(title = "友情链接", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(cmsLinkService.deleteCmsLinkByIds(ids));
    }
}
