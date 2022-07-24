package com.oly.cms.admin.controller.page;

import java.util.List;

import com.oly.cms.common.domain.entity.CmsCat;
import com.oly.cms.common.domain.entity.CmsColumn;
import com.oly.cms.common.domain.entity.CmsTag;
import com.oly.cms.admin.service.impl.CmsCatServiceImpl;
import com.oly.cms.admin.service.impl.CmsColumnServiceImpl;
import com.oly.cms.admin.service.impl.CmsTagServiceImpl;
import com.oly.cms.admin.web.CmsCommonController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.Ztree;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.enums.CommonVisibleEnums;
import com.ruoyi.common.enums.OperateTitle;
import com.ruoyi.common.utils.ShiroUtils;

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
 * 页面 控制层
 * 
 * @author zg
 *
 */
@Controller
@RequestMapping("cms/column")
public class CmsColumnController extends CmsCommonController {
	@Autowired
	private CmsColumnServiceImpl columnService;
	private String prefix = acceptPrefix + "column";
	@Autowired
	private CmsTagServiceImpl tagService;
	@Autowired
	private CmsCatServiceImpl catService;

	/**
	 * 栏目管理首页
	 * 
	 * @return
	 */
	@GetMapping
	@RequiresPermissions("cms:column:view")
	public String column() {
		return prefix + "/column";
	}

	/**
	 * 获取栏目列表 所有栏目
	 * 
	 * @param cmsColumn
	 * @return
	 */
	@RequiresPermissions("cms:column:list")
	@PostMapping("/list")
	@ResponseBody
	public List<CmsColumn> list(CmsColumn cmsColumn) {
		return columnService.listCmsColumn(cmsColumn);
	}

	/**
	 * @param parentId
	 * @param mmap
	 * @return
	 */
	@GetMapping("add/{parentId}")
	@RequiresPermissions("cms:column:add")
	public String add(@PathVariable("parentId") Long parentId, ModelMap mmap) {
		CmsColumn parentColumn = columnService.selectCmsColumnById(parentId);
		if (parentColumn == null) {
			parentColumn = new CmsColumn();
			parentColumn.setColumnId(0L);
			parentColumn.setColumnName("根栏目");
		}
		CmsCat cat = new CmsCat();
		cat.setVisible(CommonVisibleEnums.SHOW.ordinal());
		CmsTag tag = new CmsTag();
		tag.setVisible(CommonVisibleEnums.SHOW.ordinal());
		mmap.put("cats", catService.listCmsCatByCat(cat));
		mmap.put("tags", tagService.listCmsTagByTag(tag));
		mmap.put("parentId", parentColumn.getColumnId());
		mmap.put("parentName", parentColumn.getColumnName());
		return prefix + "/add";
	}

	@Log(title = OperateTitle.CMS_MENU, businessType = BusinessType.INSERT)
	@RequiresPermissions("cms:column:add")
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(@Validated CmsColumn cc) {
		if (UserConstants.NOT_UNIQUE.equals(columnService.checkColumnNameUnique(cc))) {
			return error("当前目录下,栏目名已存在!");
		}
		if (cc.getParentId() == 0) {
			cc.setAncestors("0");
		} else {
			CmsColumn ccj = columnService.selectCmsColumnById(cc.getParentId());
			if (ccj == null || ccj.getParent().intValue() == 1) {
				return error("插入点不存在或者为非目录!");
			} else {
				cc.setAncestors(ccj.getAncestors() + "," + cc.getParentId());
			}
		}
		cc.setCreateBy(ShiroUtils.getUserIdStr());
		return toAjax(columnService.insertCmsColumn(cc));
	}

	/**
	 * @param columnId
	 * @param mmap
	 * @return
	 */
	@GetMapping("/edit/{columnId}")
	@RequiresPermissions("cms:column:edit")
	public String editView(@PathVariable("columnId") Long columnId, ModelMap mmap) {
		CmsColumn cmsColumn = columnService.selectCmsColumnById(columnId);
		CmsColumn parentColumn = columnService.selectCmsColumnById(cmsColumn.getParentId());
		if (parentColumn == null) {
			parentColumn = new CmsColumn();
			parentColumn.setColumnId(0L);
			parentColumn.setColumnName("根栏目");
		}
		CmsCat cat = new CmsCat();
		cat.setVisible(CommonVisibleEnums.SHOW.ordinal());
		CmsTag tag = new CmsTag();
		tag.setVisible(CommonVisibleEnums.SHOW.ordinal());
		mmap.put("cats", catService.listCmsCatByCat(cat));
		mmap.put("tags", tagService.listCmsTagByTag(tag));
		mmap.put("cmsColumn", cmsColumn);
		mmap.put("parentName", parentColumn.getColumnName());
		return prefix + "/edit";
	}

