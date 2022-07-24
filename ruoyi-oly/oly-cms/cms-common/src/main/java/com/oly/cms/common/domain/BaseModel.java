package com.oly.cms.common.domain;

import javax.validation.constraints.NotNull;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import org.hibernate.validator.constraints.Length;

/**
 * 基类包含创建者,更新者Id 创建时间,更新时间 备注,状态,权限字符
 * 
 * @author zg
 */
public class BaseModel extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /** 状态 */
    @Excel(name = "状态")
    private Integer visible;

    /** 权限字符串 */
    @Excel(name = "权限")
    private String perms;
    /* 排序 */
    @Excel(name = "排序")
    private Long orderNum;

    @Length(min = 0, max = 32, message = "权限字符最大不超过32")
    public String getPerms() {
        return perms;
    }

    public void setPerms(String perms) {
        this.perms = perms;
    }

    @NotNull(message = "状态不能为空")
    public Integer getVisible() {
        return visible;
    }

    public void setVisible(Integer visible) {
        this.visible = visible;
    }

    @NotNull(message = "排序不能为空")
    public Long getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(Long orderNum) {
        this.orderNum = orderNum;
    }

}
