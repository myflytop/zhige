package com.oly.cms.admin.model.param;

import org.springframework.web.multipart.MultipartFile;

import java.io.Serializable;
import java.util.Arrays;

public class ImportPam implements Serializable {
    private static final long serialVersionUID = 1L;
    private MultipartFile file;
    private Integer[] cats;
    private Integer[] tags;
    private Long templateId;
    // 上传类型
    private Byte taoType;
    // 是否覆盖更新
    private boolean updateSupport;

    public Long getTemplateId() {
        return templateId;
    }

    public void setTemplateId(Long templateId) {
        this.templateId = templateId;
    }

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
        return "ImportPam [cats=" + Arrays.toString(cats) + ", file=" + file + ", tags=" + Arrays.toString(tags)
                + ", taoType=" + taoType + ", templateId=" + templateId + "]";
    }

}
