package com.oly.common.model.support;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import com.github.pagehelper.PageInfo;

/**
 * @author bobey
 *
 *         分页数据
 */
public class PageData implements Serializable {
    private static final long serialVersionUID = 1L;
    /** 总记录数 */
    private long total;
    /** 列表数据 */
    private List<?> rows;
    /** 消息状态码 */
    private int code;
    /** 当前页 */
    private long pageNum;
    /** 每页数据量 */
    private long pageSize;
    /** 总页数 */
    private long pages;

    public long getPages() {
        return pages;
    }

    public void setPages(long pages) {
        this.pages = pages;
    }

    public long getTotal() {
        return total;
    }

    public void setTotal(long total) {
        this.total = total;
    }

    public List<?> getRows() {
        return rows;
    }

    public void setRows(List<?> rows) {
        this.rows = rows;
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

    public PageData() {
        super();
    }

    public PageData(long total, List<?> rows, int code, long pageNum, long pageSize) {
        super();
        this.total = total;
        this.rows = rows;
        this.code = code;
        this.pageNum = pageNum;
        this.pageSize = pageSize;
    }

    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder();
        builder.append("PageData [total=");
        builder.append(total);
        builder.append(", rows=");
        builder.append(rows);
        builder.append(", code=");
        builder.append(code);
        builder.append(", pageNum=");
        builder.append(pageNum);
        builder.append(", pageSize=");
        builder.append(pageSize);
        builder.append("]");
        return builder.toString();
    }

    /**
     * 响应请求分页数据 普通分页
     *
     * @return
     */
    public static PageData getData(List<?> list) {
        PageData rspData = new PageData();
        PageInfo page = new PageInfo(list);
        rspData.setCode(0);
        rspData.setRows(list);
        rspData.setTotal(page.getTotal());
        rspData.setPageNum(page.getPageNum());
        rspData.setPageSize(page.getPageSize());
        rspData.setPages(page.getPages());
        return rspData;
    }
}
