package com.oly.cms.admin.controller.page;

import java.util.ArrayList;
import java.util.List;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.oly.cms.admin.model.enums.UnionTypeEnums;
import com.oly.cms.admin.model.po.taoke.JdImportExcel;
import com.oly.cms.admin.service.ICmsTagService;
import com.oly.cms.admin.service.ICmsUnionService;
import com.oly.cms.admin.web.CmsCommonController;
import com.oly.cms.common.domain.entity.CmsTag;
import com.oly.cms.common.domain.entity.CmsUnion;
import com.oly.cms.common.model.properties.OlyCmsConfigProperties;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.enums.OperateTitle;
import com.ruoyi.common.utils.ShiroUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.utils.uuid.IdUtils;
import com.ruoyi.system.config.service.ISysConfigService;

/**
 * 联盟推广Controller
 * 
 * @author zg
 * @date 2022-05-30
 */
@Controller
@RequestMapping("/cms/union")
public class CmsUnionController extends CmsCommonController {
    private final String prefix = acceptPrefix + "union";

    @Autowired
    private ICmsUnionService cmsUnionService;

    @Autowired
    private ICmsTagService tagService;

    @Autowired
    private ISysConfigService sysConfigService;

    @RequiresPermissions("cms:union:view")
    @GetMapping()
    public String union(ModelMap map) {
        CmsTag cmsTag = new CmsTag();
        map.put("tags", tagService.listCmsTagByTag(cmsTag));
        return prefix + "/union";
    }

    /**
     * 查询联盟推广列表
     */
    @RequiresPermissions("cms:union:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(CmsUnion cmsUnion) {
        startPage();
        List<CmsUnion> list = cmsUnionService.selectCmsUnionList(cmsUnion);
        return getDataTable(list);
    }

    /**
     * 导出联盟推广列表
     */
    @RequiresPermissions("cms:union:export")
    @Log(title = OperateTitle.CMS_UNION, businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(CmsUnion cmsUnion) {
        List<CmsUnion> list = cmsUnionService.selectCmsUnionList(cmsUnion);
        ExcelUtil<CmsUnion> util = new ExcelUtil<CmsUnion>(CmsUnion.class);
        return util.exportExcel(list, "联盟推广数据");
    }

    /**
     * 导入淘客列表
     *
     * @return
     * @throws Exception
     */
    @RequiresPermissions("cms:union:import")
    @Log(title = OperateTitle.CMS_UNION, businessType = BusinessType.IMPORT)
    @PostMapping("/importData")
    @ResponseBody
    public AjaxResult importData(MultipartFile file, boolean updateSupport, UnionTypeEnums unionType,
            @RequestParam(value = "cats", required = false) String cats,
            @RequestParam(value = "tags", required = false) String tags) throws Exception {
        if (StringUtils.isNotEmpty(cats)
                && Convert.toStrArray(cats).length > Convert.toInt(sysConfigService.selectConfigDefauleValue(
                        OlyCmsConfigProperties.CMS_CONFIG_GROUP.defaultValue(),
                        OlyCmsConfigProperties.UNION_CAT_SIZE))) {
            return AjaxResult.error("关联分类超过上限!");
        }
        if (StringUtils.isNotEmpty(tags)
                && Convert.toStrArray(tags).length > Convert.toInt(sysConfigService.selectConfigDefauleValue(
                        OlyCmsConfigProperties.CMS_CONFIG_GROUP.defaultValue(),
                        OlyCmsConfigProperties.UNION_TAG_SIZE))) {
            return AjaxResult.error("关联标签超过上限!");
        }
        List<CmsUnion> unionList = new ArrayList<>();
        switch (unionType) {
            case TB:
                ExcelUtil<CmsUnion> util = new ExcelUtil<CmsUnion>(CmsUnion.class);
                unionList = util.importExcel(file.getInputStream());
                break;
            case JD:
                ExcelUtil<JdImportExcel> util2 = new ExcelUtil<JdImportExcel>(JdImportExcel.class);
                for (CmsUnion each : util2.importExcel(file.getInputStream())) {
                    each.setShopId(IdUtils.getMd5(each.getShopName()));
                    each.setShopImg("https:////" + each.getShopImg());
                    unionList.add(each);
                }
                break;
        }

        String message = cmsUnionService.importUnions(unionList, updateSupport, unionType, tags, cats);
        return AjaxResult.success(message);
    }

    @RequiresPermissions("cms:union:import")
    @Log(title = OperateTitle.CMS_UNION, businessType = BusinessType.EXPORT)
    @GetMapping("/importTemplate")
    @ResponseBody
    public AjaxResult importTemplate() {
        ExcelUtil<CmsUnion> util = new ExcelUtil<CmsUnion>(CmsUnion.class);
        return util.importTemplateExcel("联盟数据模板");
    }

    /**
     * 新增联盟推广
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 新增保存联盟推广
     */
    @RequiresPermissions("cms:union:add")
    @Log(title = OperateTitle.CMS_UNION, businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(CmsUnion cmsUnion) {
        return toAjax(cmsUnionService.insertCmsUnion(cmsUnion));
    }

    /**
     * 修改联盟推广
     */
    @RequiresPermissions("cms:union:edit")
    @GetMapping("/edit/{shopId}")
    public String edit(@PathVariable("shopId") String shopId, ModelMap map) {
        CmsUnion cmsUnion = cmsUnionService.selectCmsUnionByShopId(shopId);
        map.put("cmsUnion", cmsUnion);
        return prefix + "/edit";
    }

    /**
     * 修改保存联盟推广
     */
    @RequiresPermissions("cms:union:edit")
    @Log(title = OperateTitle.CMS_UNION, businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(CmsUnion cmsUnion) {
        return toAjax(cmsUnionService.updateCmsUnion(cmsUnion));
    }

    /**
     * 删除联盟推广
     */
    @RequiresPermissions("cms:union:remove")
    @Log(title = OperateTitle.CMS_UNION, businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(cmsUnionService.deleteCmsUnionByShopIds(ids));
    }

    /**
     * 
     * @param ids
     * @param visible
     * @return
     */
    @RequiresPermissions("cms:union:edit")
    @Log(title = OperateTitle.CMS_UNION, businessType = BusinessType.UPDATE)
    @PostMapping("/updateVisible")
    @ResponseBody
    public AjaxResult updateVisible(String ids, int visible) {
        return toAjax(cmsUnionService.updateCmsUnionVisible(ids, visible));
    }

    /**
     * @param shopId
     * @param visible
     * @return
     */
    @RequiresPermissions("cms:union:edit")
    @Log(title = OperateTitle.CMS_UNION, businessType = BusinessType.UPDATE)
    @PostMapping("/updateTags")
    @ResponseBody
    public AjaxResult updateTags(String shopId, String tags) {
        if (StringUtils.isNotEmpty(tags)
                && Convert.toStrArray(tags).length > Convert.toInt(sysConfigService.selectConfigDefauleValue(
                        OlyCmsConfigProperties.CMS_CONFIG_GROUP.defaultValue(),
                        OlyCmsConfigProperties.UNION_TAG_SIZE))) {
            return AjaxResult.error("关联标签超过上限!");
        }
        CmsUnion union = new CmsUnion();
        union.setShopId(shopId);
        union.setTags(tags);
        union.setCreateBy(ShiroUtils.getUserIdStr());
        return toAjax(cmsUnionService.updateCmsUnion(union));
    }
}
