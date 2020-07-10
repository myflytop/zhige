package com.ruoyi.taoke.admin.web.controller;

import com.ruoyi.cms.common.enums.ConfigPreifxEnum;
import com.ruoyi.taoke.admin.model.CmsTaoke;
import com.ruoyi.taoke.admin.service.ICmsTaokeService;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.util.ShiroUtils;
import com.ruoyi.system.service.impl.SysConfigServiceImpl;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 淘客Controller
 *
 * @author ruoyi
 * @date 2020-05-07
 */
@Controller
@RequestMapping("/cms/taoke")
public class CmsTaokeController extends BaseController {
    private String prefix = "taoke/admin";

    @Autowired
    private ICmsTaokeService cmsTaokeService;

    @Autowired
    private SysConfigServiceImpl configService;


    private final String configPrefix= ConfigPreifxEnum.TAOKE_CONFIG.getValue();
    /**
     * 淘客列表
     * @return
     */
    @RequiresPermissions("cms:taoke:view")
    @GetMapping()
    public String taoke() {
        return prefix + "/taoke";
    }

    /**
     * 淘客配置
     * @return
     */
    @RequiresPermissions("cms:taoke:config")
    @GetMapping("/config")
    public String manage(ModelMap mp) {
        mp.put("taokeConfig",configService.selectConfigMap(configPrefix));
        return prefix + "/config";
    }

    /**
     * 查询淘客列表
     */
    @RequiresPermissions("cms:taoke:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(CmsTaoke cmsTaoke) {
        startPage();
        List<CmsTaoke> list = cmsTaokeService.selectCmsTaokeList(cmsTaoke);
        return getDataTable(list);
    }

    /**
     * 导出淘客列表
     */
    @RequiresPermissions("cms:taoke:export")
    @Log(title = "淘客", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(CmsTaoke cmsTaoke) {
        List<CmsTaoke> list = cmsTaokeService.selectCmsTaokeList(cmsTaoke);
        ExcelUtil<CmsTaoke> util = new ExcelUtil<CmsTaoke>(CmsTaoke.class);
        return util.exportExcel(list, "淘客数据");
    }

    /**
     * 导入淘客列表
     * @return
     * @throws Exception
     */
    @RequiresPermissions("cms:taoke:edit")
    @Log(title = "淘客", businessType = BusinessType.IMPORT)
    @PostMapping("/importData")
    @ResponseBody
    public AjaxResult importData(ImportPam importPam) throws Exception
    {
        ExcelUtil<CmsTaoke> util = new ExcelUtil<CmsTaoke>(CmsTaoke.class);
        List<CmsTaoke> userList = util.importExcel(importPam.getFile().getInputStream());
        String operName = ShiroUtils.getLoginName();
        String message = cmsTaokeService.importTaos(userList,importPam.getCats(),importPam.getTags(), importPam.getUpdateSupport(), operName);
        return AjaxResult.success(message);
    }

    /**
     * 获取模板
     * @return
     */
    @RequiresPermissions("cms:taoke:export")
    @Log(title = "淘客", businessType = BusinessType.IMPORT)
    @GetMapping("/exportTemplate")
    @ResponseBody
    public AjaxResult importTemplate()
    {
        ExcelUtil<CmsTaoke> util = new ExcelUtil<CmsTaoke>(CmsTaoke.class);
        return util.importTemplateExcel("淘客模板");
    }
    /**
     * 新增淘客
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }
    /**
     * 新增保存淘客
     */
    @RequiresPermissions("cms:taoke:add")
    @Log(title = "淘客", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(CmsTaoke cmsTaoke) {
        return toAjax(cmsTaokeService.insertCmsTaoke(cmsTaoke));
    }

    /**
     * 修改淘客
     */
    @GetMapping("/edit/{shopId}")
    public String edit(@PathVariable("shopId") String shopId, ModelMap mmap) {
        CmsTaoke cmsTaoke = cmsTaokeService.selectCmsTaokeById(shopId);
        mmap.put("cmsTaoke", cmsTaoke);
        return prefix + "/edit";
    }

    /**
     * 修改保存淘客
     */
    @RequiresPermissions("cms:taoke:edit")
    @Log(title = "淘客", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(CmsTaoke cmsTaoke) {
        return toAjax(cmsTaokeService.updateCmsTaoke(cmsTaoke));
    }

    /**
     * 删除淘客
     */
    @RequiresPermissions("cms:taoke:remove")
    @Log(title = "淘客", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(cmsTaokeService.deleteCmsTaokeByIds(ids));
    }

    /**
     * 批量上架（1）下架(0)
     * @param ids
     * @return
     */
    @RequiresPermissions("cms:taoke:edit")
    @Log(title = "淘客", businessType = BusinessType.UPDATE)
    @PostMapping("/putOn")
    @ResponseBody
    public AjaxResult putOn(String ids,Byte fettle) {
        if(fettle==0)
        {
            fettle=0;
        }
        else
        {
            fettle=1;
        }
        //撤销
        return toAjax(cmsTaokeService.updateCmsTaokePutOn(ids,fettle));
    }

}
