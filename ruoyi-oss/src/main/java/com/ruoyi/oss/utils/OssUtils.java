package com.ruoyi.oss.utils;

import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.file.MimeExtxensionEnum;
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

    public static String getBuildPath() {
        return null;
    }

    /**
     * 获取文件类型表达
     * 
     * @param suffix
     * @return
     */
    public static String getFileTypeExtension(String suffix) {
        if (ArrayUtils.contains(MimeExtxensionEnum.IMAGE.getType(), suffix)) {
            return MimeExtxensionEnum.IMAGE.name().toLowerCase();
        } else if (ArrayUtils.contains(MimeExtxensionEnum.DOCUMENT.getType(), suffix)) {
            return MimeExtxensionEnum.DOCUMENT.name().toLowerCase();
        } else if (ArrayUtils.contains(MimeExtxensionEnum.COMPRESS.getType(), suffix)) {
            return MimeExtxensionEnum.COMPRESS.name().toLowerCase();
        } else if (ArrayUtils.contains(MimeExtxensionEnum.MUSIC.getType(), suffix)) {
            return MimeExtxensionEnum.MUSIC.name().toLowerCase();
        } else if (ArrayUtils.contains(MimeExtxensionEnum.VIDEO.getType(), suffix)) {
            return MimeExtxensionEnum.VIDEO.name().toLowerCase();
        } else {
            return "other";
        }
    }

    public static void main(String[] args) {
        System.out.println(new String[] { "1", "2" });
    }

}
