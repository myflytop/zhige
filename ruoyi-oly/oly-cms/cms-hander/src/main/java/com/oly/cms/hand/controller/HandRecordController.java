package com.oly.cms.hand.controller;

import com.oly.cms.hand.model.enums.RecordTableEnum;
import com.oly.cms.hand.model.param.WebRecordParam;
import com.oly.cms.hand.service.impl.HandRecordServiceImpl;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.ServletUtils;
import com.ruoyi.common.utils.ShiroUtils;

import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import eu.bitwalker.useragentutils.UserAgent;

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
    @PostMapping("/addLikeRecord")
    @RequiresAuthentication
    @ResponseBody
    public AjaxResult addLikeRecord(WebRecordParam webRecordParam) {
        s(webRecordParam);
        if (recordService.countRecord(RecordTableEnum.LIKE_RECORD, webRecordParam.getArticleId(),
                webRecordParam.getUserId()) != 0) {
            return AjaxResult.error("你已经点过赞！");
        } else if (recordService.countRecord(RecordTableEnum.NASTY_RECORD, webRecordParam.getArticleId(),
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
    @PostMapping("/addNastyRecord")
    @RequiresAuthentication
    @ResponseBody
    public AjaxResult addNastyRecord(WebRecordParam webRecordParam) {
        s(webRecordParam);
        if (recordService.countRecord(RecordTableEnum.LIKE_RECORD, webRecordParam.getArticleId(),
                webRecordParam.getUserId()) != 0) {
            return AjaxResult.error("你已经点过赞！");
        } else if (recordService.countRecord(RecordTableEnum.NASTY_RECORD, webRecordParam.getArticleId(),
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
    @PostMapping("/addScoreRecord")
    @RequiresAuthentication
    @ResponseBody
    public AjaxResult addScoreRecord(WebRecordParam webRecordParam) {
        if (recordService.countRecord(RecordTableEnum.SCORE_RECORD, webRecordParam.getArticleId(),
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
    @PostMapping("/addShareRecord")
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
    @PostMapping("/addCollectRecord")
    @RequiresAuthentication
    @ResponseBody
    public AjaxResult addCollectRecord(WebRecordParam webRecordParam) {
        if (recordService.countRecord(RecordTableEnum.COLLECT_RECORD, webRecordParam.getArticleId(),
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