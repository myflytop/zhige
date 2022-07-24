package com.ruoyi.common.enums;

import java.util.ArrayList;
import java.util.List;

public enum SysConfigGroups {
    SYS_COMMON("sysCommon"), SYS_LOGIN("sysLogin"), SYS_INDEX("sysIndex"), SYS_USER("sysUser"), OSS_CONFIG("ossConfig"),
    MAIL_CONFIG("mailConfig"), CMS_CONFIG("cmsConfig"), COMMENT_CONFIG("commentConfig"), THEME_CONFIG("themeConfig");

    private String value;

    SysConfigGroups(String value) {
        this.value = value;
    }

    /**
     * @return the value
     */
    public String getValue() {
        return value;
    }

    public static List<String> getValues() {
        SysConfigGroups[] ss = SysConfigGroups.values();
        List<String> rv = new ArrayList<String>();
        for (SysConfigGroups group : ss) {
            rv.add(group.getValue());
        }
        return rv;
    }

}
