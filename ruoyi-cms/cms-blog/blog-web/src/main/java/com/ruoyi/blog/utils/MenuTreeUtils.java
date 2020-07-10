package com.ruoyi.blog.utils;

import com.ruoyi.blog.mould.BlogMenu;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class MenuTreeUtils {

    /**
     * 根据父节点的ID获取所有子节点
     * @param list     分类表
     * @param parentId 传入的父节点ID
     * @return String
     */
    public static BlogMenu getColumnTree(List<BlogMenu> list, Long parentId) {
        BlogMenu re=new BlogMenu();
        if(parentId==null||list.size()==0) {
            return re;
        }
        List<BlogMenu> returnList = new ArrayList<BlogMenu>();
        for (Iterator<BlogMenu> iterator = list.iterator(); iterator.hasNext();) {
            BlogMenu t = (BlogMenu) iterator.next();
            //获取根节点
            if(t.getColumnId()==parentId) {
                re=t;
            }
            // 一、根据传入的某个父节点ID,遍历该父节点的所有子节点
            if (t.getParentId() == parentId) {
                //遍历第一层
                recursionFn(list, t);
                returnList.add(t);
            }
        }
        re.setChildMenus(returnList);
        return re;
    }

    /**
     * 递归列表
     *
     * @param list
     * @param t
     */
    private static void recursionFn(List<BlogMenu> list, BlogMenu t) {
        // 得到子节点列表
        List<BlogMenu> childList = getChildList(list, t);
        // 添加子节点列表
        t.setChildMenus(childList);
        for (BlogMenu tChild : childList) {
            if (hasChild(list, tChild)) {
                // 判断是否有子节点
                Iterator<BlogMenu> it = childList.iterator();
                while (it.hasNext()) {
                    BlogMenu n = (BlogMenu) it.next();
                    recursionFn(list, n);
                }
            }
        }
    }

    /**
     *
     * @param list 遍历的数据
     * @param t 父节点
     * @return
     */
    private static List<BlogMenu> getChildList(List<BlogMenu> list, BlogMenu t) {
        List<BlogMenu> tlist = new ArrayList<BlogMenu>();
        Iterator<BlogMenu> it = list.iterator();
        while (it.hasNext()) {
            BlogMenu n = (BlogMenu) it.next();
            if (n.getParentId().longValue() == t.getColumnId().longValue()) {
                tlist.add(n);
            }
        }
        return tlist;
    }

    /**
     * 判断是否有子节点
     */
    private static boolean hasChild(List<BlogMenu> list, BlogMenu t) {
        return getChildList(list, t).size() > 0 ? true : false;
    }
}
