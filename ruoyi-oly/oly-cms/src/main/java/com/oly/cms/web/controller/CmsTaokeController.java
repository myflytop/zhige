package com.oly.cms.web.controller;

import java.util.List;

import com.oly.cms.system.model.CmsTaoke;
import com.oly.cms.system.model.param.ImportPam;
import com.oly.cms.system.service.ICmsTaokeService;
import com.oly.cms.web.CmsCommonController;
import com.oly.common.model.enums.OlyConfigCommonEnum;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.ShiroUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.system.domain.SysConfig;
import com.ruoyi.system.service.impl.SysConfigServiceImpl;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
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

    @Autowired
    private SysConfigServiceImpl configService;


    private final String configPrefix= OlyConfigCommonEnum.OLY_TAO_PREFIX.getValue();
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
        SysConfig cmsConfig = new SysConfig();
        cmsConfig.setConfigKey(configPrefix);
        mp.put("taokeConfig",configService.selectConfigValueMap(cmsConfig));
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
        //操作人
        String operName = ShiroUtils.getLoginName();
        String message = cmsTaokeService.importTaos(userList,importPam.getCats(),importPam.getTags(), importPam.getTaoType(),importPam.getUpdateSupport(), operName);
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
