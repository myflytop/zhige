package com.ruoyi.message.websocket.controller;

import com.ruoyi.common.core.domain.AjaxResult;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;


/**
 * <websocket测试用MVC控制器>
 * <功能详细描述>
 * @author wzh
 * @version 2018-07-09 22:53
        * @see [相关类/方法] (可选)
        **/
@Controller
@RequestMapping
public class WebSocketController {
    // 跳转stomp websocket 页面
    @RequestMapping(method = RequestMethod.GET)
    public String toStompWebSocket(HttpSession session, HttpServletRequest request, Model model)
    {
        // 这里封装一个登录的用户组参数，模拟进入通讯后的简单初始化
        model.addAttribute("groupId","user_groupId");
        model.addAttribute("session_id",session.getId());
        System.out.println("跳转：" + session.getId());
        //写入session
        session.setAttribute("loginName",session.getId());
        return "/index";
    }
    @GetMapping("/message/message")
    public String message(){
        return "/message/message";
    }


    @GetMapping("/message/connect")
    @ResponseBody
    public AjaxResult connect(HttpSession session){
        //写入session
       session.setAttribute("loginName",session.getId());
        Map<String,String> map=new HashMap<>();
        map.put("groupIds","[1,2]");
        map.put("topicIds","[1,2]");
        map.put("session_id",session.getId());
        return AjaxResult.success(map);
    }

    @GetMapping("/message/toMeRecord/{id}")
    @ResponseBody
    public AjaxResult toMeRecord(@PathVariable("id")Long id){
       return null;
    }
    @GetMapping("/message/toGroupRecord/{id}")
    @ResponseBody
    public AjaxResult toGroupRecord(@PathVariable("id")Long id){
        return null;
    }

    @GetMapping("/message/toTopicRecord/{id}")
    @ResponseBody
    public AjaxResult toTopicRecord(@PathVariable("id")Long id){
        return null;
    }

    @GetMapping("/message/toFriendRecord{id}")
    @ResponseBody
    public AjaxResult toFriendRecord(@PathVariable("id")Long id){
        return null;
    }
}