package com.ruoyi.message.mail.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.util.Date;

/**
 * 邮件记录对象 msg_email
 * 
 * @author ruoyi
 * @date 2020-03-17
 */
public class MsgEmail extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long mailId;

    /** 发送者邮箱 */
    @Excel(name = "发送者邮箱")
    private String fromEmail;

    /** 接收者邮箱 */
    @Excel(name = "接收者邮箱")
    private String toEmail;

    /** 主题 */
    @Excel(name = "主题")
    private String subject;

    /** 内容 */
    @Excel(name = "内容")
    private String content;

    /** 邮件类型 */
    @Excel(name = "邮件类型")
    private Integer emailType;

    /** 发送时间 */
    @Excel(name = "发送时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date sendTime;

    /** 抄送用户 */
    @Excel(name = "抄送用户")
    private String copyTo;

    public void setBccTo(String bccTo) {
        this.bccTo = bccTo;
    }

    public String getBccTo() {
        return bccTo;
    }

    /** 密送用户 */
    @Excel(name = "密送用户")
    private String bccTo;

    /** 邮件用途 */
    @Excel(name = "邮件用途")
    private Integer emailUse;

    public void setMailId(Long mailId) 
    {
        this.mailId = mailId;
    }

    public Long getMailId() 
    {
        return mailId;
    }
    public void setFromEmail(String fromEmail) 
    {
        this.fromEmail = fromEmail;
    }

    public String getFromEmail() 
    {
        return fromEmail;
    }
    public void setToEmail(String toEmail) 
    {
        this.toEmail = toEmail;
    }

    public String getToEmail() 
    {
        return toEmail;
    }
    public void setSubject(String subject) 
    {
        this.subject = subject;
    }

    public String getSubject() 
    {
        return subject;
    }
    public void setContent(String content) 
    {
        this.content = content;
    }

    public String getContent() 
    {
        return content;
    }
    public void setEmailType(Integer emailType) 
    {
        this.emailType = emailType;
    }

    public Integer getEmailType() 
    {
        return emailType;
    }
    public void setSendTime(Date sendTime) 
    {
        this.sendTime = sendTime;
    }

    public Date getSendTime() 
    {
        return sendTime;
    }
    public void setCopyTo(String copyTo) 
    {
        this.copyTo = copyTo;
    }

    public String getCopyTo() 
    {
        return copyTo;
    }
    public void setEmailUse(Integer emailUse) 
    {
        this.emailUse = emailUse;
    }

    public Integer getEmailUse() 
    {
        return emailUse;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("mailId", getMailId())
            .append("fromEmail", getFromEmail())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("toEmail", getToEmail())
            .append("subject", getSubject())
            .append("content", getContent())
            .append("emailType", getEmailType())
            .append("sendTime", getSendTime())
            .append("copyTo", getCopyTo())
            .append("remark", getRemark())
            .append("emailUse", getEmailUse())
                .append("bccTo", getBccTo())
            .toString();
    }
}
