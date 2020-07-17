package com.ruoyi.cms.common.web.controller;


import com.github.pagehelper.PageHelper;
import com.ruoyi.cache.redis.util.RedisUtils;
import com.ruoyi.cms.common.enums.ThemeEnums;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.page.PageDomain;
import com.ruoyi.common.core.page.TableSupport;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.sql.SqlUtil;


public class CommonController extends BaseController {

    private final String prefix=ThemeEnums.THEME_ROOT.getValue();

    private final String themeNameKey= ThemeEnums.THEME_USED.getValue();

    /**
     * 默认转发
     * 1.查找是否存在缓存
     * 2.不存在使用默认主题
     * @param redisUtils
     * @param page
     * @return
     */
    protected String getPrefix(RedisUtils redisUtils, String page){
        Object object=redisUtils.get(themeNameKey);
        if(object==null)
        {
            return prefix+ThemeEnums.DEFAULT_THEME.getValue()+page;
        }
        return prefix+object+page;
    }

    /**
     * 设置请求分页数据
     */
    protected void startPage()
    {
        PageDomain pageDomain = TableSupport.buildPageRequest();
        Integer pageNum = pageDomain.getPageNum();
        Integer pageSize = pageDomain.getPageSize();
        if (StringUtils.isNotNull(pageNum) && StringUtils.isNotNull(pageSize))
        {
            String orderBy = SqlUtil.escapeOrderBySql(pageDomain.getOrderBy());
            PageHelper.startPage(pageNum, pageSize, orderBy);
        }
    }

    /**
     * 设置请求分页数据
     */
    protected void startDefaultPage()
    {
        PageDomain pageDomain = TableSupport.buildPageRequest();
        Integer pageNum = pageDomain.getPageNum();
        Integer pageSize = pageDomain.getPageSize();
        if (StringUtils.isNotNull(pageNum) && StringUtils.isNotNull(pageSize))
        {
            String orderBy = SqlUtil.escapeOrderBySql(pageDomain.getOrderBy());
            PageHelper.startPage(pageNum, pageSize, orderBy);
        }
        else {
            String orderBy = SqlUtil.escapeOrderBySql(pageDomain.getOrderBy());
            PageHelper.startPage(1, 60, orderBy);
        }
    }




}
