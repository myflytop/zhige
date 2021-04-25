package com.oly.cms.system.service.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.oly.cms.system.mapper.CmsColumnMapper;
import com.oly.cms.system.model.CmsConstants;
import com.oly.cms.system.model.po.CmsColumn;
import com.oly.cms.system.service.ICmsColumnService;
import com.oly.common.constant.CacheConstant;
import com.oly.framework.event.CacheWebRefreshEvent;
import com.ruoyi.common.core.domain.Ztree;
import com.ruoyi.common.exception.BusinessException;
import com.ruoyi.common.utils.StringUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.stereotype.Service;

@Service
public class CmsColumnServiceImpl implements ICmsColumnService {
	@Autowired
	private CmsColumnMapper columnMapper;

	@Autowired
    private ApplicationEventPublisher app;

	@Override
	public int insertCmsColumn(CmsColumn cmsColumn) {

		return columnMapper.insertCmsColumn(cmsColumn);
	}

	/**
	 * 更新栏目
	 * 
	 * @param cmsColumn
	 * @return
	 */
	@Override
	public int updateCmsColumn(CmsColumn cmsColumn) {
		updateChildNode(cmsColumn.getColumnId(), cmsColumn.getAncestors() + "," + cmsColumn.getColumnId());
		int re=columnMapper.updateCmsColumn(cmsColumn);
		app.publishEvent(new CacheWebRefreshEvent(this,CacheConstant.MENU_CACHE_KEY_PREFIX));
		return re;
	}

	@Override
	public int deleteCmsColumn(Long columnId) {
		int count = columnMapper.countCmsColumnById(columnId);
		if (count == 0) {
			int re=columnMapper.deleteCmsColumnById(columnId);
		   app.publishEvent(new CacheWebRefreshEvent(this,CacheConstant.MENU_CACHE_KEY_PREFIX));
			return re;
		}
		throw new BusinessException("存在子节点,无法直接删除!");
	}

	@Override
	public List<CmsColumn> listCmsColumnById(Long parentId) {
		return columnMapper.listCmsColumnById(parentId);
	}

	@Override
	public List<CmsColumn> listCmsColumn(CmsColumn cmsColumn) {
		return columnMapper.listCmsColumn(cmsColumn);
	}

	@Override
	public List<Ztree> columnTreeCatData() {
		CmsColumn cc = new CmsColumn();
		cc.setParent((byte) 0);
		List<CmsColumn> colunmList = columnMapper.listCmsColumn(cc);
		List<Ztree> ztrees = initZtree(colunmList);
		return ztrees;
	}

	private List<Ztree> initZtree(List<CmsColumn> colunmList) {
		return initZtree(colunmList, null, false);
	}

	/**
	 * 对象转菜单树
	 * 
	 * @param colunmList     菜单列表
	 * @param rolecolunmList 角色已存在菜单列表
	 * @param permsFlag      是否需要显示权限标识
	 * @return 树结构列表
	 */
	public List<Ztree> initZtree(List<CmsColumn> colunmList, List<String> rolecolunmList, boolean permsFlag) {
		List<Ztree> ztrees = new ArrayList<Ztree>();
		boolean isCheck = StringUtils.isNotNull(rolecolunmList);
		for (CmsColumn colunm : colunmList) {
			Ztree ztree = new Ztree();
			ztree.setId(colunm.getColumnId());
			ztree.setpId(colunm.getParentId());
			ztree.setName(transcolunmName(colunm, rolecolunmList, permsFlag));
			ztree.setTitle(colunm.getColumnName());
			if (isCheck) {
				ztree.setChecked(rolecolunmList.contains(colunm.getColumnId() + colunm.getPerms()));
			}
			ztrees.add(ztree);
		}
		return ztrees;
	}

	public String transcolunmName(CmsColumn colunm, List<String> rolecolunmList, boolean permsFlag) {
		StringBuffer sb = new StringBuffer();
		sb.append(colunm.getColumnName());
		if (permsFlag) {
			sb.append("<font color=\"#888\">&nbsp;&nbsp;&nbsp;" + colunm.getPerms() + "</font>");
		}
		return sb.toString();
	}

	@Override
	public String checkColumnNameUnique(CmsColumn cms) {

		if (columnMapper.checkColumnNameUnique(cms.getParentId(), cms.getColumnName(), cms.getColumnId()) == 0) {
			return CmsConstants.UNIQUE;
		}
		return CmsConstants.NOT_UNIQUE;
	}

