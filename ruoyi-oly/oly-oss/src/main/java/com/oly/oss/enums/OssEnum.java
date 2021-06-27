package com.oly.oss.enums;

public enum OssEnum {
    /* 储存配置前缀 */
    OSS_PREFIX("oly.oss."),
    /* 本地配置前缀 */
    OSS_PREFIX_NATIVE("oly.oss.native."),
    /* 七牛配置前缀 */
    OSS_PREFIX_QN("oly.oss.qiniu."),
    /* 阿里储存配置前缀 */
    OSS_PREFIX_AL("oly.oss.aliyun."),
    /* up储存配置前缀 */
    OSS_PREFIX_UP("oly.oss.upyun.");

    private String value;

    OssEnum(String value) {
        this.value = value;
    };

    public String getValue() {
        return value;
    }
}
