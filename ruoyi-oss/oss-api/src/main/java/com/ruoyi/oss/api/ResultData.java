package com.ruoyi.oss.api;

import java.io.Serializable;

public class ResultData implements Serializable {
    //域名
    private  String domain;
    //文件名
    private String fileName;
    //文件路径
    private String filePath;
    //文件key
    private String key;
    //图片文件 缩略图
    private String thumbPath;
    //默认false
    private boolean thumb;
    //文件后缀
    private String suffix;
    //文件标识
    private String contentType;
    //文件大小
    private Long size;
    //文件类型 true表示文件夹 false表示文件
    private boolean fileType;
    //更新时间
    private long updateTime;

    public boolean getThumb() {
        return thumb;
    }

    public boolean getFileType() {
        return fileType;
    }

    public void setThumb(boolean thumb) {
        this.thumb = thumb;
    }
    public void setFileType(boolean fileType) {
        this.fileType = fileType;
    }

    public void setUpdateTime(long updateTime) {
        this.updateTime = updateTime;
    }

    public long getUpdateTime() {
        return updateTime;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getThumbPath() {
        return thumbPath;
    }

    public void setThumbPath(String thumbPath) {
        this.thumbPath = thumbPath;
    }

    public String getSuffix() {
        return suffix;
    }

    public void setSuffix(String suffix) {
        this.suffix = suffix;
    }

    public String getContentType() {
        return contentType;
    }

    public void setContentType(String contentType) {
        this.contentType = contentType;
    }

    public Long getSize() {
        return size;
    }

    public void setSize(Long size) {
        this.size = size;
    }


    public void setDomain(String domain) {
        this.domain = domain;
    }

    public String getDomain() {
        return domain;
    }
}
