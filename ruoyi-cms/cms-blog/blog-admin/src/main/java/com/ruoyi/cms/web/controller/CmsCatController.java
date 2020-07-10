package com.ruoyi.cms.web.controller;

import com.ruoyi.cms.system.model.po.CmsCat;
import com.ruoyi.cms.system.model.vo.CatCountVo;
import com.ruoyi.cms.system.service.impl.CmsCatServiceImpl;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.Ztree;

import com.ruoyi.common.enums.BusinessType;

import com.ruoyi.framework.util.ShiroUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/cms/cat")
public class CmsCatController extends BaseController {

   private String prefix = "blog/admin/cat";

   @Autowired
   private CmsCatServiceImpl cmsCatService;

   @RequiresPermissions("cms:cat:view")
   @GetMapping()
   public String Cat()
   {
      return prefix + "/cat";
   }

   /**
    * 类目详情页面
    * @param catId
    * @param mmp
    * @return
    */
   @GetMapping("/detail/{catId}")
   public String detail(@PathVariable("catId") Long catId, ModelMap mmp) {
      mmp.put("cat", cmsCatService.getCmsCatById(catId));
      return prefix + "/detail";
   }

   @RequiresPermissions("cms:cat:list")
   @PostMapping("/list")
   @ResponseBody
   public List<CmsCat> list(CmsCat cmsCat){
      startPage();
      List<CmsCat> cmsCats=cmsCatService.listCmsCatByCat(cmsCat);
      return cmsCats;
   }

   @RequiresPermissions("cms:cat:list")
   @GetMapping("/listCat")
   @ResponseBody
   public List<CmsCat> listNoHide(){
      return cmsCatService.listCmsCat();

   }

   @RequiresPermissions("cms:cat:list")
   @PostMapping("/listCatCountVo")
   @ResponseBody
   public List<CatCountVo> listCatCountVo(CmsCat cmsCat){
      startPage();
      return  cmsCatService.listCatCountVoByCat(cmsCat);
   }
   @RequiresPermissions("cms:cat:list")
   @GetMapping("/listCatCountNoHide")
   @ResponseBody
   public List<CatCountVo> listCountVoNoHide(){

      return  cmsCatService.listCatCountVo();
   }

   @GetMapping("/add/{catId}")
   @RequiresPermissions("cms:cat:add")
   public String add(@PathVariable(value = "catId") Long catId, ModelMap mmap)
   { String catName="根目录";
      if(catId!=0L)
      {
         catName=cmsCatService.getCatNameById(catId);
      }
      mmap.put("parentId",catId);
      mmap.put("parentName", catName);
      return  prefix + "/add";
   }

   @Log(title = "内容分类管理", businessType = BusinessType.INSERT)
   @RequiresPermissions("cms:cat:add")
   @PostMapping("/add")
   @ResponseBody
   public AjaxResult addSave(@Validated CmsCat cmsCat){
       cmsCat.setCreateBy(ShiroUtils.getUserId());
           int insetCode = cmsCatService.insertCmsCat(cmsCat);
           if (insetCode == 1) {
               return toAjax(insetCode);
           }
           return error("验证失败请检查");

   }
   /**
    * 修改栏目
    */
   @GetMapping("/edit/{catId}")
   @RequiresPermissions("cms:cat:edit")
   public String edit(@PathVariable("catId") Long catId, ModelMap mmap)
   { CmsCat cc=cmsCatService.getCmsCatById(catId);
   String parentName=cmsCatService.getCatNameById(cc.getParentId());
      mmap.put("cmsCat",cc );
      mmap.put("parentName",parentName==null?"根目录":parentName);
      return prefix + "/edit";
   }

   /**
    * 修改栏目
    *
    */
   @Log(title = "内容分类管理", businessType = BusinessType.UPDATE)
   @RequiresPermissions("cms:cat:edit")
   @PostMapping("/edit")
   @ResponseBody
   public AjaxResult editSave(@Validated CmsCat cmsCat)

   {

      if(cmsCat.getCatId()==cmsCat.getParentId())
       {
          return  error("不能选择自己为父节点");
       }
      if(cmsCat.getParent()==0&&cmsCatService.countCatByParentId(cmsCat.getCatId())>0)
      {
         return  error("存在子节点不允许修改");
      }
      cmsCat.setCreateBy(ShiroUtils.getUserId());
       int upCode = cmsCatService.updateCmsCat(cmsCat);
       if (upCode == 1) {
           return toAjax(upCode);
       }
       return error("验证失败请检查");
   }


   /**
    * 修改栏目状态
    * 同时修改子节点
    * @param cmsCat
    * @return
    */
   @Log(title = "内容标签管理", businessType = BusinessType.UPDATE)
   @RequiresPermissions("cms:cat:edit")
   @PostMapping("/editCatVisible")
   @ResponseBody
   public AjaxResult editVisible(CmsCat cmsCat)
   {

      return toAjax(cmsCatService.updateTagVisible(cmsCat.getCatId(),cmsCat.getVisible()));
   }

   /**
    * 删除菜单
    */
   @Log(title = "内容分类管理", businessType = BusinessType.DELETE)
   @RequiresPermissions("cms:cat:remove")
   @GetMapping("/remove/{catId}")
   @ResponseBody
   public AjaxResult remove(@PathVariable("catId") Long catId)
   {
      if(cmsCatService.countCatByParentId(catId)>0)
      {
         return AjaxResult.warn("存在子节点不允许删除");
      }
      if(cmsCatService.countArticleByCatId(catId)>0)
      {
         return  AjaxResult.warn("与文章有关联不允许删除");
      }

      return toAjax(cmsCatService.deleteCmsCatById(catId));
   }


   @GetMapping("/selectCatTree/{parent}/{catId}")
   public String selectCatTree(@PathVariable("catId") Long catId,@PathVariable(value = "parent" )  byte b, ModelMap mmp){
      CmsCat cmsCat = cmsCatService.getCmsCatById(catId);
      if(cmsCat==null)
      {
         cmsCat=new CmsCat();
         cmsCat.setParentId(0L);
         cmsCat.setCatName("根目录");
      }
      mmp.put("cmsCat", cmsCat);
      mmp.put("parent",b);
      return prefix + "/tree";
   }

   /**
    * 获取树目录
    * @param b 是否为目录 1目录  0非目录
    * @return
    */
   @GetMapping(value ={ "/catTreeData/{parent}","/catTreeData"})
   @ResponseBody
   public List<Ztree> catTreeData(@PathVariable(value = "parent" ,required = false)Byte b ) {

      List<Ztree> ztrees = cmsCatService.catTreeData(b);

      return ztrees;
   }

   /**
    * 校验分类名称
    */
   @PostMapping("/checkCatNameUnique")
   @ResponseBody
   public String checkCmsCatNameUnique( CmsCat cmsCat)
   {

      return cmsCatService.checkCatNameUnique(cmsCat);
   }

   /**
    * 校验分类名称
    */
   @GetMapping("/countCatByParentId/{parentId}")
   @ResponseBody
   public int countCatByParentId(@PathVariable("parentId") Long parentId){
    return cmsCatService.countCatByParentId(parentId);
   }

   /**
    * 校验分类路径
    */
   @PostMapping("/checkCatUrlUnique")
   @ResponseBody
   public String checkCmsCatUrlUnique( CmsCat cmsCat)
   {
      return cmsCatService.checkCatUrlUnique(cmsCat);
   }
}
