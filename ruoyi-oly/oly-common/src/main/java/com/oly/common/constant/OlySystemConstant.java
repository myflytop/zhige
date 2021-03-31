package com.oly.common.constant;

import com.oly.common.utils.OlyFileUtils;

public class OlySystemConstant {

    // 工作目录名
    public final static String workName = ".ruoyi";

    // 工作目录
    public final static String workDir = OlyFileUtils.getPath(workName);

    // 备份目录
    public final static String backDir = OlyFileUtils.getPath(workDir, "backUp");

    // 本地存储文件地址
    public final static String uploadDir = OlyFileUtils.getPath(workDir, "upload");

    // 本地日志目录
    public final static String logsDir = OlyFileUtils.getPath(workDir, "logs");

    // 主题目录
    public final static String themeDir = OlyFileUtils.getPath(workDir, "templates", "themes");

    // 模板目录
    public final static String templateDir = OlyFileUtils.getPath(workDir, "template");

    public static String getUserHome() {
        return System.getProperty("user.home");
    }

}
