package com.ruoyi.oss.api.enums;

public enum OssEnum {
    //储存配置前缀
    OSS_PREIFX("oss_"),
    //储存配置前缀
    OSS_PREIFX_QINIU("oss_qiniu_"),
    //支持文件类型
    SUPPORTTYPE("");
    private String value;
    OssEnum(String value){
        this.value=value;
    };

    public String getValue() {
        return value;
    }
}
