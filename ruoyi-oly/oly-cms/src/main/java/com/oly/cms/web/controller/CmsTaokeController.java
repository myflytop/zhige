package com.oly.cms.web.controller;

import java.util.ArrayList;
import java.util.List;

import com.oly.cms.system.model.CmsTaoke;
import com.oly.cms.system.model.param.ImportPam;
import com.oly.cms.system.model.po.taoke.JdImportExcel;
import com.oly.cms.system.model.po.taoke.PddImportExcel;
import com.oly.cms.system.service.ICmsTaokeService;
import com.oly.cms.web.CmsCommonController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.ShiroUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 淘客Controller
 *
 * @author ruoyi
 * @date 2020-05-07
 */
@Controller
@RequestMapping("/cms/taoke")
public class CmsTaokeController extends CmsCommonController {

    private final String prefix = acceptPreifx + "taoke";

    @Autowired
    private ICmsTaokeService cmsTaokeService;

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
        ExcelUtil<JdImportExcel> jDutil = new ExcelUtil<JdImportExcel>(JdImportExcel.class);
        ExcelUtil<PddImportExcel> pDdutil = new ExcelUtil<PddImportExcel>(PddImportExcel.class);
        List<CmsTaoke> userList=new ArrayList<>();
        if(importPam.getTaoType()==0)
        {
            userList = util.importExcel(importPam.getFile().getInputStream());
        }
        else if(importPam.getTaoType()==1)
        {
            for (CmsTaoke cmsTaoke : jDutil.importExcel(importPam.getFile().getInputStream())) {
                cmsTaoke.setShopId(Integer.toString(cmsTaoke.getShopName().hashCode()));
                cmsTaoke.setShopImg("https:////"+cmsTaoke.getShopImg());
                userList.add(cmsTaoke);
            }
          
        }
        else{
            for (CmsTaoke cmsTaoke : pDdutil.importExcel(importPam.getFile().getInputStream())) {
                userList.add(cmsTaoke);
            }
        }
        //操作人
        String operName = ShiroUtils.getLoginName();
        String message = cmsTaokeService.importTaos(userList,importPam.getCats(),importPam.getTags(), importPam.getTaoType(),importPam.getUpdateSupport(),importPam.getTemplateId(), operName);
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
     * @param ids
     * @return
     */
    @RequiresPermissions("cms:taoke:edit")
    @Log(title = "淘客", businessType = BusinessType.UPDATE)
    @PostMapping("/putOn")
    @ResponseBody
    public AjaxResult putOn(String ids,Byte fettle) {
        return toAjax(cmsTaokeService.updateCmsTaokePutOn(ids,fettle));
    }

}
