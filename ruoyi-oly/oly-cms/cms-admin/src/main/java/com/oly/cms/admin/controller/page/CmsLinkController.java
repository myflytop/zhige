package com.oly.cms.admin.controller.page;

import java.util.List;

import com.oly.cms.common.domain.entity.CmsLink;
import com.oly.cms.admin.service.ICmsLinkService;
import com.oly.cms.admin.web.CmsCommonController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.enums.OperateTitle;
import com.ruoyi.common.utils.ShiroUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/cms/link")
public class CmsLinkController extends CmsCommonController {
    private String prefix = acceptPrefix + "link";

    @Autowired
    private ICmsLinkService cmsLinkService;

    @RequiresPermissions("cms:link:view")
    @GetMapping()
    public String link(ModelMap mp) {
        mp.put("groups", cmsLinkService.listLinkGroupNames());
        return prefix + "/link";
    }

    /**
     * 查询友情链接列表
     */
    @RequiresPermissions("cms:link:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(CmsLink cmsLink) {
        startPage();
        List<CmsLink> list = cmsLinkService.selectCmsLinkList(cmsLink);
        return getDataTable(list);
    }

    /**
     * 导出友情链接列表
     */
    @RequiresPermissions("cms:link:export")
    @Log(title = OperateTitle.CMS_LINK, businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(CmsLink cmsLink) {
        List<CmsLink> list = cmsLinkService.selectCmsLinkList(cmsLink);
        ExcelUtil<CmsLink> util = new ExcelUtil<CmsLink>(CmsLink.class);
        return util.exportExcel(list, "link");
    }

    /**
     * 新增友情链接
     */
    @GetMapping("/add")
    @RequiresPermissions("cms:link:add")
    public String add(ModelMap mp) {
        mp.put("groups", cmsLinkService.listLinkGroupNames());
        return prefix + "/add";
    }

    /**
     * 新增保存友情链接
     */
    @RequiresPermissions("cms:link:add")
    @Log(title = OperateTitle.CMS_LINK, businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(@Validated CmsLink cmsLink) {
        cmsLink.setCreateBy(ShiroUtils.getUserIdStr());
        return toAjax(cmsLinkService.insertCmsLink(cmsLink));
    }

    /**
     * 修改友情链接
     */
    @GetMapping("/edit/{linkId}")
    @RequiresPermissions("cms:link:edit")
    public String edit(@PathVariable("linkId") Long linkId, ModelMap mmap) {
        CmsLink cmsLink = cmsLinkService.selectCmsLinkById(linkId);
        mmap.put("groups", cmsLinkService.listLinkGroupNames());
        mmap.put("cmsLink", cmsLink);
        return prefix + "/edit";
    }

    /**
     * 修改保存友情链接
     */
    @RequiresPermissions("cms:link:edit")
    @Log(title = OperateTitle.CMS_LINK, businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(@Validated CmsLink cmsLink) {
        return toAjax(cmsLinkService.updateCmsLink(cmsLink));
    }

    /**
     * 删除友情链接
     */
    @RequiresPermissions("cms:link:remove")
    @Log(title = OperateTitle.CMS_LINK, businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(cmsLinkService.deleteCmsLinkByIds(ids));
    }

}
