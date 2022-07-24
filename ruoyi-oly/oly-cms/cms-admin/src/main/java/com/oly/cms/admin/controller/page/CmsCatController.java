package com.oly.cms.admin.controller.page;

import java.util.List;

import com.oly.cms.common.domain.entity.CmsCat;
import com.oly.cms.admin.service.impl.CmsCatServiceImpl;
import com.oly.cms.admin.service.impl.CmsThemeServiceImpl;
import com.oly.cms.admin.web.CmsCommonController;
import com.oly.cms.common.model.properties.OlyWebConfigProperties;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.Ztree;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.enums.CommonVisibleEnums;
import com.ruoyi.common.enums.OperateTitle;
import com.ruoyi.common.utils.ShiroUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.config.service.impl.SysConfigServiceImpl;

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
@RequestMapping("/cms/cat")
public class CmsCatController extends CmsCommonController {

   private String prefix = acceptPrefix + "cat";

   @Autowired
   private CmsCatServiceImpl cmsCatService;

   @Autowired
   private SysConfigServiceImpl configService;

   @Autowired
   private CmsThemeServiceImpl themeServiceImpl;

   /**
    * 类目页面
    * 
    * @return
    */
   @RequiresPermissions("cms:cat:view")
   @GetMapping()
   public String cat(ModelMap map) {
      map.put("themeNames", themeServiceImpl.listThemeNames());
      return prefix + "/cat";
   }

   @RequiresPermissions("cms:cat:list")
   @PostMapping("/list")
   @ResponseBody
   public List<CmsCat> list(CmsCat cmsCat) {
      String configGroup = cmsCat.getParams().get("supportType") == null ? ""
            : cmsCat.getParams().get("supportType").toString();
      if (StringUtils.isNotEmpty(configGroup)) {
         cmsCat.getParams().put("supportType",
               configService.selectConfigDefauleValue(configGroup.toString(), OlyWebConfigProperties.ARTICLE_TYPES));
      }
      startPage();
      List<CmsCat> cmsCats = cmsCatService.listCmsCatByCat(cmsCat);
      return cmsCats;
   }

   @RequiresPermissions("cms:cat:list")
   @GetMapping("/listCatNotHide")
   @ResponseBody
   public List<CmsCat> listCatNotHide(CmsCat cmsCat) {
      cmsCat.setVisible(CommonVisibleEnums.SHOW.ordinal());
      return cmsCatService.listCmsCatByCat(cmsCat);
   }

   /**
    * 文章页面
    * 
    * @return
    */
   @RequiresPermissions("cms:article:view")
   @GetMapping("/relation/{catId}")
   public String relation(@PathVariable("catId") Long catId, ModelMap mp) {
      mp.put("catId", catId);
      mp.put("themeNames", themeServiceImpl.listThemeNames());
      return prefix + "/relation";
   }

   @GetMapping("/add/{catId}")
   @RequiresPermissions("cms:cat:add")
   public String add(@PathVariable(value = "catId") Long catId, ModelMap map) {
      CmsCat parentCat = cmsCatService.selectCmsCatById(catId);
      if (parentCat == null) {
         parentCat = new CmsCat();
         parentCat.setCatId(0L);
         parentCat.setCatName("根目录");
      }
      map.put("parentId", parentCat.getCatId());
      map.put("parentName", parentCat.getCatName());
      return prefix + "/add";
   }

   @Log(title = OperateTitle.CMS_CATEGORY, businessType = BusinessType.INSERT)
   @RequiresPermissions("cms:cat:add")
   @PostMapping("/add")
   @ResponseBody
   public AjaxResult addSave(@Validated CmsCat cmsCat) {
      cmsCat.setCreateBy(ShiroUtils.getUserIdStr());
      return toAjax(cmsCatService.insertCmsCat(cmsCat));

   }

