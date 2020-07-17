package com.ruoyi.oss.api.enums;

public enum OssEnum {
    /*储存配置前缀*/
    OSS_PREFIX("oss_"),
    /*本地配置前缀*/
    OSS_PREFIX_NATIVE("oss_native_"),
    /*七牛配置前缀*/
    OSS_PREFIX_QN("oss_qiniu_"),
    /*阿里储存配置前缀*/
    OSS_PREFIX_AL("oss_aliyun_"),
    /*up储存配置前缀*/
    OSS_PREFIX_UP("oss_upyun_");
    private String value;
    OssEnum(String value){
        this.value=value;
    };

    public String getValue() {
        return value;
    }
}
