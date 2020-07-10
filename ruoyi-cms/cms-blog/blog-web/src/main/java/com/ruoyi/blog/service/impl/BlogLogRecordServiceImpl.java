package com.ruoyi.blog.service.impl;

import com.ruoyi.blog.mapper.BlogLogRecordMapper;
import com.ruoyi.blog.mould.BlogLogRecord;
import com.ruoyi.blog.service.IBlogLogRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BlogLogRecordServiceImpl implements IBlogLogRecordService {

    @Autowired
    private BlogLogRecordMapper blogLogRecordMapper;

    @Override
    public BlogLogRecord selectBlogLogRecordById(Long logId) {
        return null;
    }

    @Override
    public List<BlogLogRecord> selectBlogLogRecordList(BlogLogRecord blogLogRecord) {
        return null;
    }

    @Override
    public int insertBlogLogRecord(BlogLogRecord blogLogRecord) {
        return blogLogRecordMapper.insertBlogLogRecord(blogLogRecord);
    }

    @Override
    public int updateBlogLogRecord(BlogLogRecord blogLogRecord) {
        return 0;
    }

    @Override
    public int deleteBlogLogRecordByIds(String ids) {
        return 0;
    }

    @Override
    public int deleteBlogLogRecordById(Long logId) {
        return 0;
    }
}
