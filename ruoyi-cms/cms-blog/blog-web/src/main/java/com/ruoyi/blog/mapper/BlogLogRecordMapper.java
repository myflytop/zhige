package com.ruoyi.blog.mapper;

import com.ruoyi.blog.mould.BlogLogRecord;

import java.util.List;

public interface BlogLogRecordMapper {
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
     * 删除内容请求记录
     *
     * @param logId 内容请求记录ID
     * @return 结果
     */
    public int deleteBlogLogRecordById(Long logId);

    /**
     * 批量删除内容请求记录
     *
     * @param logIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteBlogLogRecordByIds(String[] logIds);
}
