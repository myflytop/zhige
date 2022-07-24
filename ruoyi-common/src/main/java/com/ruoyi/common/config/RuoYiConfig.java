package com.ruoyi.common.config;

import java.nio.file.Paths;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * 全局配置类
 * 
 * @author ruoyi
 */
@Component
@ConfigurationProperties(prefix = "ruoyi")
public class RuoYiConfig {
    /** 项目名称 */
    private static String name;

    /** 版本 */
    private static String version;

    /** 版权年份 */
    private static String copyrightYear;

    /** 实例演示开关 */
    private static boolean appointProfile;

    /** 工作目录 */
    private static String profile;

    /** 获取地址开关 */
    private static boolean addressEnabled;

    public static String getName() {
        return name;
    }

    public void setName(String name) {
        RuoYiConfig.name = name;
    }

    public static String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        RuoYiConfig.version = version;
    }

    public static String getCopyrightYear() {
        return copyrightYear;
    }

    public void setCopyrightYear(String copyrightYear) {
        RuoYiConfig.copyrightYear = copyrightYear;
    }


    public static boolean isAppointProfile() {

        return appointProfile;
    }

    public void setAppointProfile(boolean appointProfile) {
        RuoYiConfig.appointProfile = appointProfile;
    }

    public static String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        if (appointProfile) {
            RuoYiConfig.profile = profile;
        } else {
            RuoYiConfig.profile = Paths.get(getUserWork(), profile).toString();
        }
    }

    public static boolean isAddressEnabled() {
        return addressEnabled;
    }

    public void setAddressEnabled(boolean addressEnabled) {
        RuoYiConfig.addressEnabled = addressEnabled;
    }

    /**
     * 获取导入上传路径
     */
    public static String getImportPath() {
        return getProfile() + "/import";
    }

    /**
     * 获取头像上传路径
     */
    public static String getAvatarPath() {
        return getProfile() + "/avatar";
    }

    /**
     * 获取下载路径
     */
    public static String getDownloadPath() {
        return getProfile() + "/download/";
    }

    /**
     * 获取上传路径
     */
    public static String getUploadPath() {
        return getProfile() + "/upload";
    }

    public static String getUserWork() {
        return System.getProperty("user.home");
    }

}
