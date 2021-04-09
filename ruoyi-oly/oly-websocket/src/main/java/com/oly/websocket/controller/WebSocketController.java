package com.oly.websocket.controller;

import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.ShiroUtils;
import com.ruoyi.framework.shiro.session.OnlineSessionDAO;
import com.ruoyi.system.domain.SysUserOnline;
import com.ruoyi.system.service.ISysUserOnlineService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <websocket测试用MVC控制器> <功能详细描述>
 * 
 * @author wzh
 * @version 2018-07-09 22:53
 * @see [相关类/方法] (可选)
 **/
@Controller
@RequestMapping("/oly/websocket")
public class WebSocketController {
     
   private String  prefix="oly/websocket";

   
    
   @Autowired
   private ISysUserOnlineService userOnlineService;

   @Autowired
   private OnlineSessionDAO onlineSessionDAO;
    @GetMapping
    public String websocket() {
        return prefix+ "/websocket";
    }

    /**
     * 建立连接
     */
    @GetMapping("/connect")
    @ResponseBody
    public AjaxResult connect(HttpSession session) {
        // 写入session
        session.setAttribute("loginName", session.getId());
        Map<String, Object> map = new HashMap<>();
        map.put("onlineUser", userOnlineService.selectUserOnlineList(null));
        map.put("groupIds", "[1,2]");
        map.put("topicIds", "[1,2]");
        map.put("loginName",ShiroUtils.getLoginName());
        map.put("session_id", session.getId());
        return AjaxResult.success(map);
    }

    public void listOnline() {
        
        List<SysUserOnline> userOnlines=userOnlineService.selectUserOnlineList(null);
    }

}