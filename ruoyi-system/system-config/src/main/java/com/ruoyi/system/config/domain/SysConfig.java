package com.ruoyi.system.config.domain;

import javax.validation.constraints.*;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.annotation.Excel.ColumnType;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 参数配置表 sys_config
 * 
 * @author ruoyi
 */
public class SysConfig extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** 参数主键 */
    @Excel(name = "参数主键", cellType = ColumnType.NUMERIC)
    private Long configId;

    /** 参数名称 */
    @Excel(name = "参数名称")
    private String configName;

    /** 配置组 */
    @Excel(name = "配置组")
    private String configGroup;

    /** 参数键名 */
    @Excel(name = "参数键名")
    private String configKey;

    /** 参数键值 */
    @Excel(name = "参数键值")
    private String configValue;

    /** 配置类型 */
    @Excel(name = "配置类型")
    private Integer configType;

    /** 参数类型 */
    @Excel(name = "参数类型")
    private Integer configValueType;

    public Long getConfigId() {
        return configId;
    }

    public void setConfigId(Long configId) {
        this.configId = configId;
    }

    @NotBlank(message = "参数名称不能为空")
    @Size(min = 0, max = 100, message = "参数名称不能超过100个字符")
    public String getConfigName() {
        return configName;
    }

    public void setConfigName(String configName) {
        this.configName = configName;
    }

    @NotBlank(message = "参数键名长度不能为空")
    @Size(min = 0, max = 100, message = "参数键名长度不能超过100个字符")
    public String getConfigKey() {
        return configKey;
    }

    public void setConfigKey(String configKey) {
        this.configKey = configKey;
    }

    @NotBlank(message = "参数键值不能为空")
    @Size(min = 0, max = 500, message = "参数键值长度不能超过500个字符")
    public String getConfigValue() {
        return configValue;
    }

    public void setConfigValue(String configValue) {
        this.configValue = configValue;
    }

    public Integer getConfigType() {
        return configType;
    }

    public void setConfigType(Integer configType) {
        this.configType = configType;
    }

    @NotBlank(message = "配置组不能为空")
    @Size(min = 0, max = 16, message = "参数键值长度不能超过16个字符")
    public String getConfigGroup() {
        return configGroup;
    }

    public void setConfigGroup(String configGroup) {
        this.configGroup = configGroup;
    }

    public Integer getConfigValueType() {
        return configValueType;
    }

    public void setConfigValueType(Integer configValueType) {
        this.configValueType = configValueType;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE).append("configId", getConfigId())
                .append("configName", getConfigName()).append("configKey", getConfigKey())
                .append("configValue", getConfigValue()).append("configType", getConfigType())
                .append("configGroup", getConfigGroup()).append("configValueType", getConfigValueType())
                .append("createBy", getCreateBy()).append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy()).append("updateTime", getUpdateTime()).append("remark", getRemark())
                .toString();
    }
}
