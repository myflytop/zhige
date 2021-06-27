package com.oly.oss.enums;

import com.oly.oss.utils.OssUtils;
import com.ruoyi.common.exception.BusinessException;
import com.ruoyi.common.utils.file.FileUploadUtils;
import com.ruoyi.common.utils.file.MimeTypeUtils;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.ArrayUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

import com.oly.oss.utils.FileTypes;

public enum EnumCheckSupportType {
    IMAGE("image") {
        @Override
        public void apply(MultipartFile file) {
            try {
                String contentType = FileTypes.getFileHeader(file.getInputStream());
                if (!contentType.startsWith("image")) {
                    throw new BusinessException("获取文件头图片类型!");
                }
            } catch (IOException e) {
                throw new BusinessException("获取文件头异常!" + e.getMessage());
            }
        }
    },
    DOCUMENT("document") {
        @Override
        public void apply(MultipartFile file) {
            System.out.println("two");
        }
    },
    COMMPRESS("commpress") {
        @Override
        public void apply(MultipartFile file) {
            System.out.println("three");
        }
    },
    VIDEO("video") {
        @Override
        public void apply(MultipartFile file) {
            System.out.println("four");
        }
    },
    MEDIA("media") {
        @Override
        public void apply(MultipartFile file) {
            System.out.println("three");
        }
    };

    public abstract void apply(MultipartFile file);

    private String type;

    EnumCheckSupportType(String type) {
        this.type = type;
    }

    public String getType() {
        return type;
    }

    public static void checkSupportType(MultipartFile file) {
        String dir = OssUtils.getStageDir(FileUploadUtils.getExtension(file));
        if (!checkSupportPrefix(file)) {
            throw new BusinessException("不支持文件类型!");
        } else {
            EnumCheckSupportType.valueOf(dir.toUpperCase()).apply(file);
        }
    }

    public static boolean checkSupportPrefix(MultipartFile file) {
        String prefix = FilenameUtils.getExtension(file.getOriginalFilename());
        return ArrayUtils.contains(MimeTypeUtils.DEFAULT_ALLOWED_EXTENSION, prefix);
    }

}
