package com.ruoyi.cms.common.mould.base;

import com.ruoyi.common.annotation.Excel;

import java.util.Date;

public class BaseContact extends BaseModel {
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
    private Long handler;

    /**
     * 邮件
     */
    @Excel(name = "邮件")
    private String email;

    /**
     * 电话
     */
    @Excel(name = "电话")
    private String phone;

    /**
     * 其它联系方式
     */
    @Excel(name = "其它联系方式")
    private String otherContact;

    /**
     * 类型
     */
    @Excel(name = "类型")
    private Byte contactType;

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


    public String getUserCall() {
        return userCall;
    }

    public void setUserCall(String userCall) {
        this.userCall = userCall;
    }


    public static long getSerialVersionUID() {
        return serialVersionUID;
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

    public String getSubject() {
        return subject;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getContent() {
        return content;
    }

    public void setHandler(Long handler) {
        this.handler = handler;
    }

    public Long getHandler() {
        return handler;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmail() {
        return email;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPhone() {
        return phone;
    }

    public void setOtherContact(String otherContact) {
        this.otherContact = otherContact;
    }

    public String getOtherContact() {
        return otherContact;
    }

    public void setContactType(Byte contactType) {
        this.contactType = contactType;
    }

    public Byte getContactType() {
        return contactType;
    }

    public void setHandleResult(String handleResult) {
        this.handleResult = handleResult;
    }

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
        sb.append(", phone='").append(phone).append('\'');
        sb.append(", otherContact='").append(otherContact).append('\'');
        sb.append(", contactType=").append(contactType);
        sb.append(", handleResult='").append(handleResult).append('\'');
        sb.append(", userCall='").append(userCall).append('\'');
        sb.append(", handleTime=").append(handleTime);
        sb.append('}');
        return sb.toString();
    }
}
