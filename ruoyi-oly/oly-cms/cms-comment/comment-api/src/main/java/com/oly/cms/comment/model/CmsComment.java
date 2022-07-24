package com.oly.cms.comment.model;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.oly.cms.common.model.support.PageData;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 评论对象 cms_comment
 * 
 * @author zd
 * @date 2022-07-06
 */
public class CmsComment extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** id */
    private Long commentId;

    /** 类型ID */
    private String typeId;

    /** 主楼|为0为主楼 */
    private Long parentId;

    /** 发布人 */
    private Long fromBy;

    /** 回复的人 */
    private Long replyBy;

    /** 内容 */
    private String content;

    /** 评论类型 */
    private Integer commentType;

    /** 状态 */
    private Integer visible;

    /** ip */
    private String ip;

    /** 用户使用系统 */
    private String userSystem;

    /** 用户浏览器 */
    private String userBower;

    /** 讨厌统计 */
    private Integer nastyCount;

    /** 喜欢统计 */
    private Integer likeCount;

    /** 排序 */
    private Long orderNum;

    private PageData childPage;

    public void setCommentId(Long commentId) {
        this.commentId = commentId;
    }

    public Long getCommentId() {
        return commentId;
    }

    public void setTypeId(String typeId) {
        this.typeId = typeId;
    }

    public String getTypeId() {
        return typeId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setFromBy(Long fromBy) {
        this.fromBy = fromBy;
    }

    public Long getFromBy() {
        return fromBy;
    }

    public void setReplyBy(Long replyBy) {
        this.replyBy = replyBy;
    }

    public Long getReplyBy() {
        return replyBy;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getContent() {
        return content;
    }

    public void setCommentType(Integer commentType) {
        this.commentType = commentType;
    }

    public Integer getCommentType() {
        return commentType;
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

    public Integer getNastyCount() {
        return nastyCount;
    }

    public void setNastyCount(Integer nastyCount) {
        this.nastyCount = nastyCount;
    }

    public Integer getLikeCount() {
        return likeCount;
    }

    public void setLikeCount(Integer likeCount) {
        this.likeCount = likeCount;
    }

    public void setOrderNum(Long orderNum) {
        this.orderNum = orderNum;
    }

    public Long getOrderNum() {
        return orderNum;
    }

    public PageData getChildPage() {
        return childPage;
    }

    public void setChildPage(PageData childPage) {
        this.childPage = childPage;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("commentId", getCommentId())
                .append("typeId", getTypeId())
                .append("parentId", getParentId())
                .append("createTime", getCreateTime())
                .append("fromBy", getFromBy())
                .append("replyBy", getReplyBy())
                .append("content", getContent())
                .append("commentType", getCommentType())
                .append("visible", getVisible())
                .append("ip", getIp())
                .append("userSystem", getUserSystem())
                .append("userBower", getUserBower())
                .append("nastyCount", getNastyCount())
                .append("likeCount", getLikeCount())
                .append("remark", getRemark())
                .append("orderNum", getOrderNum())
                .append("childPage", getChildPage())
                .toString();
    }
}
