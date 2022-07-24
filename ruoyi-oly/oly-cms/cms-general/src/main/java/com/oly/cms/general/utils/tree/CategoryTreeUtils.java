package com.oly.cms.general.utils.tree;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.oly.cms.common.domain.entity.CmsCat;

/** 分类工具 */
public class CategoryTreeUtils {
    /**
     * 根据父节点的ID获取所有子节点
     * 
     * @param list     分类表
     * @param parentId 传入的父节点ID
     * @return String
     */
    public static CmsCat getCatTree(List<CmsCat> list, Long parentId) {
        CmsCat re = new CmsCat();
        if (parentId == null || list.size() == 0) {
            return re;
        } else if (parentId == 0L) {
            re.setCatId(0L);
            re.setCatName("根目录");
        }
        List<CmsCat> returnList = new ArrayList<CmsCat>();
        for (Iterator<CmsCat> iterator = list.iterator(); iterator.hasNext();) {
            CmsCat t = (CmsCat) iterator.next();
            // 获取根节点
            if (t.getCatId() == parentId) {
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
    private static void recursionFn(List<CmsCat> list, CmsCat t) {
        // 得到子节点列表
        List<CmsCat> childList = getChildList(list, t);
        // 添加子节点列表
        t.setChildList(childList);
        for (CmsCat tChild : childList) {
            if (hasChild(list, tChild)) {
                // 判断是否有子节点
                Iterator<CmsCat> it = childList.iterator();
                while (it.hasNext()) {
                    CmsCat n = (CmsCat) it.next();
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
    private static List<CmsCat> getChildList(List<CmsCat> list, CmsCat t) {
        List<CmsCat> tlist = new ArrayList<CmsCat>();
        Iterator<CmsCat> it = list.iterator();
        while (it.hasNext()) {
            CmsCat n = (CmsCat) it.next();
            if (n.getParentId().longValue() == t.getCatId().longValue()) {
                tlist.add(n);
            }
        }
        return tlist;
    }

    /**
     * 判断是否有子节点
     */
    private static boolean hasChild(List<CmsCat> list, CmsCat t) {
        return getChildList(list, t).size() > 0 ? true : false;
    }
}
