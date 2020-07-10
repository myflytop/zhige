package com.ruoyi.message.websocket.handler;

import com.ruoyi.message.websocket.authen.WebSocketUserAuthentication;
import org.apache.commons.lang.StringUtils;
import org.jboss.logging.Logger;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.DefaultHandshakeHandler;

import javax.servlet.http.HttpSession;
import java.security.Principal;
import java.util.Map;

/**
 * <设置认证用户信息>
 * <功能详细描述>
 * @author wzh
 * @version 2018-09-18 23:55
 * @see [相关类/方法] (可选)
 **/
public class MyPrincipalHandshakeHandler extends DefaultHandshakeHandler{

    private static final Logger log = Logger.getLogger(MyPrincipalHandshakeHandler.class);

    @Override
    protected Principal determineUser(ServerHttpRequest request, WebSocketHandler wsHandler, Map<String, Object> attributes) {

        HttpSession httpSession = getSession(request);
        // 获取登录的信息，就是controller 跳转页面存的信息，可以根据业务修改
        String user = (String)httpSession.getAttribute("loginName");

        if(StringUtils.isEmpty(user)){
            log.error("未登录系统，禁止登录websocket!");
            return null;
        }
        log.info(" MyDefaultHandshakeHandler login = " + user);
        return new WebSocketUserAuthentication(user);
    }

    private HttpSession getSession(ServerHttpRequest request) {
        if (request instanceof ServletServerHttpRequest) {
            ServletServerHttpRequest serverRequest = (ServletServerHttpRequest) request;
            return serverRequest.getServletRequest().getSession(false);
        }
        return null;
    }

}