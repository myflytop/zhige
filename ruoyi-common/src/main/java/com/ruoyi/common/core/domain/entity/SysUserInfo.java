package com.ruoyi.common.core.domain.entity;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.annotation.Excel;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 用户详细信息对象 sys_user_info
 * 
 * @author ZD
 * @date 2022-04-28
 */
public class SysUserInfo extends SysUser {
    private static final long serialVersionUID = 1L;

    /** 标签 */
    @Excel(name = "标签")
    private String tags;

    /** 爱好 */
    @Excel(name = "爱好")
    private String hobby;

    /** 位置 */
    @Excel(name = "位置")
    private String local;

    /** 介绍 */
    @Excel(name = "介绍")
    private String introduce;

    /** 教育 */
    @Excel(name = "教育")
    private String teach;

    /** 社交 */
    @Excel(name = "社交")
    private String contact;

    /** 联系 */
    @Excel(name = "联系")
    private String touch;

    /** 生日 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "生日", width = 30, dateFormat = "yyyy-MM-dd")
    private Date birthday;

    /** 更多展示 */
    @Excel(name = "更多展示")
    private String shows;

    public void setTags(String tags) {
        this.tags = tags;
    }

    public String getTags() {
        return tags;
    }

    public void setHobby(String hobby) {
        this.hobby = hobby;
    }

    public String getHobby() {
        return hobby;
    }

    public void setLocal(String local) {
        this.local = local;
    }

    public String getLocal() {
        return local;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setTeach(String teach) {
        this.teach = teach;
    }

    public String getTeach() {
        return teach;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getContact() {
        return contact;
    }

    public void setTouch(String touch) {
        this.touch = touch;
    }

    public String getTouch() {
        return touch;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setShows(String shows) {
        this.shows = shows;
    }

    public String getShows() {
        return shows;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE).append("userId", getUserId())
                .append("tags", getTags()).append("hobby", getHobby()).append("local", getLocal())
                .append("introduce", getIntroduce()).append("teach", getTeach()).append("contact", getContact())
                .append("touch", getTouch()).append("birthday", getBirthday()).append("shows", getShows()).toString();
    }
}
