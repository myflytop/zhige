package com.oly.cms.system.model.po;

import com.oly.common.model.entity.base.BaseModel;
import com.ruoyi.common.annotation.Excel;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 配置文件备份对象 oly_config_back
 * 
 * @author 止戈
 * @date 2021-04-04
 */
public class CmsConfigBack extends BaseModel {
    private static final long serialVersionUID = 1L;

    /** 备份组 */
    @Excel(name = "备份组")
    private String configGroup;

    /** 备份key */
    @Excel(name = "备份key")
    private String configKey;

    /** 备份参数 */
    @Excel(name = "备份参数")
    private String configValue;

    public void setConfigGroup(String configGroup) {
        this.configGroup = configGroup;
    }

    public String getConfigGroup() {
        return configGroup;
    }

    public void setConfigKey(String configKey) {
        this.configKey = configKey;
    }

    public String getConfigKey() {
        return configKey;
    }

    public void setConfigValue(String configValue) {
        this.configValue = configValue;
    }

    public String getConfigValue() {
        return configValue;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE).append("configGroup", getConfigGroup())
                .append("configKey", getConfigKey()).append("configValue", getConfigValue())
                .append("createBy", getCreateBy()).append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy()).append("updateTime", getUpdateTime()).append("remark", getRemark())
                .toString();
    }
}