	@Log(title = OperateTitle.CMS_MENU, businessType = BusinessType.UPDATE)
	@RequiresPermissions("cms:column:edit")
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult edit(@Validated CmsColumn cc) {

		if (cc.getParentId() == cc.getColumnId()) {
			return error("不能选择自己为父节点");
		}
		if (UserConstants.NOT_UNIQUE.equals(columnService.checkColumnNameUnique(cc))) {
			return error("当前目录下,栏目名已存在!");
		}
		if (cc.getParentId() == 0) {
			cc.setAncestors("0");
		} else {
			CmsColumn ccj = columnService.selectCmsColumnById(cc.getParentId());
			if (ccj == null || ccj.getParent().intValue() == 1) {
				return error("插入点不存在或者为非目录!");
			} else {
				cc.setAncestors(ccj.getAncestors() + "," + cc.getParentId());
			}
		}
		cc.setUpdateBy(ShiroUtils.getUserIdStr());
		return toAjax(columnService.updateCmsColumn(cc));

	}

	/**
	 * 修改栏目状态 同时修改子节点
	 * 
	 * @param cmsColumn
	 * @return
	 */
	@Log(title = OperateTitle.CMS_MENU, businessType = BusinessType.UPDATE)
	@RequiresPermissions("cms:column:edit")
	@PostMapping("/updateColumnVisible")
	@ResponseBody
	public AjaxResult updateColumnVisible(CmsColumn cmsColumn) {

		return toAjax(columnService.updateColumnVisible(cmsColumn.getColumnId(), cmsColumn.getVisible()));
	}

	@GetMapping("/detail/{columnId}")
	@RequiresPermissions("cms:column:detail")
	public String detail(@PathVariable("columnId") Long columnId, ModelMap mmp) {
		mmp.put("column", columnService.selectCmsColumnById(columnId));
		return prefix + "/detail";
	}

	@Log(title = OperateTitle.CMS_MENU, businessType = BusinessType.DELETE)
	@RequiresPermissions("cms:column:remove")
	@GetMapping("/remove/{columnId}")
	@ResponseBody
	public AjaxResult remove(@PathVariable("columnId") Long columnId) {
		CmsColumn checkCmsColumn = new CmsColumn();
		checkCmsColumn.setParentId(columnId);
		if (UserConstants.NOT_UNIQUE.equals(columnService.checkColumnNameUnique(checkCmsColumn))) {
			return error("存在子节点,不允许删除");
		}
		return toAjax(columnService.deleteCmsColumnById(columnId));

	}

	@GetMapping("/selectColumnTree/{columnId}")
	public String selectColumnTree(@PathVariable("columnId") Long columnId,
			@RequestParam(required = true, defaultValue = "") String visible,
			@RequestParam(required = true, defaultValue = "") String parent, ModelMap mmp) {
		CmsColumn cmsColumn = columnService.selectCmsColumnById(columnId);
		if (cmsColumn == null) {
			cmsColumn = new CmsColumn();
			cmsColumn.setColumnId(0L);
			cmsColumn.setColumnName("根目录");
		}
		mmp.put("column", cmsColumn);
		mmp.put("parent", parent);
		mmp.put("visible", visible);
		return prefix + "/tree";
	}

	/**
	 * 获取树菜单
	 * 
	 * @return
	 */
	@GetMapping("/columnTreeData")
	@ResponseBody
	public List<Ztree> columnTreeCatData(CmsColumn cc) {
		List<Ztree> ztrees = columnService.columnTreeCatData(cc);
		return ztrees;
	}

	/**
	 * 校验菜单名称
	 */
	@PostMapping("/checkColumnNameUnique")
	@ResponseBody
	public String checkColumnNameUnique(CmsColumn cms) {
		return columnService.checkColumnNameUnique(cms);
	}

}
