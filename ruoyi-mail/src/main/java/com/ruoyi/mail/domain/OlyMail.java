package com.ruoyi.mail.domain;

import java.util.Date;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 邮件对象 oly_mail
 * 
 * @author hush
 * @date 2021-03-06
 */
public class OlyMail extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long mailId;

    /** 发送者邮箱 */
    @Excel(name = "发送者邮箱")
    private String fromMail;

    /** 接收者邮箱 */
    @Excel(name = "接收者邮箱")
    private String toMail;

    /** 主题 */
    @Excel(name = "主题")
    private String subject;

    /** 内容 */
    @Excel(name = "内容")
    private String content;

    /** 邮件类型 文本 附件 模板 */
    @Excel(name = "邮件类型 文本 附件 模板")
    private Integer mailType;

    /** 发送时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "发送时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date sendTime;

    /** 抄送用户 */
    @Excel(name = "抄送用户")
    private String copyTo;

    /** 邮件用途 */
    @Excel(name = "邮件用途")
    private Integer mailUsed;

    /** 密送用户 */
    @Excel(name = "密送用户")
    private String bccTo;

    /** 附件keys */
    @Excel(name = "附件keys")
    private String attachKeys;

    /** 邮件状态 0.未发送 1.已发送 */
    @Excel(name = "邮件状态  0.未发送 1.已发送")
    private Integer visible;

    /**
     * @return the visible
     */
    public Integer getVisible() {
        return visible;
    }

    /**
     * @param visible the visible to set
     */
    public void setVisible(Integer visible) {
        this.visible = visible;
    }

    public void setMailId(Long mailId) {
        this.mailId = mailId;
    }

    public Long getMailId() {
        return mailId;
    }

    public void setFromMail(String fromMail) {
        this.fromMail = fromMail;
    }

    public String getFromMail() {
        return fromMail;
    }

    public void setToMail(String toMail) {
        this.toMail = toMail;
    }

    @Email(message = "邮箱格式错误")
    public String getToMail() {
        return toMail;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    @NotBlank(message = "主题不能为空")
    @Size(min = 0, max = 100, message = "主题名称不能超过128个字符")
    public String getSubject() {
        return subject;
    }

    @NotBlank(message = "内容不能为空")
    @Size(min = 20, message = "内容最小为20个字符")
    public void setContent(String content) {
        this.content = content;
    }

    public String getContent() {
        return content;
    }

    public void setMailType(Integer mailType) {
        this.mailType = mailType;
    }

    public Integer getMailType() {
        return mailType;
    }

    public void setSendTime(Date sendTime) {
        this.sendTime = sendTime;
    }

    public Date getSendTime() {
        return sendTime;
    }

    public void setCopyTo(String copyTo) {
        this.copyTo = copyTo;
    }

    public String getCopyTo() {
        return copyTo;
    }

    public void setMailUsed(Integer mailUsed) {
        this.mailUsed = mailUsed;
    }

    public Integer getMailUsed() {
        return mailUsed;
    }

    public void setBccTo(String bccTo) {
        this.bccTo = bccTo;
    }

    public String getBccTo() {
        return bccTo;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE).append("mailId", getMailId())
                .append("fromMail", getFromMail()).append("createBy", getCreateBy())
                .append("createTime", getCreateTime()).append("toMail", getToMail()).append("subject", getSubject())
                .append("content", getContent()).append("mailType", getMailType()).append("sendTime", getSendTime())
                .append("copyTo", getCopyTo()).append("remark", getRemark()).append("mailUsed", getMailUsed())
                .append("bccTo", getBccTo()).append("visible", getVisible()).append("attachKeys", getAttachKeys())
                .toString();
    }

    public String getAttachKeys() {
        return attachKeys;
    }

    public void setAttachKeys(String attachKeys) {
        this.attachKeys = attachKeys;
    }
}
