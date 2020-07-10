package com.ruoyi.message.websocket;

import com.ruoyi.message.websocket.model.Group;
import com.ruoyi.message.websocket.model.Message;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class MessageUtils {
    private static List<Message> friendMassages;
    private static List<Message> toMeMassages;
    private static Group groupMassages;
    private static Group topicMassages;
    private static Map<Long,List<Message>> friendMessagesMap;
    private static Map<Long,List<Message>> toMeMessagesMap;
    private static Map<Long, Group> groupMessagesMap;
    private static Map<Long, Group> topicMessagesMap;

    static {
        friendMassages=new ArrayList<>();
        friendMassages.add(new Message("你好啊","2020-3-16 12.15",2L,"ry",1L,"admin"));
        friendMessagesMap.put(1L,friendMassages);
        friendMassages.add(new Message("你好啊","2020-3-16 12.15",2L,"ry",1L,"admin"));
        friendMessagesMap.put(2L,friendMassages);
        toMeMassages=new ArrayList<>();
        toMeMassages.add(new Message("你好啊","2020-3-16 12.15",null,null,1L,"admin"));
        groupMassages=new Group();
        groupMassages.setGroupId(1L);
        groupMassages.setGroupName("天天动听");
        groupMassages.setMessages(new ArrayList<Message>(){{add(new Message("你好啊","2020-3-16 12.15",null,null,1L,"admin"));
        add(new Message("你好","2020-3-16 12.15",null,null,2L,"ry"));}});
        topicMassages=new Group();
        topicMassages.setGroupId(2L);
        topicMassages.setGroupName("华南一区");
        topicMassages.setMessages(new ArrayList<Message>(){{add(new Message("你好啊","2020-3-16 12.15",null,null,1L,"admin"));}});

    }

    public static List<Message> getFriendMassages() {
        return friendMassages;
    }

    public static void setFriendMassages(List<Message> friendMassages) {
        MessageUtils.friendMassages = friendMassages;
    }

    public static List<Message> getToMeMassages() {
        return toMeMassages;
    }

    public static void setToMeMassages(List<Message> toMeMassages) {
        MessageUtils.toMeMassages = toMeMassages;
    }

    public static Group getGroupMassages() {
        return groupMassages;
    }

    public static void setGroupMassages(Group groupMassages) {
        MessageUtils.groupMassages = groupMassages;
    }

    public static Group getTopicMassages() {
        return topicMassages;
    }

    public static void setTopicMassages(Group topicMassages) {
        MessageUtils.topicMassages = topicMassages;
    }









}
