package com.ruoyi.oss.api;

import java.io.Serializable;

public class ResultData implements Serializable {
    //域名
    private  String domain;
    //文件名
    private String fileName;
    //文件请求路径 /download/2020/2/xx.png
    private String filePath;
    //文件key  形如 /2020/2/xx.png
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

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("com.ruoyi.oss.api.ResultData{");
        sb.append("domain='").append(domain).append('\'');
        sb.append(", fileName='").append(fileName).append('\'');
        sb.append(", filePath='").append(filePath).append('\'');
        sb.append(", key='").append(key).append('\'');
        sb.append(", thumbPath='").append(thumbPath).append('\'');
        sb.append(", thumb=").append(thumb);
        sb.append(", suffix='").append(suffix).append('\'');
        sb.append(", contentType='").append(contentType).append('\'');
        sb.append(", size=").append(size);
        sb.append(", fileType=").append(fileType);
        sb.append(", updateTime=").append(updateTime);
        sb.append('}');
        return sb.toString();
    }
}
