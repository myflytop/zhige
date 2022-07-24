package com.oly.cms.general.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oly.cms.general.model.record.CmsLookRecord;
import com.oly.cms.general.service.impl.GeneralRecordServiceImpl;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.ServletUtils;
import com.ruoyi.common.utils.ShiroUtils;

import eu.bitwalker.useragentutils.UserAgent;

@Controller
@RequestMapping("/general/record")
public class GeneralRecordController {
    @Autowired
    private GeneralRecordServiceImpl recordService;

    /**
     * 文章点击记录
     * 
     * @param cmsLookRecord
     * @return
     */
    @PostMapping("/addLookRecord")
    @ResponseBody
    public AjaxResult addLookRecord(CmsLookRecord cmsLookRecord) {
        UserAgent userAgent = UserAgent.parseUserAgentString(ServletUtils.getRequest().getHeader("User-Agent"));
        String ip = ShiroUtils.getIp();
        cmsLookRecord.setIp(ip);
        cmsLookRecord.setUserId(ShiroUtils.getSysUser() == null ? -1L : ShiroUtils.getUserId());
        cmsLookRecord.setUserSystem(userAgent.getOperatingSystem().getName());
        cmsLookRecord.setUserBower(userAgent.getBrowser().getName());
        return AjaxResult.success(recordService.insertCmsLookRecord(cmsLookRecord));
    }

}
