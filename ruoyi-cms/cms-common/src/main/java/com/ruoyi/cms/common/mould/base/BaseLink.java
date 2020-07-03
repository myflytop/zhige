package com.ruoyi.cms.common.mould.base;

import com.ruoyi.common.annotation.Excel;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class BaseLink extends BaseModel{
    private static final long serialVersionUID = 1L;

    /** null */
    private Long linkId;

    /** 链接地址 */
    @Excel(name = "链接地址")
    private String linkUrl;

    /** 链接名 */
    @Excel(name = "链接名")
    private String linkName;

    /** 链接介绍 */
    @Excel(name = "链接介绍")
    private String linkSuggest;

    /** 其它信息 */
    @Excel(name = "其它信息")
    private String otherMsg;

    /** 链接LOGO */
    @Excel(name = "链接LOGO")
    private String linkFavicon;

    /** 状态 */
    @Excel(name = "状态")
    private Integer visible;

    /** 排序*/
    @Excel(name="排序")
    private Byte orderNo;

    /** 打开方式*/
    @Excel(name="打开方式")
    private Byte openType;

    /** 链接地址 */
    @Excel(name = "链接地址")
    private String groupName;

    public void setOrderNo(Byte orderNo) {
        this.orderNo = orderNo;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public Byte getOrderNo() {
        return orderNo;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setLinkId(Long linkId)
    {
        this.linkId = linkId;
    }

    public Long getLinkId()
    {
        return linkId;
    }
    public void setLinkUrl(String linkUrl)
    {
        this.linkUrl = linkUrl;
    }

    public String getLinkUrl()
    {
        return linkUrl;
    }
    public void setLinkName(String linkName)
    {
        this.linkName = linkName;
    }

    public String getLinkName()
    {
        return linkName;
    }
    public void setLinkSuggest(String linkSuggest)
    {
        this.linkSuggest = linkSuggest;
    }

    public String getLinkSuggest()
    {
        return linkSuggest;
    }
    public void setOtherMsg(String otherMsg)
    {
        this.otherMsg = otherMsg;
    }

    public String getOtherMsg()
    {
        return otherMsg;
    }
    public void setLinkFavicon(String linkFavicon)
    {
        this.linkFavicon = linkFavicon;
    }

    public String getLinkFavicon()
    {
        return linkFavicon;
    }
    public Byte getOpenType() {
        return openType;
    }

    public void setOpenType(Byte openType) {
        this.openType = openType;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("linkId", getLinkId())
                .append("linkUrl", getLinkUrl())
                .append("linkName", getLinkName())
                .append("linkSuggest", getLinkSuggest())
                .append("otherMsg", getOtherMsg())
                .append("linkFavicon", getLinkFavicon())
                .append("visible", getVisible())
                .append("remark", getRemark())
                .append("createTime", getCreateTime())
                .append("updateTime", getUpdateTime())
                .append("updateBy", getUpdateBy())
                .append("createBy", getCreateBy())
                .append("groupName",getGroupName())
                .append("orderNo",getOrderNo())
                .append("openType",getOpenType())
                .toString();
    }
}
