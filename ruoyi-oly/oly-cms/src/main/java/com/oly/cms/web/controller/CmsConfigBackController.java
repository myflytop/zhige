package com.oly.cms.web.controller;

import java.util.List;

import com.oly.cms.system.model.po.CmsConfigBack;
import com.oly.cms.system.service.ICmsConfigBackService;
import com.oly.cms.web.CmsCommonController;
import com.oly.common.model.enums.OlyConfigCommonEnum;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.enums.ConfigValueTypeEnum;
import com.ruoyi.common.utils.ShiroUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.system.domain.SysConfig;
import com.ruoyi.system.service.impl.SysConfigServiceImpl;

import org.apache.commons.lang3.math.NumberUtils;
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
 * 配置文件备份Controller
 * 
 * @author 止戈
 * @date 2021-04-04
 */
@Controller
@RequestMapping("/cms/configBack")
public class CmsConfigBackController extends CmsCommonController {

    private static final String prefix = acceptPreifx + "configBack";

    private static final String backPrefix = OlyConfigCommonEnum.OLY_WBE_PREIFX.getValue();

    @Autowired
    private SysConfigServiceImpl sysConfigService;

    @Autowired
    private ICmsConfigBackService cmsConfigBackService;

    @RequiresPermissions("cms:configBack:view")
    @GetMapping()
    public String back() {
        return prefix + "/configBack";
    }

    /**
     * 查询配置文件备份列表
     */
    @RequiresPermissions("cms:configBack:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(CmsConfigBack cmsConfigBack) {
        startPage();
        List<CmsConfigBack> list = cmsConfigBackService.selectCmsConfigBackList(cmsConfigBack);
        return getDataTable(list);
    }

    /**
     * 导出配置文件备份列表
     */
    @RequiresPermissions("cms:configBack:export")
    @Log(title = "配置文件备份", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(CmsConfigBack cmsConfigBack) {
        List<CmsConfigBack> list = cmsConfigBackService.selectCmsConfigBackList(cmsConfigBack);
        ExcelUtil<CmsConfigBack> util = new ExcelUtil<CmsConfigBack>(CmsConfigBack.class);
        return util.exportExcel(list, "back");
    }

    /**
     * 修改配置文件备份
     */
    @GetMapping("/edit/{configGroup}")
    public String edit(@PathVariable("configGroup") String configGroup, ModelMap mmap) {
        CmsConfigBack cmsConfigBack = cmsConfigBackService.selectCmsConfigBackById(configGroup);
        mmap.put("cmsConfigBack", cmsConfigBack);
        return prefix + "/edit";
    }

    /**
     * 修改保存配置文件备份
     */
    @RequiresPermissions("cms:configBack:edit")
    @Log(title = "配置文件备份", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(CmsConfigBack cmsConfigBack) {
        return toAjax(cmsConfigBackService.updateCmsConfigBack(cmsConfigBack));
    }

    /**
     * 删除配置文件备份
     */
    @RequiresPermissions("cms:configBack:remove")
    @Log(title = "配置文件备份", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(cmsConfigBackService.deleteCmsConfigBackByIds(ids));
    }

    /**
     * 
     * @param configGroup 组别名
     * @return
     */
    @RequiresPermissions("cms:configBack:remove")
    @Log(title = "配置文件备份", businessType = BusinessType.INSERT)
    @PostMapping("/back")
    @ResponseBody
    public AjaxResult back(String configGroup) {
        SysConfig sysConfig = new SysConfig();
        sysConfig.setConfigKey(backPrefix);
        List<SysConfig> lists = sysConfigService.selectConfigList(sysConfig);
        if (!lists.isEmpty()) {
            for (SysConfig sysConfig2 : lists) {
                CmsConfigBack cmsConfigBack = new CmsConfigBack();
                cmsConfigBack.setConfigKey(sysConfig2.getConfigKey());
                cmsConfigBack.setConfigValue(sysConfig2.getConfigValue());
                cmsConfigBack.setConfigGroup(configGroup);
                if (cmsConfigBackService.isExist(configGroup, sysConfig2.getConfigKey())) {
                    cmsConfigBack.setUpdateBy(ShiroUtils.getUserId());
                    cmsConfigBackService.updateCmsConfigBack(cmsConfigBack);
                } else {
                    cmsConfigBack.setCreateBy(ShiroUtils.getUserId());
                    cmsConfigBackService.insertCmsConfigBack(cmsConfigBack);
                }
            }

        }
        return AjaxResult.success();
    }

    /**
     * 备份还原 只做更新操作
     * 
     * @return
     */
    @RequiresPermissions("cms:configBack:update")
    @Log(title = "配置文件备份", businessType = BusinessType.UPDATE)
    @PostMapping("/vatting")
    @ResponseBody
    public AjaxResult vatting(String configGroup) {
        CmsConfigBack cmsConfigBack = new CmsConfigBack();
        cmsConfigBack.setConfigGroup(configGroup);
        List<CmsConfigBack> backs = cmsConfigBackService.selectCmsConfigBackList(cmsConfigBack);
        for (CmsConfigBack cmsConfigBack2 : backs) {
            SysConfig rsConfig = sysConfigService.getConfigByKey(cmsConfigBack2.getConfigKey());
            // 存在执行更新操作
            if (StringUtils.isNotNull(rsConfig)) {
                if (checkType(rsConfig.getConfigValueType(), cmsConfigBack2.getConfigValue())) {
                    SysConfig sysConfig = new SysConfig();
                    sysConfig.setUpdateBy(ShiroUtils.getLoginName());
                    sysConfig.setConfigKey(cmsConfigBack2.getConfigKey());
                    sysConfig.setConfigValue(cmsConfigBack2.getConfigValue());
                    sysConfigService.updateConfigByKey(sysConfig);
                }
            }

        }
        return AjaxResult.success();
    }

    /**
     * 判断是否符合预期类型
     * 
     * @param type
     * @param object
     * @return
     */
    private boolean checkType(int type, Object object) {
        if (type == ConfigValueTypeEnum.BOOLEAN.ordinal()) {
            return "true".equals(object) || "false".equals(object);
        } else if (type == ConfigValueTypeEnum.NUMBER.ordinal()) {
            return NumberUtils.isCreatable(object.toString());
        } else {
            return true;
        }
    }

}