package com.oly.cms.common.domain.entity;

import com.oly.cms.common.domain.BaseModel;
import com.ruoyi.common.annotation.Excel;

import org.hibernate.validator.constraints.Length;

import java.util.Date;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

/**
 * 用户反馈联系表
 */
public class CmsContact extends BaseModel {
    private static final long serialVersionUID = 1L;

    /**
     * 反馈id
     */
    private Long contactId;

    /**
     * 主题
     */
    @Excel(name = "主题")
    private String subject;

    /**
     * 内容
     */
    @Excel(name = "内容")
    private String content;

    /**
     * 处理人
     */
    @Excel(name = "处理人")
    private String handler;

    /**
     * 邮件
     */
    @Excel(name = "邮件")
    private String email;

    /**
     * 联系方式
     */
    @Excel(name = "联系方式")
    private String touch;

    /**
     * 类型
     */
    @Excel(name = "类型")
    private Integer contactType;
    /**
     * 结果
     */
    @Excel(name = "结果")
    private String handleResult;

    @Excel(name = "称呼")
    private String userCall;

    /**
     * 处理时间
     */
    @Excel(name = "处理时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date handleTime;

    /**
     * @return the touch
     */
    public String getTouch() {
        return touch;
    }

    /**
     * @param touch the touch to set
     */
    public void setTouch(String touch) {
        this.touch = touch;
    }

    @Length(min = 0, max = 16, message = "用户称呼限制16个字符")
    public String getUserCall() {
        return userCall;
    }

    public void setUserCall(String userCall) {
        this.userCall = userCall;
    }

    public void setContactId(Long contactId) {
        this.contactId = contactId;
    }

    public Long getContactId() {
        return contactId;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    @NotBlank(message = "主题不能为空")
    @Length(min = 6, max = 32, message = "主题名限制6到32个字符")
    public String getSubject() {
        return subject;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Length(min = 6, max = 512, message = "菜单名限制6到1024个字符")
    public String getContent() {
        return content;
    }

    public void setHandler(String handler) {
        this.handler = handler;
    }

    public String getHandler() {
        return handler;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Email(message = "邮件账号必须为邮件")
    @Length(min = 0, max = 64, message = "邮件账号长度限制64个字符")
    public String getEmail() {
        return email;
    }

    public void setContactType(Integer contactType) {
        this.contactType = contactType;
    }

    @NotNull(message = "反馈类型不能为空")
    public Integer getContactType() {
        return contactType;
    }

    public void setHandleResult(String handleResult) {
        this.handleResult = handleResult;
    }

    @Length(min = 0, max = 1024, message = "处理说明长度限制1024个字符")
    public String getHandleResult() {
        return handleResult;
    }

    public void setHandleTime(Date handleTime) {
        this.handleTime = handleTime;
    }

    public Date getHandleTime() {
        return handleTime;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("CmsContact{");
        sb.append("contactId=").append(contactId);
        sb.append(", subject='").append(subject).append('\'');
        sb.append(", content='").append(content).append('\'');
        sb.append(", handler=").append(handler);
        sb.append(", email='").append(email).append('\'');
        sb.append(", touch='").append(touch).append('\'');
        sb.append(", contactType=").append(contactType);
        sb.append(", handleResult='").append(handleResult).append('\'');
        sb.append(", userCall='").append(userCall).append('\'');
        sb.append(", handleTime=").append(handleTime);
        sb.append(", orderNum=").append(getOrderNum());
        sb.append('}');
        return sb.toString();
    }
}
