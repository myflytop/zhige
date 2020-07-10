package com.ruoyi.taoke.admin.web.controller;

import org.springframework.web.multipart.MultipartFile;

import java.io.Serializable;

public class ImportPam implements Serializable {
    private static final long serialVersionUID = 1L;
   private MultipartFile file;
   private Integer[]  cats;
    private Integer[] tags;
   private boolean updateSupport;

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }

    public Integer[]  getCats() {
        return cats;
    }

    public void setCats(Integer[]  cats) {
        this.cats = cats;
    }

    public Integer[]  getTags() {
        return tags;
    }

    public void setTags(Integer[]  tags) {
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
        return "ImportPam{" +
                "file=" + file +
                ", cats='" + cats + '\'' +
                ", tags='" + tags + '\'' +
                ", updateSupport=" + updateSupport +
                '}';
    }
}
