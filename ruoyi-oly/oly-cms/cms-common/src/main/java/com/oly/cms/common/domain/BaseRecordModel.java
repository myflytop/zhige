package com.oly.cms.common.domain;

import com.oly.cms.common.domain.entity.CmsArticle;
import com.ruoyi.common.annotation.Excel;

/* 
 * 赞
 * 踩
 * 收藏
 * 阅读
 * 评分
 * 分享
 */
public class BaseRecordModel extends CmsArticle {

    private Long recordId;

    /** 用户Id */
    @Excel(name = "用户Id")
    private Long userId;

    /** ip */
    @Excel(name = "ip")
    private String ip;

    /** 用户使用系统/或者浏览器 */
    @Excel(name = "使用系统")
    private String userSystem;

    /** 用户浏览器 */
    @Excel(name = "用户浏览器")
    private String userBower;

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getUserSystem() {
        return userSystem;
    }

    public void setUserSystem(String userSystem) {
        this.userSystem = userSystem;
    }

    public String getUserBower() {
        return userBower;
    }

    public void setUserBower(String userBower) {
        this.userBower = userBower;
    }

    public Long getRecordId() {
        return recordId;
    }

    public void setRecordId(Long recordId) {
        this.recordId = recordId;
    }

}
