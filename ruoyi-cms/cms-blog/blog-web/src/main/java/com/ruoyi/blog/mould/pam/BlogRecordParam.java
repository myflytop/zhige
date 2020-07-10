package com.ruoyi.blog.mould.pam;



import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

/**
 * 记录参数基本
 */
public class BlogRecordParam {
    private Long articleId;
    private Long userId;
    private String ip;
    private String userSystem;
    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;
    /** 最后修改时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;
    private String userBower;
    private Byte visible;
    private Byte score;
    private String shareUrl;

    public String getRecordTable() {
        return recordTable;
    }

    public void setRecordTable(String recordTable) {
        this.recordTable = recordTable;
    }

    private String recordTable;

    public Long getArticleId() {
        return articleId;
    }

    public void setArticleId(Long articleId) {
        this.articleId = articleId;
    }

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

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getUserBower() {
        return userBower;
    }

    public void setUserBower(String userBower) {
        this.userBower = userBower;
    }

    public Byte getFettle() {
        return visible;
    }

    public void setFettle(Byte visible) {
        this.visible = visible;
    }

    public Byte getScore() {
        return score;
    }

    public void setScore(Byte score) {
        this.score = score;
    }

    public String getShareUrl() {
        return shareUrl;
    }

    public void setShareUrl(String shareUrl) {
        this.shareUrl = shareUrl;
    }




}
