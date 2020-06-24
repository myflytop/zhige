package com.ruoyi.blog.mould;

import java.util.List;

public class BlogConfig {
    //网站名
    private String title;
    //关键词
    private String keywords;
    //描述
    private String description;
    //网站logo
    private String logo;
    //网站ico
    private String ico;
    //主页
    private String index;
    //网站备案信息
    private String record;
    //联系方式逗号分隔
    private String contact;
    //网站创建者|团队|公司
    private String author;
    //创建时间
    private String webCreateTime;
    //网站介绍
    private String introduce;
    //其它信息
    private String otherMsg;
    //版本号
    private String version;

    public String getIndex() {
        return index;
    }

    public void setIndex(String index) {
        this.index = index;
    }

    public String getRecord() {
        return record;
    }

    public void setRecord(String record) {
        this.record = record;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getWebCreateTime() {
        return webCreateTime;
    }

    public void setWebCreateTime(String webCreateTime) {
        this.webCreateTime = webCreateTime;
    }

    public String getIntroduce() {
        return introduce;
    }
    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public String getOtherMsg() {
        return otherMsg;
    }

    public void setOtherMsg(String otherMsg) {
        this.otherMsg = otherMsg;
    }

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getIco() {
        return ico;
    }

    public void setIco(String ico) {
        this.ico = ico;
    }

    public BlogConfig(String title, String keywords, String description, String logo, String ico) {
        this.title = title;
        this.keywords = keywords;
        this.description = description;
        this.logo = logo;
        this.ico = ico;
    }
}
