package com.oly.web.factory;

import java.util.TimerTask;

import com.oly.web.model.po.BlogLogRecord;
import com.oly.web.service.IBlogLogRecordService;
import com.ruoyi.common.utils.AddressUtils;
import com.ruoyi.common.utils.spring.SpringUtils;

/**
 * 博客异步工厂
 */
public class BlogAsyncFactory {
    /**
     * 操作日志记录
     *
     * @param operLog 操作日志信息
     * @return 任务task
     */
    public static TimerTask recordOper(final BlogLogRecord operLog) {
        return new TimerTask() {
            @Override
            public void run() {
                // 远程查询操作地点
                operLog.setOperLocation(AddressUtils.getRealAddressByIP(operLog.getOperIp()));
                SpringUtils.getBean(IBlogLogRecordService.class).insertBlogLogRecord(operLog);
            }
        };
    }
}
