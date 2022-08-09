package com.ruoyi.common.enums;

import java.util.ArrayList;
import java.util.List;

public enum OperateTitle {
    DEFAULT(""), SYS_GEN("代码生成"), SYS_LOGIN("登陆记录"), SYS_QUARTZ("定时任务"), SYS_QUARTZ_LOG("调度日志"), SYS_TABLE("表管理"),
    SYS_CONFIG("参数管理"), SYS_DEPT("部门管理"), SYS_DICT_TYPE("字典类型"), SYS_DICT_DATA("字典数据"), SYS_MENU("菜单管理"),
    SYS_NOTICE("公告管理"), SYS_OPERATE_LOG("操作日志"), SYS_POST("岗位管理"), SYS_PROFILE("个人信息"), SYS_USRT_REST_PWD("重置密码"),
    SYS_ROLE("角色管理"), SYS_USER("用户管理"), SYS_UNLOCK("账户解锁"), SYS_CACHE("缓存管理"), SYS_USER_ONLING("在线用户"),
    SYS_MAIL("邮件管理"), SYS_OSS("文件管理"), SYS_TEMPLATE("模板管理"), WEB_RECORD("链接管理"), CMS_MENU("栏目管理"), CMS_TAG("标签管理"),
    CMS_CATEGORY("分类管理"), CMS_POST("文章管理"), CMS_LINK("链接管理"), CMS_CONTACT("反馈管理"), CMS_THEME("主题管理"),
    CMS_SITE_MAP("SITEMAP"), CMS_UNION("联盟推广"), CMS_COMMENT("评论管理"), CMS_CONFIG("内容配置");

    private String title;

    OperateTitle(String title) {
        this.title = title;
    }

    /**
     * @return the title
     */
    public String getTitle() {
        return title;
    }

    public static List<String> listLogTitle() {
        List<String> exs = new ArrayList<String>();
        for (OperateTitle iter : OperateTitle.values()) {
            exs.add(iter.getTitle());
        }
        return exs;
    }

}
