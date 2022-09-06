package com.oly.cms.general.model;

import java.util.List;
import java.util.Map;

import com.github.pagehelper.PageInfo;
import com.oly.cms.general.model.vo.WebArticleVo;

/**
 * 时间线配置
 */
public class PageArticleVoTimeLine {
    /** 总记录数 */
    private long total;
    /** 消息状态码 */
    private int code;
    /** 当前页 */
    private long pageNum;
    /** 每页数据量 */
    private long pageSize;
    /** 总页数 */
    private long pages;

    Map<String, List<WebArticleVo>> map;

    public long getTotal() {
        return total;
    }

    public void setTotal(long total) {
        this.total = total;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public long getPageNum() {
        return pageNum;
    }

    public void setPageNum(long pageNum) {
        this.pageNum = pageNum;
    }

    public long getPageSize() {
        return pageSize;
    }

    public void setPageSize(long pageSize) {
        this.pageSize = pageSize;
    }

    public long getPages() {
        return pages;
    }

    public void setPages(long pages) {
        this.pages = pages;
    }

    public Map<String, List<WebArticleVo>> getMap() {
        return map;
    }

    public void setMap(Map<String, List<WebArticleVo>> map) {
        this.map = map;
    }

    /**
     * 响应请求分页数据 普通分页
     *
     * @return
     */
    public static PageArticleVoTimeLine getData(List<?> list, Map<String, List<WebArticleVo>> map) {
        PageArticleVoTimeLine rspData = new PageArticleVoTimeLine();
        PageInfo<?> page = new PageInfo(list);
        rspData.setCode(0);
        rspData.setMap(map);
        rspData.setTotal(page.getTotal());
        rspData.setPageNum(page.getPageNum());
        rspData.setPageSize(page.getPageSize());
        rspData.setPages(page.getPages());
        return rspData;
    }
}
