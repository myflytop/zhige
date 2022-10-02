package com.oly.cms.hand.controller;

import com.oly.cms.hand.model.enums.RecordTableEnum;
import com.oly.cms.hand.model.param.WebRecordParam;
import com.oly.cms.hand.service.impl.HandRecordServiceImpl;
import com.ruoyi.common.annotation.RepeatSubmit;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.ServletUtils;
import com.ruoyi.common.utils.ShiroUtils;

import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.oly.cms.general.annotation.WebLog;
import com.oly.cms.general.model.enums.WebBusinessType;
import com.oly.cms.general.model.enums.WebLogType;

import eu.bitwalker.useragentutils.UserAgent;

/**
 * 默认小于一分钟为重复提交
 */
@Controller
@RequestMapping("/hand/record")
public class HandRecordController {
    @Autowired
    private HandRecordServiceImpl recordService;

    /**
     * 喜欢|点赞记录表 不能同时喜欢 讨厌
     * 
     * @param webRecordParam
     * @return
     */
    @RepeatSubmit(interval = 60000)
    @PostMapping("/addLikeRecord")
    @WebLog(title = "添加赞成", logType = WebLogType.ARTICLE, businessType = WebBusinessType.INSERT)
    @RequiresAuthentication
    @ResponseBody
    public AjaxResult addLikeRecord(WebRecordParam webRecordParam) {
        s(webRecordParam);
        if (recordService.getCountRecord(RecordTableEnum.LIKE_RECORD, webRecordParam.getArticleId(),
                webRecordParam.getUserId()) != 0) {
            return AjaxResult.error("你已经点过赞！");
        } else if (recordService.getCountRecord(RecordTableEnum.NASTY_RECORD, webRecordParam.getArticleId(),
                webRecordParam.getUserId()) != 0) {
            return AjaxResult.error("你已经踩过了！");
        } else {

            return AjaxResult.success(recordService.insertLikeRecord(webRecordParam));
        }
    }

    /**
     * 不喜欢|踩记录表 不能同时喜欢 讨厌
     * 
     * @param webRecordParam
     * @return
     */
    @RepeatSubmit(interval = 60000)
    @PostMapping("/addNastyRecord")
    @WebLog(title = "添加反对", logType = WebLogType.ARTICLE, businessType = WebBusinessType.INSERT)
    @RequiresAuthentication
    @ResponseBody
    public AjaxResult addNastyRecord(WebRecordParam webRecordParam) {
        s(webRecordParam);
        if (recordService.getCountRecord(RecordTableEnum.LIKE_RECORD, webRecordParam.getArticleId(),
                webRecordParam.getUserId()) != 0) {
            return AjaxResult.error("你已经点过赞！");
        } else if (recordService.getCountRecord(RecordTableEnum.NASTY_RECORD, webRecordParam.getArticleId(),
                webRecordParam.getUserId()) != 0) {
            return AjaxResult.error("你已经踩过了！");
        } else {
            s(webRecordParam);
            return AjaxResult.success(recordService.insertNastyRecord(webRecordParam));
        }
    }

    /**
     * 添加评分
     * 
     * @param webRecordParam
     * @return
     */
    @RepeatSubmit(interval = 60000)
    @PostMapping("/addScoreRecord")
    @WebLog(title = "添加评分", logType = WebLogType.ARTICLE, businessType = WebBusinessType.INSERT)
    @RequiresAuthentication
    @ResponseBody
    public AjaxResult addScoreRecord(WebRecordParam webRecordParam) {
        if (recordService.getCountRecord(RecordTableEnum.SCORE_RECORD, webRecordParam.getArticleId(),
                webRecordParam.getUserId()) != 0) {
            return AjaxResult.error("你已经评过分了！");
        }
        s(webRecordParam);
        return AjaxResult.success(recordService.insertScoreRecord(webRecordParam));
    }

    /**
     * 文章分享
     * 
     * @param webRecordParam
     * @return
     */
    @RepeatSubmit(interval = 60000)
    @PostMapping("/addShareRecord")
    @WebLog(title = "添加分享", logType = WebLogType.ARTICLE, businessType = WebBusinessType.INSERT)
    @RequiresAuthentication
    @ResponseBody
    public AjaxResult addShareRecord(WebRecordParam webRecordParam) {
        s(webRecordParam);
        return AjaxResult.success(recordService.insertShareRecord(webRecordParam));
    }

    /**
     * 添加收藏
     * 
     * @param webRecordParam
     * @return
     */
    @RepeatSubmit(interval = 60000)
    @PostMapping("/addCollectRecord")
    @WebLog(title = "添加收藏", logType = WebLogType.ARTICLE, businessType = WebBusinessType.INSERT)
    @RequiresAuthentication
    @ResponseBody
    public AjaxResult addCollectRecord(WebRecordParam webRecordParam) {
        if (recordService.getCountRecord(RecordTableEnum.COLLECT_RECORD, webRecordParam.getArticleId(),
                webRecordParam.getUserId()) != 0) {
            return AjaxResult.error("你已经收藏过了！");
        }
        s(webRecordParam);
        return AjaxResult.success(recordService.insertCollectRecord(webRecordParam));
    }

    /**
     *
     * 设置系统标识 浏览器
     */
    @RepeatSubmit(interval = 60000)
    private void s(WebRecordParam webRecordParam) {
        UserAgent userAgent = UserAgent.parseUserAgentString(ServletUtils.getRequest().getHeader("User-Agent"));
        String ip = ShiroUtils.getIp();
        webRecordParam.setIp(ip);
        try {
            webRecordParam.setUserId(ShiroUtils.getUserId());
        } catch (Exception e) {
        }
        webRecordParam.setUserSystem(userAgent.getOperatingSystem().getName());
        webRecordParam.setUserBower(userAgent.getBrowser().getName());
    }

}
