package com.oly.template.domain.enums;

public enum TemplateTypeEnum {

    // 状态为menu为目录0
    MENU("menu", false), HTML("html", true), PDF("pdf", false);

    private String templateType = null;
    // 是否支持编辑
    private boolean supportEdit;

    TemplateTypeEnum(String templateType, boolean supportEdit) {
        this.templateType = templateType;
        this.supportEdit = supportEdit;
    }

    public String getTemplateType() {
        return templateType;
    }

    public boolean getSupportEdit() {
        return supportEdit;
    }

}
