package com.oly.cms.comment.model;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 评论记录对象 cms_comment_hand
 * 
 * @author zd
 * @date 2022-07-06
 */
public class CmsCommentHand extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** 控制id */
    private Long handId;

    /** 类型id */
    private String typeId;

    /** 评论id */
    private Long commentId;

    /** 用户Id */
    private Long userId;

    /** 操作状态1喜欢，2讨厌，3取消喜欢，4取消讨厌 */
    private Integer visible;

    /** ip */
    private String ip;

    /** 用户使用系统 */
    private String userSystem;

    /** 用户浏览器 */
    private String userBower;

    public String getTypeId() {
        return typeId;
    }

    public void setTypeId(String typeId) {
        this.typeId = typeId;
    }

    public void setCommentId(Long commentId) {
        this.commentId = commentId;
    }

    public Long getCommentId() {
        return commentId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setVisible(Integer visible) {
        this.visible = visible;
    }

    public Integer getVisible() {
        return visible;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getIp() {
        return ip;
    }

    public void setUserSystem(String userSystem) {
        this.userSystem = userSystem;
    }

    public String getUserSystem() {
        return userSystem;
    }

    public void setUserBower(String userBower) {
        this.userBower = userBower;
    }

    public String getUserBower() {
        return userBower;
    }

    public Long getHandId() {
        return handId;
    }

    public void setHandId(Long handId) {
        this.handId = handId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("handId", getHandId())
                .append("typeId", getTypeId())
                .append("commentId", getCommentId())
                .append("userId", getUserId())
                .append("visible", getVisible())
                .append("ip", getIp())
                .append("userSystem", getUserSystem())
                .append("userBower", getUserBower())
                .append("createTime", getCreateTime())
                .toString();
    }
}
