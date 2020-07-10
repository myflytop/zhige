package com.ruoyi.cms.common.mould.base;

public class BaseTag extends SeoBaseModel {
    private static final long serialVersionUID = 1L;
    //标签id
    private Long tagId;
    //标签名
    private String tagName;
    //标签链接
    private String tagUrl;
    //标签图标(可以是图片地址)
    private String tagIco;

    public String getTagIco() {

        return tagIco;
    }

    public void setTagIco(String tagIco)
    {
        this.tagIco = tagIco;
    }

    public void setTagId(Long tagId) {
        this.tagId = tagId;
    }

    public void setTagName(String tagName) {
        this.tagName = tagName;
    }

    public void setTagUrl(String tagUrl) {
        this.tagUrl = tagUrl;
    }

    public Long getTagId() {
        return tagId;
    }

    public String getTagName() {
        return tagName;
    }

    public String getTagUrl() {
        return tagUrl;
    }

}
