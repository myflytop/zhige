package com.ruoyi.message.websocket.model;

import java.util.List;

public class Group  {
    private Long GroupId;
    private String GroupName;
    private  List<Message> messages ;

    public Group() {
    }

    public Group(Long groupId, String groupName, List<Message> messages) {
        GroupId = groupId;
        GroupName = groupName;
        this.messages = messages;
    }

    public Long getGroupId() {
        return GroupId;
    }

    public void setGroupId(Long groupId) {
        GroupId = groupId;
    }

    public String getGroupName() {
        return GroupName;
    }

    public void setGroupName(String groupName) {
        GroupName = groupName;
    }

    public List<Message> getMessages() {
        return messages;
    }

    public void setMessages(List<Message> messages) {
        this.messages = messages;
    }
}
