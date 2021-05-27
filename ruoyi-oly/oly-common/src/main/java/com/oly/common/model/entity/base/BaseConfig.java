package com.oly.common.model.entity.base;

import com.ruoyi.common.annotation.Excel;

/**
 * BaseConfig
 */
public class BaseConfig extends BaseModel {
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
    
}
