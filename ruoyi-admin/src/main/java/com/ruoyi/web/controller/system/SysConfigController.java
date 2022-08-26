package com.ruoyi.web.controller.system;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.enums.OperateTitle;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.system.config.domain.SysConfig;
import com.ruoyi.system.config.service.ISysConfigService;
import com.ruoyi.system.core.service.ISysDeptService;
import com.ruoyi.system.core.service.ISysPostService;
import com.ruoyi.system.core.service.ISysRoleService;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 参数配置 信息操作处理
 * 
 * @author ruoyi
 */
@Controller
@RequestMapping("/system/config")
public class SysConfigController extends BaseController {
    private String prefix = "system/config";

    @Autowired
    private ISysConfigService configService;

    @Autowired
    private ISysRoleService roleService;

    @Autowired
    private ISysPostService postService;

    @Autowired
    private ISysDeptService deptService;

    @RequiresPermissions("system:config:view")
    @GetMapping()
    public String config(ModelMap map) {
        return prefix + "/config";
    }

    /**
     * 系统参数设置
     * 
     * @return
     */
    @RequiresPermissions("system:setting:view")
    @GetMapping("setting")
    public String setting(ModelMap map) {
        map.put("roles", roleService.selectRoleAll().stream().filter(r -> !r.isAdmin()).collect(Collectors.toList()));
        map.put("posts", postService.selectPostAll());
        map.put("dept", deptService.selectDeptById(
                Convert.toLong(configService.selectConfigValueByGk("sysUser", "sys.account.defaultDept"), 0L)));
        return prefix + "/setting";
    }

    /**
     * 修改保存参数配置 通过key批量保存 默认设置为字符串类型
     */
    @RequiresPermissions("system:setting:edit")
    @Log(title = OperateTitle.SYS_CONFIG, businessType = BusinessType.UPDATE)
    @PostMapping("/updateByGk")
    @ResponseBody
    public AjaxResult editByGkSaves(@RequestParam Map<String, String> mp) {
        return toAjax(configService.updatesByMap(mp));
    }

    /**
     * 查询参数配置列表
     */
    @RequiresPermissions("system:config:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(SysConfig config) {
        startPage();
        List<SysConfig> list = configService.selectConfigList(config);
        return getDataTable(list);
    }

    @Log(title = OperateTitle.SYS_CONFIG, businessType = BusinessType.EXPORT)
    @RequiresPermissions("system:config:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(SysConfig config) {
        List<SysConfig> list = configService.selectConfigList(config);
        ExcelUtil<SysConfig> util = new ExcelUtil<SysConfig>(SysConfig.class);
        return util.exportExcel(list, "参数数据");
    }

    /**
     * 新增参数配置
     */
    @GetMapping("/add")
    @RequiresPermissions("system:config:add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 新增保存参数配置
     */
    @RequiresPermissions("system:config:add")
    @Log(title = OperateTitle.SYS_CONFIG, businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(@Validated SysConfig config) {
        if (UserConstants.CONFIG_KEY_NOT_UNIQUE.equals(configService.checkConfigGkUnique(config))) {
            return error("新增参数'" + config.getConfigName() + "'失败，组别与键名已存在");
        }
        config.setCreateBy(getLoginName());
        return toAjax(configService.insertConfig(config));
    }

    /**
     * 修改参数配置
     */
    @RequiresPermissions("system:config:edit")
    @GetMapping("/edit/{configId}")
    public String edit(@PathVariable("configId") Long configId, ModelMap map) {
        map.put("config", configService.selectConfigById(configId));
        return prefix + "/edit";
    }

    /**
     * 修改保存参数配置
     */
    @RequiresPermissions("system:config:edit")
    @Log(title = OperateTitle.SYS_CONFIG, businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(@Validated SysConfig config) {
        if (UserConstants.CONFIG_KEY_NOT_UNIQUE.equals(configService.checkConfigGkUnique(config))) {
            return error("修改参数'" + config.getConfigName() + "'失败，组别与键名已存在");
        }
        config.setUpdateBy(getLoginName());
        return toAjax(configService.updateConfigById(config));
    }

    /**
     * 删除参数配置
     */
    @RequiresPermissions("system:config:remove")
    @Log(title = OperateTitle.SYS_CONFIG, businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        configService.deleteConfigByIds(ids);
        return success();
    }

    /**
     * 刷新参数缓存
     */
    @RequiresPermissions("system:config:remove")
    @Log(title = OperateTitle.SYS_CONFIG, businessType = BusinessType.CLEAN)
    @GetMapping("/refreshCache")
    @ResponseBody
    public AjaxResult refreshCache() {
        configService.resetConfigCache();
        return success();
    }

    /**
     * 校验参数键名及组别
     */
    @PostMapping("/checkConfigGkUnique")
    @ResponseBody
    public String checkConfigGkUnique(SysConfig config) {
        return configService.checkConfigGkUnique(config);
    }
}
