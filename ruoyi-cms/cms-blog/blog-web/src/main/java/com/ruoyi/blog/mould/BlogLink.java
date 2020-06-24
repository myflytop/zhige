package com.ruoyi.blog.mould;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.util.Date;
/*文章链接*/
public class BlogLink implements Serializable {
    /** null */
    private Long linkId;

    private String linkUrl;

    private String linkName;

    private String linkSuggest;

    private String otherMsg;

    private String linkFavicon;

    private Byte visible;

    private Byte orderNo;

    private Byte openType;

    private String groupName;

    private String remark;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
    public Date getCreateTime()
    {
        return createTime;
    }
    public Long getLinkId() {
        return linkId;
    }

    public void setLinkId(Long linkId) {
        this.linkId = linkId;
    }

    public String getLinkUrl() {
        return linkUrl;
    }

    public void setLinkUrl(String linkUrl) {
        this.linkUrl = linkUrl;
    }

    public String getLinkName() {
        return linkName;
    }

    public void setLinkName(String linkName) {
        this.linkName = linkName;
    }

    public String getLinkSuggest() {
        return linkSuggest;
    }

    public void setLinkSuggest(String linkSuggest) {
        this.linkSuggest = linkSuggest;
    }

    public String getOtherMsg() {
        return otherMsg;
    }

    public void setOtherMsg(String otherMsg) {
        this.otherMsg = otherMsg;
    }

    public String getLinkFavicon() {
        return linkFavicon;
    }

    public void setLinkFavicon(String linkFavicon) {
        this.linkFavicon = linkFavicon;
    }

    public Byte getVisible() {
        return visible;
    }

    public void setVisible(Byte visible) {
        this.visible = visible;
    }

    public Byte getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(Byte orderNo) {
        this.orderNo = orderNo;
    }

    public Byte getOpenType() {
        return openType;
    }

    public void setOpenType(Byte openType) {
        this.openType = openType;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }


}