	@Override
	public CmsColumn getCmsColumnById(Long columnId) {

		return columnMapper.getCmsColumnById(columnId);
	}

	@Override
	public String getCmsColumnNameById(Long columnId) {


		return columnMapper.getCmsColumnNameById(columnId);
	}

	@Override
	public int deleteCmsColumnById(Long columnId) {
		int re=columnMapper.deleteCmsColumnById(columnId);
		app.publishEvent(new CacheWebRefreshEvent(this,CacheConstant.MENU_CACHE_KEY_PREFIX));
		return re;
	}

	@Override
	public List<CmsColumn> listCmsColumnView(CmsColumn cmsColumn) {
		// TODO Auto-generated method stub
		long parentId = 0;
		if (cmsColumn.getColumnId() != null) {
			parentId = cmsColumn.getColumnId();
		}
		return getChildPerms(columnMapper.listCmsColumnView(cmsColumn), parentId);
	}

	@Override
	public int countCmsColumnById(Long columnId) {
		return columnMapper.countCmsColumnById(columnId);
	}

	@Override
	public int updateTagVisible(Long columnId, Byte visible) {
		int re=columnMapper.updateTagVisible(columnId, visible);
		app.publishEvent(new CacheWebRefreshEvent(this,CacheConstant.MENU_CACHE_KEY_PREFIX));
		return re;
	}

	/**
	 * 根据父节点的ID获取所有子节点
	 * 
	 * @param list     分类表
	 * @param parentId 传入的父节点ID
	 * @return String
	 */
	public List<CmsColumn> getChildPerms(List<CmsColumn> list, long parentId) {
		List<CmsColumn> returnList = new ArrayList<CmsColumn>();
		for (Iterator<CmsColumn> iterator = list.iterator(); iterator.hasNext();) {
			CmsColumn t = (CmsColumn) iterator.next();
			// 一、根据传入的某个父节点ID,遍历该父节点的所有子节点
			if (t.getParentId() == parentId) {
				recursionFn(list, t);
				returnList.add(t);
			}
		}
		return returnList;
	}

	/**
	 * 递归列表
	 * 
	 * @param list
	 * @param t
	 */
	private void recursionFn(List<CmsColumn> list, CmsColumn t) {
		// 得到子节点列表
		List<CmsColumn> childList = getChildList(list, t);
		// 添加子节点列表
		t.setChildList(childList);
		for (CmsColumn tChild : childList) {
			if (hasChild(list, tChild)) {
				// 判断是否有子节点
				Iterator<CmsColumn> it = childList.iterator();
				while (it.hasNext()) {
					CmsColumn n = (CmsColumn) it.next();
					recursionFn(list, n);
				}
			}
		}
	}

	/**
	 * 得到子节点列表
	 */
	private List<CmsColumn> getChildList(List<CmsColumn> list, CmsColumn t) {
		List<CmsColumn> tlist = new ArrayList<CmsColumn>();
		Iterator<CmsColumn> it = list.iterator();
		while (it.hasNext()) {
			CmsColumn n = (CmsColumn) it.next();
			if (n.getParentId().longValue() == t.getColumnId().longValue()) {
				tlist.add(n);
			}
		}
		return tlist;
	}

	/**
	 * 判断是否有子节点
	 */
	private boolean hasChild(List<CmsColumn> list, CmsColumn t) {
		return getChildList(list, t).size() > 0 ? true : false;
	}

	private void updateChildNode(Long parentId, String ancestors) {
		if (updateAncestors(parentId, ancestors) > 0) {
			List<Long> lis = parentIds(parentId);
			if (lis != null) {
				for (int i = 0; i < lis.size(); i++) {
					updateAncestors(lis.get(i), ancestors + "," + lis.get(i));
				}
			}
		}
	}

	/**
	 * 根据父亲Id修改Ancestors 根据父亲Id获取子元素子节点，循环遍历
	 * 
	 * @param catId
	 * @return
	 */

	private List<Long> parentIds(Long catId) {
		return columnMapper.listColumnIdsById(catId);
	}

	private int updateAncestors(Long parentId, String ancestors) {

		return columnMapper.updateAncestors(parentId, ancestors);
	}

}
