package com.oly.cms.common.domain.vo;

import java.io.Serializable;

public class UserVo implements Serializable {

    private static final long serialVersionUID = 1L;

    private Long userId;

    private String avatar;

    private String userName;

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public UserVo(Long userId, String avatar, String userName) {
        this.userId = userId;
        this.avatar = avatar;
        this.userName = userName;
    }

}
