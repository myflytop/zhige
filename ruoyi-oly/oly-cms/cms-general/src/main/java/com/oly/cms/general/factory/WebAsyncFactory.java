package com.oly.cms.general.factory;

import java.util.TimerTask;

import com.oly.cms.general.model.record.CmsLogRecord;
import com.oly.cms.general.service.IGeneralRecordService;
import com.ruoyi.common.utils.AddressUtils;
import com.ruoyi.common.utils.spring.SpringUtils;

/**
 * 博客异步工厂
 */
public class WebAsyncFactory {
    /**
     * 操作日志记录
     *
     * @param operLog 操作日志信息
     * @return 任务task
     */
    public static TimerTask recordOper(final CmsLogRecord operLog) {
        return new TimerTask() {
            @Override
            public void run() {
                // 远程查询操作地点
                operLog.setOperLocation(AddressUtils.getRealAddressByIP(operLog.getOperIp()));
                SpringUtils.getBean(IGeneralRecordService.class).insertWebLogRecord(operLog);
            }
        };
    }
}