   /**
    * 修改栏目
    */
   @GetMapping("/edit/{catId}")
   @RequiresPermissions("cms:cat:edit")
   public String edit(@PathVariable("catId") Long catId, ModelMap map) {
      CmsCat cc = cmsCatService.selectCmsCatById(catId);
      CmsCat parentCat = cmsCatService.selectCmsCatById(cc.getParentId());
      if (parentCat == null) {
         parentCat = new CmsCat();
         parentCat.setCatId(0L);
         parentCat.setCatName("根目录");
      }
      map.put("cmsCat", cc);
      map.put("parentName", parentCat.getCatName());
      return prefix + "/edit";
   }

   /**
    * 修改栏目
    *
    */
   @Log(title = OperateTitle.CMS_CATEGORY, businessType = BusinessType.UPDATE)
   @RequiresPermissions("cms:cat:edit")
   @PostMapping("/edit")
   @ResponseBody
   public AjaxResult editSave(@Validated CmsCat cmsCat) {
      if (cmsCat.getCatId() == cmsCat.getParentId()) {
         return error("不能选择自己为父节点");
      }
      cmsCat.setCreateBy(ShiroUtils.getUserIdStr());
      return toAjax(cmsCatService.updateCmsCat(cmsCat));
   }

   /**
    * 修改栏目状态 同时修改子节点
    * 
    * @param cmsCat
    * @return
    */
   @Log(title = OperateTitle.CMS_CATEGORY, businessType = BusinessType.UPDATE)
   @RequiresPermissions("cms:cat:edit")
   @PostMapping("/editCatVisible")
   @ResponseBody
   public AjaxResult editVisible(CmsCat cmsCat) {
      return toAjax(cmsCatService.updateTagVisible(cmsCat.getCatId(), cmsCat.getVisible()));
   }

   /**
    * 删除菜单
    */
   @Log(title = OperateTitle.CMS_CATEGORY, businessType = BusinessType.DELETE)
   @RequiresPermissions("cms:cat:remove")
   @GetMapping("/remove/{catId}")
   @ResponseBody
   public AjaxResult remove(@PathVariable("catId") Long catId) {
      CmsCat cmsCat = new CmsCat();
      cmsCat.setParentId(catId);
      ;
      if (UserConstants.NOT_UNIQUE.equals(cmsCatService.checkCatUnique(cmsCat))) {
         return AjaxResult.warn("存在子节点不允许删除");
      }
      if (cmsCatService.countArticleByCatId(catId) > 0) {
         return AjaxResult.warn("与文章有关联不允许删除");
      }
      return toAjax(cmsCatService.deleteCmsCatById(catId));
   }

   /**
    * 获取目录节点
    * cmsCatParameter参数包括
    * visible 状态
    * parent 是否为目录
    * type 类型
    * catId 分类Id
    * parentId 父亲节点
    * createBy 创建人
    * 
    * @param cmsCatParameter
    * @param mmp
    * @return
    */
   @GetMapping("/selectCatTree")
   public String selectCatTree(CmsCat cmsCatParameter, ModelMap mmp) {
      CmsCat cmsCat = null;
      if (cmsCatParameter.getCatId() != null) {
         cmsCat = cmsCatService.selectCmsCatById(cmsCatParameter.getCatId());
      }
      if (cmsCat == null) {
         cmsCat = new CmsCat();
         cmsCat.setParentId(0L);
         cmsCat.setCatName("根目录");
      }
      mmp.put("cmsCat", cmsCat);
      mmp.put("cmsCatParameter", cmsCatParameter);
      return prefix + "/tree";
   }

   /**
    * 获取树目录
    * 
    * @param cmsCat
    * @return
    */
   @GetMapping("/catTreeData")
   @ResponseBody
   public List<Ztree> catTreeData(CmsCat cmsCat) {

      List<Ztree> ztrees = cmsCatService.catTreeData(cmsCat);

      return ztrees;
   }

   /**
    * 如果路径不为空，路径不允许重复
    * 同级目录下分类名不能重复
    * 
    * @param cmsCat
    * @return
    */
   @PostMapping("/checkCatUnique")
   @ResponseBody
   public String checkCmsCatUnique(CmsCat cmsCat) {
      return cmsCatService.checkCatUnique(cmsCat);
   }
}
