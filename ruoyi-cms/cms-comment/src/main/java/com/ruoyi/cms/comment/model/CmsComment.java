package com.ruoyi.cms.comment.model;


import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.cms.common.mould.support.PageData;
import com.ruoyi.common.annotation.Excel;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * 评论对象 cms_comment
 * 
 * @author ruoyi
 * @date 2020-04-24
 */
public class CmsComment implements Serializable
{
    private static final long serialVersionUID = 1L;


    /** 备注 */
    private String remark;

    /** 评论id */
    private Long commentId;

    /** 文章id */
    @Excel(name = "文章id")
    private Long articleId;

    /** 主楼|为0为主楼 */
    @Excel(name = "主楼|为0为主楼")
    private Long parentId;

    /** 发布人（用户id_昵称） */
    @Excel(name = "发布人")
    private Long fromBy;

    /** 回复的人（用户id_昵称） */
    @Excel(name = "回复的人")
    private Long replyBy;

    /** 内容 */
    @Excel(name = "内容")
    private String content;

    /** 评论类型 */
    @Excel(name = "评论类型")
    private Long commentType;

    /** 状态 */
    @Excel(name = "状态")
    private Byte visible;

    /** ip */
    @Excel(name = "ip")
    private String ip;

    /** 用户使用系统/或者浏览器 */
    @Excel(name = "用户使用系统/或者浏览器")
    private String userSystem;

    /** 用户浏览器 */
    @Excel(name = "用户浏览器")
    private String userBower;

    /** 讨厌统计 */
    @Excel(name = "讨厌统计")
    private Long nastyCount;

    /** 喜欢统计 */
    @Excel(name = "喜欢统计")
    private Long likeCount;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    private List<CmsComment> listChildrens;

    private PageData childrenPageData;

    public PageData getChildrenPageData() {
        return childrenPageData;
    }

    public void setChildrenPageData(PageData childrenPageData) {
        this.childrenPageData = childrenPageData;
    }

    public Long getFromBy() {
        return fromBy;
    }

    public void setFromBy(Long fromBy) {
        this.fromBy = fromBy;
    }

    public Long getReplyBy() {
        return replyBy;
    }

    public void setReplyBy(Long replyBy) {
        this.replyBy = replyBy;
    }

    public List<CmsComment> getListChildrens() {
        return listChildrens;
    }

    public void setListChildrens(List<CmsComment> listChildrens) {
        this.listChildrens = listChildrens;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
    public void setCommentId(Long commentId) 
    {
        this.commentId = commentId;
    }

    public Long getCommentId() 
    {
        return commentId;
    }
    public void setArticleId(Long articleId) 
    {
        this.articleId = articleId;
    }

    public Long getArticleId() 
    {
        return articleId;
    }
    public void setParentId(Long parentId) 
    {
        this.parentId = parentId;
    }

    public Long getParentId() 
    {
        return parentId;
    }

    public void setContent(String content) 
    {
        this.content = content;
    }

    public String getContent() 
    {
        return content;
    }
    public void setCommentType(Long commentType) 
    {
        this.commentType = commentType;
    }

    public Long getCommentType() 
    {
        return commentType;
    }
    public void setFettle(Byte visible)
    {
        this.visible = visible;
    }

    public Byte grtVisible()
    {
        return visible;
    }
    public void setIp(String ip) 
    {
        this.ip = ip;
    }

    public String getIp() 
    {
        return ip;
    }
    public void setUserSystem(String userSystem) 
    {
        this.userSystem = userSystem;
    }

    public String getUserSystem() 
    {
        return userSystem;
    }
    public void setUserBower(String userBower) 
    {
        this.userBower = userBower;
    }

    public String getUserBower() 
    {
        return userBower;
    }
    public void setNastyCount(Long nastyCount) 
    {
        this.nastyCount = nastyCount;
    }

    public Long getNastyCount() 
    {
        return nastyCount;
    }
    public void setLikeCount(Long likeCount) 
    {
        this.likeCount = likeCount;
    }

    public Long getLikeCount() 
    {
        return likeCount;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
            .append("commentId", getCommentId())
            .append("articleId", getArticleId())
            .append("parentId", getParentId())
            .append("createTime", getCreateTime())
            .append("fromBy", getFromBy())
            .append("replyBy", getReplyBy())
            .append("content", getContent())
            .append("commentType", getCommentType())
            .append("visible", grtVisible())
            .append("ip", getIp())
            .append("userSystem", getUserSystem())
            .append("userBower", getUserBower())
            .append("nastyCount", getNastyCount())
            .append("likeCount", getLikeCount())
            .append("remark", getRemark())
            .toString();
    }
}
