package com.ruoyi.common.enums;

/**
 * 文件储存目录
 */
public enum OlyStageRoot {

    // 备份目录
    BACK_DIR("backUp"),
    // 邮件目录
    MAIL_DIR("mail"),
    // 本地存储文件地址
    UPLOAD_DIR("upload"),
    // 云服务存储文件地址
    UPLOAD_YUN_DIR("upload"),
    // 本地日志目录
    LOGS_DIR("logs"),
    // 主题目录
    THEME_DIR("themes"),
    // 头像目录
    HEARD_DIR("avatar"),
    // 模板目录
    TEMPLATE_DIR("template"),
    // siteMap目录
    SITE_DIR("site");

    private String dir;

    OlyStageRoot(String dir) {
        this.dir = dir;
    }

    public String getDir() {
        return dir;
    }

}
