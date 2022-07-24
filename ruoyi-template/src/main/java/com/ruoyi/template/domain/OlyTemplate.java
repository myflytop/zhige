package com.ruoyi.template.domain;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.TreeEntity;

import org.hibernate.validator.constraints.Length;

/**
 * 
 * 模板模型对象 oly_template 模板保存到本地
 * 
 * @author 止戈
 * @date 2020-12-20
 */
public class OlyTemplate extends TreeEntity {
    private static final long serialVersionUID = 1L;

    /** 模板Id */
    private Long templateId;

    /** 模板名 */
    @Excel(name = "模板名")
    private String templateName;

    /** 是否内置 */
    @Excel(name = "是否内置")
    private Integer built;

    /** 权限字符 */
    @Excel(name = "权限字符")
    private String perms;

    /** 模板状态 启用 禁用 */
    @Excel(name = "模板状态")
    private Integer visible;

    /** 类型 */
    @Excel(name = "类型")
    private Integer templateType;

    /** 模板路径 */
    @Excel(name = "模板路径")
    private String templateUrl;

    /** 所需参数 */
    @Excel(name = "所需参数")
    private String templateParam;

    @NotNull(message = "状态不能为空")
    public Integer getVisible() {
        return visible;
    }

    public void setVisible(Integer visible) {
        this.visible = visible;
    }

    public void setTemplateId(Long templateId) {
        this.templateId = templateId;
    }

    public Long getTemplateId() {
        return templateId;
    }

    public void setTemplateName(String templateName) {
        this.templateName = templateName;
    }

    @NotBlank(message = "标题不能为空")
    @Length(min = 2, max = 16, message = "标题限制2到16个字符")
    public String getTemplateName() {
        return templateName;
    }

    public void setBuilt(Integer built) {
        this.built = built;
    }

    @NotNull(message = "内置类型不能为空")
    public Integer getBuilt() {
        return built;
    }

    public void setPerms(String perms) {
        this.perms = perms;
    }

    public String getPerms() {
        return perms;
    }

    public void setTemplateType(Integer templateType) {
        this.templateType = templateType;
    }

    @NotNull(message = "类型不能为空")
    public Integer getTemplateType() {
        return templateType;
    }

    public void setTemplateUrl(String templateUrl) {
        this.templateUrl = templateUrl;
    }

    public String getTemplateUrl() {
        return templateUrl;
    }

    public String getTemplateParam() {
        return templateParam;
    }

    public void setTemplateParam(String templateParam) {
        this.templateParam = templateParam;
    }
}
