package com.ruoyi.oss.utils;

import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.file.MimeExtensionEnum;
import com.ruoyi.common.utils.file.MimeTypeUtils;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.ArrayUtils;
import org.springframework.web.multipart.MultipartFile;

public class OssUtils {
    private OssUtils() {
    }

    /**
     * 获取文件名,个别浏览器文件名是全路径 edge包含全路径
     * 
     * @return
     */
    public static String getFileName(String originalBasename) {

        if (originalBasename.contains("\\")) {
            originalBasename = originalBasename.substring(originalBasename.lastIndexOf('\\') + 1);
        }
        return originalBasename;
    }

    public static String realFileName(MultipartFile file) {
        // 后缀
        String extension = FilenameUtils.getExtension(file.getOriginalFilename());
        // 文件名
        String baseFileName = FilenameUtils.getBaseName(file.getOriginalFilename());
        if (StringUtils.isEmpty(extension)) {
            extension = MimeTypeUtils.getExtension(file.getContentType());
        }
        return baseFileName + "." + extension;
    }

    public static boolean checkAllowFileName(String name) {
        // 禁止目录上跳级别
        if (StringUtils.contains(name, "..")) {
            return false;
        }
        return true;
    }

    /**
     * 获取文件类型表达
     * 
     * @param suffix
     * @return
     */
    public static String getFileTypeExtension(String suffix) {
        if (ArrayUtils.contains(MimeExtensionEnum.IMAGE.getType(), suffix)) {
            return MimeExtensionEnum.IMAGE.name().toLowerCase();
        } else if (ArrayUtils.contains(MimeExtensionEnum.DOCUMENT.getType(), suffix)) {
            return MimeExtensionEnum.DOCUMENT.name().toLowerCase();
        } else if (ArrayUtils.contains(MimeExtensionEnum.COMPRESS.getType(), suffix)) {
            return MimeExtensionEnum.COMPRESS.name().toLowerCase();
        } else if (ArrayUtils.contains(MimeExtensionEnum.MUSIC.getType(), suffix)) {
            return MimeExtensionEnum.MUSIC.name().toLowerCase();
        } else if (ArrayUtils.contains(MimeExtensionEnum.VIDEO.getType(), suffix)) {
            return MimeExtensionEnum.VIDEO.name().toLowerCase();
        } else {
            return "file";
        }
    }

}
