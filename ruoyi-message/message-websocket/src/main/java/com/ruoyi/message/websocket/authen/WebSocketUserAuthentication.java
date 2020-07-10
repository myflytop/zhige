package com.ruoyi.message.websocket.authen;


import java.security.Principal;

/**
 * <websocket登录连接对象>
 * <用于保存websocket连接过程中需要存储的业务参数>
 * @author wzh
 * @version 2018-08-26 23:30
 * @see [相关类/方法] (可选)
 **/
public class WebSocketUserAuthentication implements Principal {

    /**
     * 用户身份标识符
     */
    private String token;

    public WebSocketUserAuthentication(String token) {
        this.token = token;
    }

    public WebSocketUserAuthentication() {
    }

    /**
     * 获取用户登录令牌
     *
     * @return
     */
    @Override
    public String getName() {
        return token;
    }
}