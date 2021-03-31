package com.oly.common.model.entity.base;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * 基类包含创建者,更新者Id 创建时间,更新时间 备注,状态,提示,权限字符
 */
public class BaseModel implements Serializable {

    private static final long serialVersionUID = 1L;

    /** 创建者 */
    private Long createBy;

    /** 提示 */
    private String tips;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    /** 更新者 最后更新人 */
    private Long updateBy;

    /** 更新时间 最后更新时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;

    /** 状态 */
    private Byte visible;

    /** 备注 */
    private String remark;

    /** 搜索值 */
    private String searchValue;

    /** 权限字符串 */
    private String perms;

    private Long orderNum;

    /** 请求参数 */
    private Map<String, Object> params;

    public Byte getVisible() {
        return visible;
    }

    public void setVisible(Byte visible) {
        this.visible = visible;
    }

    public String getPerms() {
        return perms;
    }

    public void setPerms(String perms) {
        this.perms = perms;
    }

    public String getTips() {
        return this.tips;
    }

    public void setTips(String tips) {
        this.tips = tips;
    }

    public Long getCreateBy() {
        return createBy;
    }

    public void setCreateBy(Long createBy) {
        this.createBy = createBy;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Long getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(Long updateBy) {
        this.updateBy = updateBy;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getSearchValue() {
        return searchValue;
    }

    public void setSearchValue(String searchValue) {
        this.searchValue = searchValue;
    }

    public Map<String, Object> getParams() {
        if (params == null) {
            params = new HashMap<String, Object>();
        }
        return params;
    }

    public void setParams(Map<String, Object> params) {
        this.params = params;
    }

    public Long getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(Long orderNum) {
        this.orderNum = orderNum;
    }

}
