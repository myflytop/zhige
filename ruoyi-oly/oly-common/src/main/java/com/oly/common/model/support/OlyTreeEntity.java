package com.oly.common.model.support;

import com.oly.common.model.entity.base.BaseModel;

/**
 * OlyTree基类
 * 
 * @author 止戈
 */
public class OlyTreeEntity extends BaseModel {
    private static final long serialVersionUID = 1L;
    /** 父菜单ID */
    private Long parentId;

    /** 祖级列表 */
    private String ancestors;

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public String getAncestors() {
        return ancestors;
    }

    public void setAncestors(String ancestors) {
        this.ancestors = ancestors;
    }
}