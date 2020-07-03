package com.ruoyi.cms.system.model.vo;

import java.util.Arrays;

import com.ruoyi.cms.system.model.po.CmsArticle;

public class ArticleVo extends CmsArticle {
	private static final long serialVersionUID = 1L;
	//标签
    private  Integer[] tags;
    //分类
    private  Integer[] cats;
    //用于查询
    private Long catId;
    //catName
    private String catName;
	public  Integer[] getTags() {
		return tags;
	}
	public void setTags( Integer[] tags) {
		this.tags = tags;
	}
	public  Integer[] getCats() {
		return cats;
	}
	public void setCats( Integer[] cats) {
		this.cats = cats;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ArticleVo [tags=");
		builder.append(Arrays.toString(tags));
		builder.append(", cats=");
		builder.append(Arrays.toString(cats));
		builder.append(", getArticleTitle()=");
		builder.append(getArticleTitle());
		builder.append(", getArticleType()=");
		builder.append(getArticleType());
		builder.append(", getArticleBuild()=");
		builder.append(getArticleBuild());
		builder.append(", getArticleTop()=");
		builder.append(getArticleTop());
		builder.append(", getArticleImg()=");
		builder.append(getArticleImg());
		builder.append(", getArticleSummary()=");
		builder.append(getArticleSummary());
		builder.append(", getVisible()=");
		builder.append(getVisible());
		builder.append(", getAllowComment()=");
		builder.append(getAllowComment());
		builder.append(", getKeyword()=");
		builder.append(getKeywords());
		builder.append(", getArticleContent()=");
		builder.append(getArticleContent());
		builder.append(", getReprintUrl()=");
		builder.append(getReprintUrl());
		builder.append(", getArticleId()=");
		builder.append(getArticleId());
		builder.append(", getArticleUrl()=");
		builder.append(getArticleUrl());
		builder.append(", getCreateBy()=");
		builder.append(getCreateBy());
		builder.append(", getCreateTime()=");
		builder.append(getCreateTime());
		builder.append(", getUpdateBy()=");
		builder.append(getUpdateBy());
		builder.append(", getUpdateTime()=");
		builder.append(getUpdateTime());
		builder.append(", getParams()=");
		builder.append(getParams());
		builder.append(", catId=");
		builder.append(catId);
		builder.append(", catName=");
		builder.append(catName);
		builder.append("]");
		return builder.toString();
	}
	public Long getCatId() {
		return catId;
	}
	public void setCatId(Long catId) {
		this.catId = catId;
	}
	public String getCatName() {
		return catName;
	}
	public void setCatName(String catName) {
		this.catName = catName;
	}
    
   

}
