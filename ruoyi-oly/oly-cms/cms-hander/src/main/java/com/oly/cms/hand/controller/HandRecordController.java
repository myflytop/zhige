package com.oly.cms.hand.controller;

import com.oly.cms.hand.model.enums.RecordTableEnum;
import com.oly.cms.hand.model.param.WebRecordParam;
import com.oly.cms.hand.service.impl.HandRecordServiceImpl;
import com.ruoyi.common.annotation.RepeatSubmit;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.CommonVisibleEnums;
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
        webRecordParam.setRecordTable(RecordTableEnum.LIKE_RECORD.getValue());
        webRecordParam.setScore(null);
        webRecordParam.setShareUrl(null);
        String likeVisible = recordService.selectRecordVisible(RecordTableEnum.LIKE_RECORD,
                webRecordParam.getArticleId(),
                webRecordParam.getUserId());
        if ("1"
                .equals(recordService.selectRecordVisible(RecordTableEnum.NASTY_RECORD, webRecordParam.getArticleId(),
                        webRecordParam.getUserId()))) {
            return AjaxResult.success("你已经踩过了！", "Already nasty it");
        } else if ("1".equals(likeVisible)) {
            webRecordParam.setVisible(CommonVisibleEnums.HIDE.ordinal());
            recordService.updateCmsArticleRecord(webRecordParam);
            return AjaxResult.success("取消点赞成功！", "cancel");
        } else if ("0".equals(likeVisible)) {
            webRecordParam.setVisible(CommonVisibleEnums.SHOW.ordinal());
            recordService.updateCmsArticleRecord(webRecordParam);
            return AjaxResult.success("点赞成功！", "update");
        } else {
            recordService.insertLikeRecord(webRecordParam);
            return AjaxResult.success("点赞成功！", "add");
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
        webRecordParam.setRecordTable(RecordTableEnum.NASTY_RECORD.getValue());
        webRecordParam.setScore(null);
        webRecordParam.setShareUrl(null);
        String nastyVisible = recordService.selectRecordVisible(RecordTableEnum.NASTY_RECORD,
                webRecordParam.getArticleId(),
                webRecordParam.getUserId());
        if ("1".equals(recordService.selectRecordVisible(RecordTableEnum.LIKE_RECORD, webRecordParam.getArticleId(),
                webRecordParam.getUserId()))) {
            return AjaxResult.success("你已经点赞了", "Already liked it");
        } else if ("1".equals(nastyVisible)) {
            webRecordParam.setVisible(CommonVisibleEnums.HIDE.ordinal());
            recordService.updateCmsArticleRecord(webRecordParam);
            return AjaxResult.success("取消踩成功！", "cancel");
        } else if ("0".equals(nastyVisible)) {
            webRecordParam.setVisible(CommonVisibleEnums.SHOW.ordinal());
            recordService.updateCmsArticleRecord(webRecordParam);
            return AjaxResult.success("踩成功", "update");
        } else {
            s(webRecordParam);
            recordService.insertNastyRecord(webRecordParam);
            return AjaxResult.success("踩成功！", "add");
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
        String scoreVisible = recordService.selectRecordVisible(RecordTableEnum.SCORE_RECORD,
                webRecordParam.getArticleId(),
                webRecordParam.getUserId());
        webRecordParam.setShareUrl(null);
        webRecordParam.setRecordTable(RecordTableEnum.SCORE_RECORD.getValue());
        if ("1".equals(scoreVisible)) {
            webRecordParam.setVisible(CommonVisibleEnums.HIDE.ordinal());
            recordService.updateCmsArticleRecord(webRecordParam);
            return AjaxResult.success("取消评分成功", "cancel");
        } else if ("0".equals(scoreVisible)) {
            webRecordParam.setVisible(CommonVisibleEnums.SHOW.ordinal());
            recordService.updateCmsArticleRecord(webRecordParam);
            return AjaxResult.success("添加评分成功", "update");
        } else {
            s(webRecordParam);
            recordService.insertScoreRecord(webRecordParam);
            return AjaxResult.success("添加评分成功", "add");
        }
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
        webRecordParam.setScore(null);
        webRecordParam.setRecordTable(RecordTableEnum.SHARE_RECORD.getValue());
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
        s(webRecordParam);
        webRecordParam.setRecordTable(RecordTableEnum.COLLECT_RECORD.getValue());
        webRecordParam.setScore(null);
        webRecordParam.setShareUrl(null);
        String collectVisible = recordService.selectRecordVisible(RecordTableEnum.COLLECT_RECORD,
                webRecordParam.getArticleId(),
                webRecordParam.getUserId());
        if ("1".equals(collectVisible)) {
            webRecordParam.setVisible(CommonVisibleEnums.HIDE.ordinal());
            recordService.updateCmsArticleRecord(webRecordParam);
            return AjaxResult.success("取消收藏成功", "cancel");
        } else if ("0".equals(collectVisible)) {
            webRecordParam.setVisible(CommonVisibleEnums.SHOW.ordinal());
            recordService.updateCmsArticleRecord(webRecordParam);
            return AjaxResult.success("添加收藏成功", "update");
        } else {

            recordService.insertCollectRecord(webRecordParam);
            return AjaxResult.success("添加收藏成功", "add");
        }
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
