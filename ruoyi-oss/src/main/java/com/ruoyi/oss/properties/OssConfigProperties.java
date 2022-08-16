package com.ruoyi.oss.properties;

import com.ruoyi.common.enums.SysConfigGroups;
import com.ruoyi.common.properties.PropertyEnum;

public enum OssConfigProperties implements PropertyEnum {

    OSS_CONFIG_GROUP(SysConfigGroups.OSS_CONFIG.getValue(), String.class, SysConfigGroups.OSS_CONFIG.getValue()),
    OSS_USED("oly.oss.used", String.class, "native"),
    /* 储存配置前缀 */
    OSS_PREFIX("oly.oss.", String.class, ""),
    /* 本地配置前缀 */
    OSS_PREFIX_NATIVE("oly.oss.native.", String.class, ""),
    /* 七牛配置前缀 */
    OSS_PREFIX_QN("oly.oss.qiniu.", String.class, ""),
    /* 阿里储存配置前缀 */
    OSS_PREFIX_AL("oly.oss.aliyun.", String.class, ""),
    /* up储存配置前缀 */
    OSS_PREFIX_UP("oly.oss.upyun.", String.class, ""),
    // 允许上传最大文件大小 默认1024KB
    OSS_FILE_MAX_SIZE("oly.oss.max.size", Long.class, "1024"),
    // 允许原文件最长文件名
    OSS_FILE_NAME_MAX_LENGTH("oly.oss.max.length", Integer.class, "100"),
    // 支持文件类型 图片 文档 默认为空允许所有
    OSS_FILE_SUPPORT_TYPE("oly.oss.support.type", String.class, ""),
    // 文件名中文是否转换为拼音大写第一个字符
    OSS_FILE_NAME_ZH_PY("oly.oss.zh.py", Boolean.class, "true");

    private final String value;

    private final Class<?> type;

    private final String defaultValue;

    OssConfigProperties(String value, Class<?> type, String defaultValue) {
        this.defaultValue = defaultValue;
        if (!PropertyEnum.isSupportedType(type)) {
            throw new IllegalArgumentException("Unsupported web property type: " + type);
        }

        this.value = value;
        this.type = type;
    }

    @Override
    public Class<?> getType() {
        return type;
    }

    @Override
    public String defaultValue() {
        return defaultValue;
    }

    @Override
    public String getValue() {
        return value;
    }

}
