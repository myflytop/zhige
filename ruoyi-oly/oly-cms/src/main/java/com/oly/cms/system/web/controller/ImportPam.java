package com.oly.cms.system.web.controller;

import org.springframework.web.multipart.MultipartFile;

import java.io.Serializable;

public class ImportPam implements Serializable {
    private static final long serialVersionUID = 1L;
    private MultipartFile file;
    private Integer[] cats;
    private Integer[] tags;
    private Byte taoType;
    // 是否覆盖上传
    private boolean updateSupport;

    public Byte getTaoType() {
        return taoType;
    }

    public void setTaoType(Byte taoType) {
        this.taoType = taoType;
    }

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }

    public Integer[] getCats() {
        return cats;
    }

    public void setCats(Integer[] cats) {
        this.cats = cats;
    }

    public Integer[] getTags() {
        return tags;
    }

    public void setTags(Integer[] tags) {
        this.tags = tags;
    }

    public boolean getUpdateSupport() {
        return updateSupport;
    }

    public void setUpdateSupport(boolean updateSupport) {
        this.updateSupport = updateSupport;
    }

    @Override
    public String toString() {
        return "ImportPam{" + "file=" + file + ", cats='" + cats + '\'' + ", tags='" + tags + '\'' + ", updateSupport="
                + updateSupport + '}';
    }
}