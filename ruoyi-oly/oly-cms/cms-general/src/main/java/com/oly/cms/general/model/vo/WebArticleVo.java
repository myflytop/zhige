package com.oly.cms.general.model.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.oly.cms.common.domain.entity.CmsArticleCount;

public class WebArticleVo extends CmsArticleCount {

    private static final long serialVersionUID = 653673311404721257L;

    /** 文章类型 */
    private Integer articleType;

    /** 顶置级别 */
    private Integer articleTop;

    /** 预览缩略图 */
    private String articleImg;

    /** 文章链接别名 */
    private String articleUrl;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    public Integer getArticleType() {
        return articleType;
    }

    public void setArticleType(Integer articleType) {
        this.articleType = articleType;
    }

    public Integer getArticleTop() {
        return articleTop;
    }

    public void setArticleTop(Integer articleTop) {
        this.articleTop = articleTop;
    }

    public String getArticleImg() {
        return articleImg;
    }

    public void setArticleImg(String articleImg) {
        this.articleImg = articleImg;
    }

    public String getArticleUrl() {
        return articleUrl;
    }

    public void setArticleUrl(String articleUrl) {
        this.articleUrl = articleUrl;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

}
