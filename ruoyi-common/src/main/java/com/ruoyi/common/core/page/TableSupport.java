package com.ruoyi.common.core.page;

import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.utils.ServletUtils;

/**
 * 表格数据处理
 * 
 * @author ruoyi
 */
public class TableSupport
{
    /**
     * 封装分页对象
     */
    public static PageDomain getPageDomain()
    {

        return   getPageDomain(Constants.PAGE_NUM,Constants.PAGE_SIZE,Constants.ORDER_BY_COLUMN,Constants.IS_ASC);
    }

    /**
     * 封装分页对象
     */
    public static PageDomain getPageDomain(String numString,String sizeString,String orderString,String ascString)
    {
        PageDomain pageDomain = new PageDomain();
        if (!"".equals(numString)){
            pageDomain.setPageNum(ServletUtils.getParameterToInt(numString));
        }
        pageDomain.setPageSize(ServletUtils.getParameterToInt(sizeString));
        pageDomain.setOrderByColumn(ServletUtils.getParameter(orderString));
        pageDomain.setIsAsc(ServletUtils.getParameter(ascString));
        return pageDomain;
    }

    public static PageDomain buildPageRequest()
    {
        return getPageDomain();
    }
}
