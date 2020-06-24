package com.ruoyi.blog.mould;

import java.util.Date;

public class BlogContact {


    /** 创建者 */
    private Long createBy;

    /** 处理者 */
    private Long handler;

    private Date createTime;

    /** 备注 */
    private String remark;
    /** 反馈id */
    private Long contactId;

    /** 主题 */
    private String subject;

    /** 内容 */
    private String content;

    /** 邮件 */
    private String email;

    /** 电话 */
    private String phone;

    /** 状态 */
    private Integer visible;

    /** 其它联系方式 */
    private String otherContact;


    /** 类型 */
    private Integer contactType;

    /** 处理时间 */
    private Date handleTime;
    /**处理结果 */
    private String handleResult;

    private String userCall;

    public String getUserCall() {
        return userCall;
    }

    public void setUserCall(String userCall) {
        this.userCall = userCall;
    }

    public String getHandleResult() {
        return handleResult;
    }

    public void setHandleResult(String handleResult) {
        this.handleResult = handleResult;
    }



    public Long getCreateBy() {
        return createBy;
    }

    public void setCreateBy(Long createBy) {
        this.createBy = createBy;
    }

    public Long getHandler() {
        return handler;
    }

    public void setHandler(Long handler) {
        this.handler = handler;
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

    public Long getContactId() {
        return contactId;
    }

    public void setContactId(Long contactId) {
        this.contactId = contactId;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Integer getVisible() {
        return visible;
    }

    public void setVisible(Integer visible) {
        this.visible = visible;
    }

    public String getOtherContact() {
        return otherContact;
    }

    public void setOtherContact(String otherContact) {
        this.otherContact = otherContact;
    }

    public Integer getContactType() {
        return contactType;
    }

    public void setContactType(Integer contactType) {
        this.contactType = contactType;
    }

    public Date getHandleTime() {
        return handleTime;
    }

    public void setHandleTime(Date handleTime) {
        this.handleTime = handleTime;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("BlogContact{");
        sb.append("createBy=").append(createBy);
        sb.append(", handler=").append(handler);
        sb.append(", createTime=").append(createTime);
        sb.append(", remark='").append(remark).append('\'');
        sb.append(", contactId=").append(contactId);
        sb.append(", subject='").append(subject).append('\'');
        sb.append(", content='").append(content).append('\'');
        sb.append(", email='").append(email).append('\'');
        sb.append(", phone='").append(phone).append('\'');
        sb.append(", visible=").append(visible);
        sb.append(", otherContact='").append(otherContact).append('\'');
        sb.append(", contactType=").append(contactType);
        sb.append(", handleTime=").append(handleTime);
        sb.append(", handleResult='").append(handleResult).append('\'');
        sb.append(", userCall='").append(userCall).append('\'');
        sb.append('}');
        return sb.toString();
    }
}
