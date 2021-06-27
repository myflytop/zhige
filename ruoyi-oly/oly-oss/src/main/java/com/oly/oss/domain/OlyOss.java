package com.oly.oss.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 文件存储对象 oly_oss
 * 
 * @author ruoyi
 * @date 2021-02-26
 */
public class OlyOss extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**  */
    private Long id;

    /** 文件名 */
    private String fileName;

    /** 文件大小 */
    private Long size;

    /** 唯一路径 */
    private String fk;

    /** 文件类型|后缀 */
    private String fileType;

    /** 域名 */
    private String domain;

    /** 文件头 */
    private String fileHeard;

    private String thumbKey;
    
    /**储存在哪里 */
    private Byte ossType;

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFileName() {
        return fileName;
    }

    public void setSize(Long size) {
        this.size = size;
    }

    public Long getSize() {
        return size;
    }

    public void setDomain(String domain) {
        this.domain = domain;
    }

    public String getDomain() {
        return domain;
    }

    public void setFileHeard(String fileHeard) {
        this.fileHeard = fileHeard;
    }

    public String getFileHeard() {
        return fileHeard;
    }


    
    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE).append("id", getId())
                .append("createBy", getCreateBy()).append("createTime", getCreateTime())
                .append("fileName", getFileName()).append("size", getSize()).append("fk", getFk())
                .append("fileType", getFileType()).append("domain", getDomain()).append("fileHeard", getFileHeard())
                .append("remark", getRemark())
                .append("ossType", getOssType()).toString();
    }

    public String getFileType() {
        return fileType;
    }

    public void setFileType(String fileType) {
        this.fileType = fileType;
    }

    public String getThumbKey() {
        return thumbKey;
    }

    public void setThumbKey(String thumbKey) {
        this.thumbKey = thumbKey;
    }

    public String getFk() {
        return fk;
    }

    public void setFk(String fk) {
        this.fk = fk;
    }

    public Byte getOssType() {
        return ossType;
    }

    public void setOssType(Byte ossType) {
        this.ossType = ossType;
    }

}
