package com.ruoyi.cms.common.mould.base;

public class SeoBaseModel extends BaseModel {
    private static final long serialVersionUID = 1L;
    private String keywords;
    private String description;
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



}
