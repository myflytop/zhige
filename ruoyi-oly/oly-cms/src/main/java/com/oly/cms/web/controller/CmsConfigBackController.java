package com.oly.cms.web.controller;

import java.util.List;
import java.util.Map;

import com.oly.cms.system.model.po.CmsConfigBack;
import com.oly.cms.system.service.ICmsConfigBackService;
import com.oly.cms.web.CmsCommonController;
import com.oly.common.constant.CacheConstant;
import com.oly.common.model.enums.OlyConfigCommonEnum;
import com.oly.framework.event.CacheWebRefreshEvent;
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
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

    private static final String backWebPrefix = OlyConfigCommonEnum.OLY_WBE_PREIFX.getValue();

    private static final String backThemePrefix = OlyConfigCommonEnum.OLY_THEME_PREFIX.getValue();

    @Autowired
    private SysConfigServiceImpl sysConfigService;

    @Autowired
    private ICmsConfigBackService cmsConfigBackService;

    @Autowired
    private ApplicationEventPublisher app;

    @RequiresPermissions("cms:configBack:view")
    @GetMapping()
    public String back(ModelMap mp) {
        mp.put("configGroups", cmsConfigBackService.listGroup());
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
     * 修改配置文件
     */
    @GetMapping("/edit/{configGroup}")
    public String edit(@PathVariable("configGroup") String configGroup, ModelMap mmap) {
        Map<String, String> mps = selectConfigValueMap(configGroup);
        if (mps.isEmpty()) {
            backConfig(configGroup, backWebPrefix);
            mps = selectConfigValueMap(configGroup);
        }
        mmap.put("webConfig", mps);
        mmap.put("configGroup", configGroup);
        return prefix + "/webConfig";
    }

    /**
     * 主题设置
     *
     * @return
     */
    @GetMapping("/themeSetting/{configGroup}")
    @RequiresPermissions("cms:theme:edit")
    public String themeSetting(@PathVariable("configGroup") String configGroup, ModelMap mmap) {
        Map<String, String> mps = cmsConfigBackService.getConfigBackValueMap(configGroup, backThemePrefix);
        mmap.put("themeConfig", mps);
        mmap.put("configGroup", configGroup);
        // 从主题加载
        return configGroup + "/setting/setting";
    }

    /**
     * 修改保存参数配置 通过key批量保存 默认设置为字符串类型
     */
    @RequiresPermissions("system:config:edit")
    @Log(title = "参数管理", businessType = BusinessType.UPDATE)
    @PostMapping("/update/{configGroup}")
    @ResponseBody
    public AjaxResult editSaves(@PathVariable("configGroup") String configGroup, @RequestParam Map<String, String> mp) {
        int i = 0;
        for (Map.Entry<String, String> entry : mp.entrySet()) {
            CmsConfigBack config = new CmsConfigBack();
            config.setConfigKey(entry.getKey());
            config.setConfigValue(entry.getValue());
            config.setConfigGroup(configGroup);
            CmsConfigBack rsConfig = cmsConfigBackService.getConfigByUnink(configGroup, config.getConfigKey());
            // 存在执行更新操作
            if (StringUtils.isNotNull(rsConfig)) {
                config.setUpdateBy(ShiroUtils.getUserId());
                cmsConfigBackService.updateCmsConfigBack(config);
            }
            // 不存在执行插入操作
            else {
                config.setCreateBy(ShiroUtils.getUserId());
                cmsConfigBackService.insertCmsConfigBack(config);
            }
            i = +1;
        }
        app.publishEvent(new CacheWebRefreshEvent(this, CacheConstant.CONFIG_CACHE_KEY_PREFIX));
        return toAjax(i);
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
     * 删除配置文件备份
     */
    @RequiresPermissions("cms:configBack:remove")
    @Log(title = "配置文件备份", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult removeByGroup(String configGroup) {
        int re = cmsConfigBackService.deleteCmsConfigBackByGroup(configGroup);
        app.publishEvent(new CacheWebRefreshEvent(this, CacheConstant.CONFIG_CACHE_KEY_PREFIX));
        return toAjax(re);
    }

    /**
     * 配置文件备份 config--config_back
     * 
     * @param configGroup 组别名
     * @return
     */
    @RequiresPermissions("cms:configBack:add")
    @Log(title = "配置文件备份", businessType = BusinessType.INSERT)
    @PostMapping("/back")
    @ResponseBody
    public AjaxResult back(String configGroup) {
        backConfig(configGroup, backWebPrefix);
        app.publishEvent(new CacheWebRefreshEvent(this, CacheConstant.CONFIG_CACHE_KEY_PREFIX));
        return AjaxResult.success();
    }

    /**
     * 备份还原 只做更新操作 config_back--config
     * 
     * @param configGroup 组别名
     * @return
     */
    @RequiresPermissions("cms:configBack:update")
    @Log(title = "配置文件还原", businessType = BusinessType.UPDATE)
    @PostMapping("/vatting")
    @ResponseBody
    public AjaxResult vatting(String configGroup) {
        vattingConfig(configGroup);
        app.publishEvent(new CacheWebRefreshEvent(this, CacheConstant.CONFIG_CACHE_KEY_PREFIX));
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

    private Map<String, String> selectConfigValueMap(String configGroup) {

        return cmsConfigBackService.getConfigBackValueMap(configGroup);
    }

    /**
     * @param configGroup
     * @param backPrefix
     */
    private void backConfig(String configGroup, String backPrefix) {
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
    }

    /**
     * 备份还原
     *
     * @param configGroup
     */
    private void vattingConfig(String configGroup) {
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

    }

}
