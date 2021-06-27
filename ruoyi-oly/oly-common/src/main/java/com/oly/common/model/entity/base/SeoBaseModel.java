package com.oly.common.model.entity.base;

import com.ruoyi.common.annotation.Excel;

/**
 * Seo基类
 */
public class SeoBaseModel extends BaseModel {
    private static final long serialVersionUID = 1L;
	  /** 关键词 */
      @Excel(name = "关键词")
      private String keywords;
  
      /** 描述 */
      @Excel(name = "描述")
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
