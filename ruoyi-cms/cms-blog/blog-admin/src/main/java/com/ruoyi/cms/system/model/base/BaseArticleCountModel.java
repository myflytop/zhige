package com.ruoyi.cms.system.model.base;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.annotation.Excel;

import java.io.Serializable;
import java.util.Date;

public class BaseArticleCountModel implements Serializable {

    private static final long serialVersionUID = 1L;
    /** 文章id */
    @Excel(name = "文章id")
    private Long articleId;

    /** 文章id */
    @Excel(name = "文章名")
    private String articleTitle;

    /** 用户Id */
    @Excel(name = "用户Id")
    private Long userId;

    /** ip */
    @Excel(name = "ip")
    private String ip;

    /** 用户使用系统/或者浏览器 */
    @Excel(name = "用户使用系统/或者浏览器")
    private String userSystem;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "创建时间")
    private Date createTime;

    /** 修改时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "修改时间")
    private Date updateTime;
    /** 用户浏览器 */
    @Excel(name = "用户浏览器")
    private String userBower;

    /** 状态*/
    @Excel(name = "状态")
    private Byte visible;

    public String getArticleTitle() {
        return articleTitle;
    }

    public void setArticleTitle(String articleTitle) {
        this.articleTitle = articleTitle;
    }

    public Byte getVisible() {
        return visible;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public void setVisible(Byte visible) {
        this.visible = visible;
    }

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

    public String getUserBower() {
        return userBower;
    }

    public void setUserBower(String userBower) {
        this.userBower = userBower;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }


}
