package com.oly.cms.general.utils.tree;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.oly.cms.common.domain.entity.CmsColumn;

/** 菜单工具 */
public class MenuTreeUtils {

    /**
     * 根据父节点的ID获取所有子节点
     * 
     * @param list     分类表
     * @param parentId 传入的父节点ID
     * @return String
     */
    public static CmsColumn getColumnTree(List<CmsColumn> list, Long parentId) {
        CmsColumn re = new CmsColumn();
        if (parentId == null || list.size() == 0) {
            return re;
        } else if (parentId == 0L) {
            re.setColumnId(0L);
            re.setColumnName("根目录");
        }
        List<CmsColumn> returnList = new ArrayList<CmsColumn>();
        for (Iterator<CmsColumn> iterator = list.iterator(); iterator.hasNext();) {
            CmsColumn t = (CmsColumn) iterator.next();
            // 获取根节点
            if (t.getColumnId() == parentId) {
                re = t;
            }
            // 一、根据传入的某个父节点ID,遍历该父节点的所有子节点
            if (t.getParentId() == parentId) {
                // 遍历第一层
                recursionFn(list, t);
                returnList.add(t);
            }
        }
        re.setChildList(returnList);
        return re;
    }

    /**
     * 递归列表
     *
     * @param list
     * @param t
     */
    private static void recursionFn(List<CmsColumn> list, CmsColumn t) {
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
     *
     * @param list 遍历的数据
     * @param t    父节点
     * @return
     */
    private static List<CmsColumn> getChildList(List<CmsColumn> list, CmsColumn t) {
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
    private static boolean hasChild(List<CmsColumn> list, CmsColumn t) {
        return getChildList(list, t).size() > 0 ? true : false;
    }
}
