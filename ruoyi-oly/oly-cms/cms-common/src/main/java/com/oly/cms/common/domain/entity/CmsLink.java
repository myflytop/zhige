package com.oly.cms.common.domain.entity;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import com.oly.cms.common.domain.BaseModel;
import com.ruoyi.common.annotation.Excel;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.hibernate.validator.constraints.Length;

public class CmsLink extends BaseModel {
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

    /** 链接LOGO */
    @Excel(name = "链接LOGO")
    private String linkFavicon;

    /** 打开方式 */
    @Excel(name = "打开方式")
    private Integer openType;

    /** 链接分组 */
    @Excel(name = "链接分组")
    private String groupName;

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    @NotBlank(message = "分组名不能为空")
    @Length(min = 2, max = 8, message = "分组名长度限制2到8个字符")
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

    @NotBlank(message = "链接名不能为空")
    @Length(min = 2, max = 8, message = "链接名长度仅允许2-8个字符")
    public String getLinkName() {
        return linkName;
    }

    public void setLinkSuggest(String linkSuggest) {
        this.linkSuggest = linkSuggest;
    }

    @Length(min = 0, max = 256, message = "建议长度最大256个字符")
    public String getLinkSuggest() {
        return linkSuggest;
    }

    public void setLinkFavicon(String linkFavicon) {
        this.linkFavicon = linkFavicon;
    }

    public String getLinkFavicon() {
        return linkFavicon;
    }

    @NotNull(message = "打开方式不能为空")
    public Integer getOpenType() {
        return openType;
    }

    public void setOpenType(Integer openType) {
        this.openType = openType;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE).append("linkId", getLinkId())
                .append("linkUrl", getLinkUrl()).append("linkName", getLinkName())
                .append("linkSuggest", getLinkSuggest()).append("linkFavicon", getLinkFavicon())
                .append("visible", getVisible()).append("remark", getRemark()).append("createTime", getCreateTime())
                .append("updateTime", getUpdateTime()).append("updateBy", getUpdateBy())
                .append("createBy", getCreateBy()).append("groupName", getGroupName()).append("orderNum", getOrderNum())
                .append("openType", getOpenType()).toString();
    }
}
