package com.oly.common.model.entity.base;

import com.ruoyi.common.annotation.Excel;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class BaseLink extends BaseModel {
    private static final long serialVersionUID = 1L;

    /** 链接id */
    @Excel(name = "链接Id")
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

    /** 分组key */
    @Excel(name = "分组key")
    private String groupKey;

    /** 链接LOGO */
    @Excel(name = "链接LOGO")
    private String linkFavicon;

    /** 状态 */
    @Excel(name = "状态")
    private Integer visible;

    /** 打开方式 */
    @Excel(name = "打开方式")
    private Byte openType;

    /** 链接分组 */
    @Excel(name = "链接分组")
    private String groupName;

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setLinkId(Long linkId) {
        this.linkId = linkId;
    }

    public Long getLinkId() {
        return linkId;
    }

    public void setLinkUrl(String linkUrl) {
        this.linkUrl = linkUrl;
    }

    public String getLinkUrl() {
        return linkUrl;
    }

    public void setLinkName(String linkName) {
        this.linkName = linkName;
    }

    public String getLinkName() {
        return linkName;
    }

    public void setLinkSuggest(String linkSuggest) {
        this.linkSuggest = linkSuggest;
    }

    public String getLinkSuggest() {
        return linkSuggest;
    }

    public void setGroupKey(String groupKey) {
        this.groupKey = groupKey;
    }

    public String getGroupKey() {
        return groupKey;
    }

    public void setLinkFavicon(String linkFavicon) {
        this.linkFavicon = linkFavicon;
    }

    public String getLinkFavicon() {
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
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE).append("linkId", getLinkId())
                .append("linkUrl", getLinkUrl()).append("linkName", getLinkName())
                .append("linkSuggest", getLinkSuggest()).append("groupKey", getGroupKey())
                .append("linkFavicon", getLinkFavicon()).append("visible", getVisible()).append("remark", getRemark())
                .append("createTime", getCreateTime()).append("updateTime", getUpdateTime())
                .append("updateBy", getUpdateBy()).append("createBy", getCreateBy()).append("groupName", getGroupName())
                .append("orderNum", getOrderNum()).append("openType", getOpenType()).toString();
    }
}
