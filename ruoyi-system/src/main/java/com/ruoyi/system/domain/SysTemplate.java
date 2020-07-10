package com.ruoyi.system.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 数据模板对象 sys_template
 * 
 * @author ruoyi
 * @date 2020-03-22
 */
public class SysTemplate extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 模板id */
    @Excel(name = "模板ID")
    private Long templateId;

    /** 模板名 */
    @Excel(name = "模板名")
    private String mouldName;

    /** 是否内置 */
    @Excel(name = "是否内置")
    private Integer built;

    /** 模板 */
    @Excel(name = "模板")
    private String templateHtml;

    /** 模板数据 */
    @Excel(name = "模板数据")
    private String templateData;

    /** 状态 */
    @Excel(name = "状态")
    private Integer visible;

    /** 模板用途 */
    @Excel(name = "模板用途")
    private Byte templateUsed;

    public void setTemplateId(Long templateId)
    {
        this.templateId = templateId;
    }

    public Long getTemplateId()
    {
        return templateId;
    }
    public void setMouldName(String mouldName)
    {
        this.mouldName = mouldName;
    }

    public String getMouldName()
    {
        return mouldName;
    }
    public void setBuilt(Integer built)
    {
        this.built = built;
    }

    public Integer getBuilt()
    {
        return built;
    }
    public void setTemplateHtml(String templateHtml)
    {
        this.templateHtml = templateHtml;
    }

    public String getTemplateHtml()
    {
        return templateHtml;
    }
    public void setTemplateData(String templateData)
    {

        this.templateData = templateData;
    }

    public String getTemplateData()
    {
        return templateData;
    }
    public void setVisible(Integer visible)
    {
        this.visible = visible;
    }

    public Integer getVisible()
    {
        return visible;
    }
    public void setTemplateUsed(Byte templateUsed)
    {
        this.templateUsed = templateUsed;
    }

    public Byte getTemplateUsed()
    {
        return templateUsed;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("templateId", getTemplateId())
            .append("mouldName", getMouldName())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .append("built", getBuilt())
            .append("templateHtml", getTemplateHtml())
            .append("templateData", getTemplateData())
            .append("visible", getVisible())
            .append("templateUsed", getTemplateUsed())
            .toString();
    }
}
