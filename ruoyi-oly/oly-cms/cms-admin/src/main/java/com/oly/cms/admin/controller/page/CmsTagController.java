package com.oly.cms.admin.controller.page;

import java.util.List;
import com.oly.cms.common.domain.entity.CmsTag;
import com.oly.cms.admin.service.impl.CmsTagServiceImpl;
import com.oly.cms.admin.service.impl.CmsThemeServiceImpl;
import com.oly.cms.admin.web.CmsCommonController;
import com.oly.cms.common.model.properties.OlyWebConfigProperties;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.text.Convert;
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

/**
 * 标签控制器
 */
@Controller
@RequestMapping("/cms/tag")
public class CmsTagController extends CmsCommonController {

   private final String prefix = acceptPrefix + "tag";

   @Autowired
   private CmsTagServiceImpl cmsTagService;

   @Autowired
   private SysConfigServiceImpl configService;

   @Autowired
   private CmsThemeServiceImpl themeServiceImpl;

   /**
    * 标签列表
    * 
    * @param map
    * @return
    */
   @RequiresPermissions("cms:tag:view")
   @GetMapping()
   public String tag(ModelMap map) {
      map.put("themeNames", themeServiceImpl.listThemeNames());
      return prefix + "/tag";
   }

   /**
    * 标签关联文章页面
    * 
    * @return
    */
   @RequiresPermissions("cms:article:view")
   @GetMapping("/relation/{tagId}")
   public String relation(@PathVariable("tagId") Long tagId, ModelMap mp) {
      mp.put("tagId", tagId);
      mp.put("themeNames", themeServiceImpl.listThemeNames());
      return prefix + "/relation";
   }

   @RequiresPermissions("cms:tag:list")
   @PostMapping("/list")
   @ResponseBody
   public TableDataInfo page(final CmsTag cmsTag) {
      String configGroup = cmsTag.getParams().get("supportType").toString();
      if (StringUtils.isNotEmpty(configGroup)) {
         cmsTag.getParams().put("supportType",
               configService.selectConfigDefauleValue(configGroup.toString(), OlyWebConfigProperties.ARTICLE_TYPES));
      }
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
      tag.setVisible(CommonVisibleEnums.SHOW.ordinal());
      return cmsTagService.listCmsTagByTag(tag);
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
   @Log(title = OperateTitle.CMS_TAG, businessType = BusinessType.INSERT)
   @RequiresPermissions("cms:tag:add")
   @PostMapping("/add")
   @ResponseBody
   public AjaxResult addSave(@Validated CmsTag cmsTag) {
      if (UserConstants.UNIQUE.equals(cmsTagService.checkTagUnique(cmsTag))) {
         cmsTag.setCreateBy(ShiroUtils.getUserIdStr());
         return toAjax(cmsTagService.insertCmsTag(cmsTag));
      } else {
         return error("标签名重复|路径重复");
      }
   }

   @Log(title = OperateTitle.CMS_TAG, businessType = BusinessType.DELETE)
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
      mmap.put("tag", cmsTagService.selectCmsTagById(tagId));
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
   public AjaxResult editTagVisible(final String tagIds, final Integer visible) {
      final Long[] ids = Convert.toLongArray(tagIds);
      return toAjax(cmsTagService.updateTagVisible(ids, visible));
   }

   /**
    * 修改保存菜单
    */
   @Log(title = OperateTitle.CMS_TAG, businessType = BusinessType.UPDATE)
   @RequiresPermissions("cms:tag:edit")
   @PostMapping("/edit")
   @ResponseBody
   public AjaxResult editSave(@Validated CmsTag cmsTag) {
      if (UserConstants.UNIQUE.equals(cmsTagService.checkTagUnique(cmsTag))) {
         cmsTag.setUpdateBy(ShiroUtils.getUserIdStr());
         return toAjax(cmsTagService.updateCmsTagById(cmsTag));

      }
      return error("修改标签'" + cmsTag.getTagName() + "'失败，标签名称|路径已存在");
   }

   /**
    * 校验标签名称
    */
   @PostMapping("/checkTagUnique")
   @ResponseBody
   public String checkCmsTagUnique(CmsTag cmsTag) {
      return cmsTagService.checkTagUnique(cmsTag);
   }

}
