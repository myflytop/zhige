package com.oly.web.service;

import java.util.List;

import com.oly.web.model.po.BlogLogRecord;

public interface IBlogLogRecordService {
    /**
     * 查询内容请求记录
     *
     * @param logId 内容请求记录ID
     * @return 内容请求记录
     */
    public BlogLogRecord selectBlogLogRecordById(Long logId);

    /**
     * 查询内容请求记录列表
     *
     * @param blogLogRecord 内容请求记录
     * @return 内容请求记录集合
     */
    public List<BlogLogRecord> selectBlogLogRecordList(BlogLogRecord blogLogRecord);

    /**
     * 新增内容请求记录
     *
     * @param blogLogRecord 内容请求记录
     * @return 结果
     */
    public int insertBlogLogRecord(BlogLogRecord blogLogRecord);

    /**
     * 修改内容请求记录
     *
     * @param blogLogRecord 内容请求记录
     * @return 结果
     */
    public int updateBlogLogRecord(BlogLogRecord blogLogRecord);

    /**
     * 批量删除内容请求记录
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteBlogLogRecordByIds(String ids);

    /**
     * 删除内容请求记录信息
     *
     * @param logId 内容请求记录ID
     * @return 结果
     */
    public int deleteBlogLogRecordById(Long logId);
}
