package com.oly.web.web;

import com.github.pagehelper.PageHelper;
import com.oly.common.model.properties.OlyThemeProperties;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.page.PageDomain;
import com.ruoyi.common.core.page.TableSupport;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.sql.SqlUtil;
import com.ruoyi.system.service.impl.SysConfigServiceImpl;

public class CommonController extends BaseController {

    /**
     * 默认转发 1.查找是否存在缓存 2.不存在使用默认主题
     * 
     * @param redisUtils
     * @param page
     * @return
     */
    protected String getPrefix(SysConfigServiceImpl serviceImpl, String page) {
        String themeName = serviceImpl.selectConfigByKey(OlyThemeProperties.THEME_USED.getValue());
        if (StringUtils.isEmpty(themeName)) {
            return  OlyThemeProperties.THEME_USED.defaultValue() + page;
        }
        return "themes/"+ themeName + page;
    }

    /**
     * 设置请求分页数据
     */
    protected void startPage() {
        PageDomain pageDomain = TableSupport.buildPageRequest();
        Integer pageNum = pageDomain.getPageNum();
        Integer pageSize = pageDomain.getPageSize();
        if (StringUtils.isNotNull(pageNum) && StringUtils.isNotNull(pageSize)) {
            String orderBy = SqlUtil.escapeOrderBySql(pageDomain.getOrderBy());
            PageHelper.startPage(pageNum, pageSize, orderBy);
        }
    }

    /**
     * 设置请求分页数据
     */
    protected void startDefaultPage() {
        PageDomain pageDomain = TableSupport.buildPageRequest();
        Integer pageNum = pageDomain.getPageNum();
        Integer pageSize = pageDomain.getPageSize();
        if (StringUtils.isNotNull(pageNum) && StringUtils.isNotNull(pageSize)) {
            String orderBy = SqlUtil.escapeOrderBySql(pageDomain.getOrderBy());
            PageHelper.startPage(pageNum, pageSize, orderBy);
        } else {
            String orderBy = SqlUtil.escapeOrderBySql(pageDomain.getOrderBy());
            PageHelper.startPage(1, 60, orderBy);
        }
    }

}
