package com.oly.cms.web.controller;

import java.util.List;

import com.oly.cms.system.model.CmsConstants;
import com.oly.cms.system.model.po.CmsTag;
import com.oly.cms.system.service.impl.CmsTagServiceImpl;
import com.oly.cms.web.CmsCommonController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.ShiroUtils;
import com.ruoyi.common.utils.StringUtils;

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

/**
 * 标签控制器
 */
@Controller
@RequestMapping("/cms/tag")
public class CmsTagController extends CmsCommonController {

   private final String prefix = acceptPreifx + "tag";

   @Autowired
   private CmsTagServiceImpl cmsTagService;

   @RequiresPermissions("cms:tag:view")
   @GetMapping()
   public String tag() {
      return prefix + "/tag";
   }

    /**
   * 文章页面
   * @return
   */
   @RequiresPermissions("cms:artcle:view")
   @GetMapping("/relation/{tagId}")
   public String relation(@PathVariable("tagId") Long tagId,ModelMap mp) {
      mp.put("tagId", tagId);
      return prefix + "/relation";
   }



   @RequiresPermissions("cms:tag:list")
   @PostMapping("/list")
   @ResponseBody
   public TableDataInfo list(final CmsTag cmsTag) {
      startPage();
      final List<CmsTag> cmsTags = cmsTagService.listCmsTagByTag(cmsTag);
      return getDataTable(cmsTags);
   }

   /**
    * 获取正常的标签列表
    * 
    * @return
    */
   @RequiresPermissions("cms:tag:list")
   @GetMapping("/listTagNotHide")
   @ResponseBody
   public List<CmsTag> listTagNotHide(CmsTag tag) {
    
      return cmsTagService.listCmsTagNotHide(tag);
   }

   /**
    * 添加标签
    * 
    * @return
    */
   @GetMapping("/add")
   @RequiresPermissions("cms:tag:add")
   public String add() {
      return prefix + "/add";
   }

   /**
    * 
    * @param cmsTag
    * @return
    */
   @Log(title = "内容-添加标签", businessType = BusinessType.INSERT)
   @RequiresPermissions("cms:tag:add")
   @PostMapping("/add")
   @ResponseBody
   public AjaxResult addSave(CmsTag cmsTag) {
      if (StringUtils.isEmpty(cmsTag.getTagName())) {
         return error("标签名不能为空!");
      } else if (CmsConstants.UNIQUE.equals(cmsTagService.checkTagNameUnique(cmsTag))
            && CmsConstants.UNIQUE.equals(cmsTagService.checkTagUrlUnique(cmsTag))) {
         cmsTag.setCreateBy(ShiroUtils.getUserId());
         return toAjax(cmsTagService.insertCmsTag(cmsTag));
      } else {
         return error("标签名重复|路径重复");
      }
   }

   @Log(title = "内容-删除标签", businessType = BusinessType.DELETE)
   @RequiresPermissions("cms:tag:remove")
   @PostMapping("/remove")
   @ResponseBody
   public AjaxResult remove(final String ids) {

      final Long[] tagIds = Convert.toLongArray(ids);
      final int sc = cmsTagService.deleteCmsTagByIds(tagIds);
      if (tagIds.length == sc) {

         return success("共:" + tagIds.length + "个，成功删除：" + sc + "个");
      } else {
         return error("共:" + tagIds.length + "个，成功删除：" + sc + "个.<br/>未成功删除的可能是与文章关联");
      }

   }

   /**
    * 修改标签
    */
   @GetMapping("/edit/{tagId}")
   @RequiresPermissions("cms:tag:edit")
   public String edit(@PathVariable("tagId") final Long tagId, final ModelMap mmap) {
      mmap.put("tag", cmsTagService.getCmsTagById(tagId));
      return prefix + "/edit";
   }

   /**
    * 标签状态操作
    * 
    * @param tagIds
    * @return
    */
   @PostMapping("/editTagVisible")
   @ResponseBody
   public AjaxResult editTagVisible(final String tagIds, final Byte visible) {
      final Long[] ids = Convert.toLongArray(tagIds);
      return toAjax(cmsTagService.updateTagVisible(ids, visible));
   }

   /**
    * 修改保存菜单
    */
   @Log(title = "内容-标签修改", businessType = BusinessType.UPDATE)
   @RequiresPermissions("cms:tag:edit")
   @PostMapping("/edit")
   @ResponseBody
   public AjaxResult editSave(@Validated final CmsTag cmsTag) {
      if (CmsConstants.UNIQUE.equals(cmsTagService.checkTagNameUnique(cmsTag))
            && CmsConstants.UNIQUE.equals(cmsTagService.checkTagUrlUnique(cmsTag))) {
         cmsTag.setUpdateBy(ShiroUtils.getUserId());
         return toAjax(cmsTagService.updateCmsTagById(cmsTag));

      }
      return error("修改标签'" + cmsTag.getTagName() + "'失败，标签名称|路径已存在");
   }

   /**
    * 校验标签名称
    */
   @PostMapping("/checkTagNameUnique")
   @ResponseBody
   public String checkCmsTagNameUnique(final CmsTag cmsTag) {
      return cmsTagService.checkTagNameUnique(cmsTag);
   }

   /**
    * 校验标签名称
    */
   @PostMapping("/checkTagUrlUnique")
   @ResponseBody
   public String checkCmsTagUrlUnique(final CmsTag cmsTag) {
      return cmsTagService.checkTagUrlUnique(cmsTag);
   }

}
