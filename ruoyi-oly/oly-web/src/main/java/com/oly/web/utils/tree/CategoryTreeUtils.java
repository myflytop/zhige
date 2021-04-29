package com.oly.web.utils.tree;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.oly.web.model.po.BlogCat;

public class CategoryTreeUtils {

    /**
     * 根据父节点的ID获取所有子节点
     * 
     * @param list     分类表
     * @param parentId 传入的父节点ID
     * @return String
     */
    public static BlogCat getCatTree(List<BlogCat> list, Long parentId) {
        BlogCat re = new BlogCat();
        if (parentId == null || list.size() == 0) {
            return re;
        }
        List<BlogCat> returnList = new ArrayList<BlogCat>();
        for (Iterator<BlogCat> iterator = list.iterator(); iterator.hasNext();) {
            BlogCat t = (BlogCat) iterator.next();
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
        re.setChildCats(returnList);
        return re;
    }

    /**
     * 递归列表
     *
     * @param list
     * @param t
     */
    private static void recursionFn(List<BlogCat> list, BlogCat t) {
        // 得到子节点列表
        List<BlogCat> childList = getChildList(list, t);
        // 添加子节点列表
        t.setChildCats(childList);
        for (BlogCat tChild : childList) {
            if (hasChild(list, tChild)) {
                // 判断是否有子节点
                Iterator<BlogCat> it = childList.iterator();
                while (it.hasNext()) {
                    BlogCat n = (BlogCat) it.next();
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
    private static List<BlogCat> getChildList(List<BlogCat> list, BlogCat t) {
        List<BlogCat> tlist = new ArrayList<BlogCat>();
        Iterator<BlogCat> it = list.iterator();
        while (it.hasNext()) {
            BlogCat n = (BlogCat) it.next();
            if (n.getParentId().longValue() == t.getCatId().longValue()) {
                tlist.add(n);
            }
        }
        return tlist;
    }

    /**
     * 判断是否有子节点
     */
    private static boolean hasChild(List<BlogCat> list, BlogCat t) {
        return getChildList(list, t).size() > 0 ? true : false;
    }
}
