package com.ruoyi.message.websocket.model;

public class Message {

    private String content;

    private String createTime;

    private Long userId;

    private String userName;

    private Long fromUserId;

    private String fromUserName;

    public Message() {

    }

    public Message(String content, String createTime, Long userId, String userName, Long fromUserId, String fromUserName) {
        this.content = content;
        this.createTime = createTime;
        this.userId = userId;
        this.userName = userName;
        this.fromUserId = fromUserId;
        this.fromUserName = fromUserName;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setFromUserId(Long fromUserId) {
        this.fromUserId = fromUserId;
    }

    public void setFromUserName(String fromUserName) {
        this.fromUserName = fromUserName;
    }


    public String getContent() {
        return content;
    }

    public String getCreateTime() {
        return createTime;
    }

    public Long getUserId() {
        return userId;
    }

    public String getUserName() {
        return userName;
    }

    public Long getFromUserId() {
        return fromUserId;
    }

    public String getFromUserName() {
        return fromUserName;
    }
}
