package com.oly.template.domain;

import com.oly.common.model.support.OlyTreeEntity;
import com.ruoyi.common.annotation.Excel;

/**
 * 
 * 模板模型对象 oly_template 模板保存到本地
 * 
 * @author 止戈
 * @date 2020-12-20
 */
public class OlyTemplate extends OlyTreeEntity {
    private static final long serialVersionUID = 1L;

    /** 模板Id */
    private Long templateId;

    /** 模板名 */
    @Excel(name = "模板名")
    private String templateName;

    /** 是否内置 */
    @Excel(name = "是否内置")
    private Byte built;

    /** 权限字符 */
    @Excel(name = "权限字符")
    private String perms;

    /** 模板状态 启用 停止 */
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

    public void setTemplateId(Long templateId) {
        this.templateId = templateId;
    }

    public Long getTemplateId() {
        return templateId;
    }

    public void setTemplateName(String templateName) {
        this.templateName = templateName;
    }

    public String getTemplateName() {
        return templateName;
    }

    public void setBuilt(Byte built) {
        this.built = built;
    }

    public Byte getBuilt() {
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
