package com.oly.cms.web.controller;

import java.util.List;

import com.oly.cms.system.model.CmsConstants;
import com.oly.cms.system.model.po.CmsCat;
import com.oly.cms.system.model.po.CmsColumn;
import com.oly.cms.system.model.po.CmsTag;
import com.oly.cms.system.service.impl.CmsCatServiceImpl;
import com.oly.cms.system.service.impl.CmsColumnServiceImpl;
import com.oly.cms.system.service.impl.CmsTagServiceImpl;
import com.oly.cms.web.CmsCommonController;
import com.oly.common.model.enums.CommonVisibleEnums;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.Ztree;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.ShiroUtils;

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
 * 页面 控制层
 * 
 * @author bobey
 *
 */
@Controller
@RequestMapping("cms/column")
public class CmsColumnController extends CmsCommonController {
	@Autowired
	private CmsColumnServiceImpl columnService;
	private String prefix = acceptPreifx + "column";
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
		String parentName = "根栏目";
		if (0L != parentId) {
			parentName = columnService.getCmsColumnNameById(parentId);
		} else {
			parentId = 0L;
		}
		CmsCat cat=new CmsCat();
		cat.setVisible((byte)CommonVisibleEnums.SHOW.ordinal());
		CmsTag tag=new CmsTag();
		tag.setVisible((byte)CommonVisibleEnums.SHOW.ordinal());
		mmap.put("cats", catService.listCmsCatByCat(cat));
		mmap.put("tags", tagService.listCmsTagByTag(tag));
		mmap.put("parentId", parentId);
		mmap.put("parentName", parentName);
		return prefix + "/add";
	}

	@Log(title = "内容栏目管理", businessType = BusinessType.INSERT)
	@RequiresPermissions("cms:column:add")
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(CmsColumn cc) {
		CmsColumn ccj = null;
		if (cc.getParentId() != 0) {
			ccj = columnService.getCmsColumnById(cc.getParentId());
			if (ccj == null || ccj.getParent() == 1) {
				return error("插入点为非目录或者不存在,请检查!");
			}
		}
		if (CmsConstants.NOT_UNIQUE.equals(columnService.checkColumnNameUnique(cc))) {
			return error("当前目录下,目录名重复,请检查!");
		}
		if (CmsConstants.NOT_UNIQUE.equals(columnService.checkColumnUrlUnique(cc))) {
			return error("路径名重复,请检查!");
		}
		if (ccj == null) {
			cc.setAncestors("0");
		} else {
			cc.setAncestors(ccj.getAncestors() + "," + cc.getParentId());
		}
		cc.setCreateBy(ShiroUtils.getUserId());
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
		CmsColumn cmsColumn = columnService.getCmsColumnById(columnId);
		String parentName = null;
		if (cmsColumn.getParentId() == 0L) {
			parentName = "根栏目";
		} else {
			parentName = columnService.getCmsColumnNameById(cmsColumn.getParentId());
		}
		CmsCat cat=new CmsCat();
		cat.setVisible((byte)CommonVisibleEnums.SHOW.ordinal());
		CmsTag tag=new CmsTag();
		tag.setVisible((byte)CommonVisibleEnums.SHOW.ordinal());
		mmap.put("cats", catService.listCmsCatByCat(cat));
		mmap.put("tags", tagService.listCmsTagByTag(tag));
		mmap.put("cmsColumn", cmsColumn);
		mmap.put("parentName", parentName);
		return prefix + "/edit";
	}

	@Log(title = "内容栏目管理", businessType = BusinessType.UPDATE)
	@RequiresPermissions("cms:column:edit")
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editView(CmsColumn cc) {
		if (cc.getParentId() == cc.getColumnId()) {
			return error("不能选择自己为父节点");
		}
		CmsColumn ccj = null;
		if (cc.getParentId() != 0) {
			ccj = columnService.getCmsColumnById(cc.getParentId());
			if (ccj == null || ccj.getParent() == 1) {
				return error("插入点为非目录或者不存在,请检查!");
			}
		}
		if (CmsConstants.NOT_UNIQUE.equals(columnService.checkColumnNameUnique(cc))) {
			return error("当前目录下,目录名重复,请检查!");
		}
		if (CmsConstants.NOT_UNIQUE.equals(columnService.checkColumnUrlUnique(cc))) {
			return error("路径名重复,请检查!");
		}
		if (ccj == null) {
			cc.setAncestors("0");
		} else {
			cc.setAncestors(ccj.getAncestors() + "," + cc.getParentId());
		}
		cc.setUpdateBy(ShiroUtils.getUserId());
		return toAjax(columnService.updateCmsColumn(cc));

	}

	/**
	 * 修改栏目状态 同时修改子节点
	 * 
	 * @param cmsColumn
	 * @return
	 */
	@Log(title = "内容分类管理", businessType = BusinessType.UPDATE)
	@RequiresPermissions("cms:column:edit")
	@PostMapping("/editColumnVisible")
	@ResponseBody
	public AjaxResult editVisible(CmsColumn cmsColumn) {

		return toAjax(columnService.updateTagVisible(cmsColumn.getColumnId(), cmsColumn.getVisible()));
	}

	@GetMapping("/detail/{columnId}")
	@RequiresPermissions("cms:column:detail")
	public String detail(@PathVariable("columnId") Long columnId, ModelMap mmp) {
		mmp.put("column", columnService.getCmsColumnById(columnId));
		return prefix + "/detail";
	}

	@Log(title = "内容栏目管理", businessType = BusinessType.DELETE)
	@RequiresPermissions("cms:column:remove")
	@GetMapping("/remove/{columnId}")
	@ResponseBody
	public AjaxResult remove(@PathVariable("columnId") Long columnId) {
		if (columnService.countCmsColumnById(columnId) > 0) {
			return error("存在子节点,不允许删除");
		}

		return toAjax(columnService.deleteCmsColumnById(columnId));

	}

	@GetMapping("/selectColumnTree/{columnId}")
	public String selectColumnTree(@PathVariable("columnId") Long columnId, ModelMap mmp) {
		CmsColumn cmsColumn = columnService.getCmsColumnById(columnId);
		if (cmsColumn == null) {
			cmsColumn = new CmsColumn();
			cmsColumn.setColumnId(0L);
			cmsColumn.setColumnName("根目录");

		}
		mmp.put("column", cmsColumn);
		return prefix + "/tree";
	}

	/**
	 * 获取目录
	 * 
	 * @return
	 */
	@GetMapping("/columnTreeData")
	@ResponseBody
	public List<Ztree> columnTreeCatData() {
		List<Ztree> ztrees = columnService.columnTreeCatData();
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

	/**
	 * 校验路径名称
	 */
	@PostMapping("/checkColumnUrlUnique")
	@ResponseBody
	public String checkColumnUrlUnique(CmsColumn cms) {
		return columnService.checkColumnUrlUnique(cms);
	}

}
