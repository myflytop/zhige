package com.oly.cms.admin.controller.page;

import java.util.List;

import com.oly.cms.admin.service.impl.CmsLogRecordServiceImpl;
import com.oly.cms.admin.web.CmsCommonController;
import com.oly.cms.general.model.record.CmsLogRecord;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.enums.OperateTitle;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.hutool.core.convert.Convert;

/** 内容请求记录 */
@Controller
@RequestMapping("/cms/logRecord")
public class CmsLogRecordController extends CmsCommonController {
    @Autowired
    private CmsLogRecordServiceImpl cmsRecordService;

    private final String prefix = acceptPrefix + "logRecord";

    /**
     * 日志记录表
     * 
     * @return
     */
    @GetMapping
    @RequiresPermissions("cms:record:view")
    public String logRecord() {
        return prefix + "/logRecord";
    }

    /**
     * 查询内容请求记录列表
     */
    @RequiresPermissions("cms:record:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(CmsLogRecord cmsLogRecord) {
        startPage();
        List<CmsLogRecord> list = cmsRecordService.listCmsLogRecord(cmsLogRecord);
        return getDataTable(list);
    }

    /**
     * 删除内容请求记录
     */
    @RequiresPermissions("cms:record:remove")
    @Log(title = OperateTitle.WEB_RECORD, businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(cmsRecordService.deleteCmsLogRecordByIds(Convert.toStrArray(ids)));
    }
}
