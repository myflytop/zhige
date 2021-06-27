package com.oly.oss.utils;

import com.oly.oss.enums.OssDirEnum;
import com.ruoyi.common.utils.StringUtils;
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
     * @param suffix
     * @return
     */
    public static String getStageDir(String suffix) {

        if (ArrayUtils.contains(MimeTypeUtils.IMAGE_EXTENSION, suffix)) {
            return OssDirEnum.IMAGE.getDir();
        } else if (ArrayUtils.contains(MimeTypeUtils.DOCUMENT_EXTENSION, suffix)) {
            return OssDirEnum.DOCUMENT.getDir();
        } else if (ArrayUtils.contains(MimeTypeUtils.COMMPRESS_EXTENSION, suffix)) {
            return OssDirEnum.COMMPRESS.getDir();
        } else if (ArrayUtils.contains(MimeTypeUtils.MEDIA_EXTENSION, suffix)) {
            return OssDirEnum.MEDIA.getDir();
        } else if (ArrayUtils.contains(MimeTypeUtils.VIDEO_EXTENSION, suffix)) {
            return OssDirEnum.VIDEO.getDir();
        } else {
            return "other";
        }
    }

}
