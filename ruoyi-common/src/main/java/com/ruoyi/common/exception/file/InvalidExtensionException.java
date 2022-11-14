package com.ruoyi.common.exception.file;

import java.util.Arrays;
import org.apache.commons.fileupload.FileUploadException;

/**
 * 文件上传 误异常类
 * 
 * @author ruoyi
 */
public class InvalidExtensionException extends FileUploadException {
    private static final long serialVersionUID = 1L;

    private String[] allowedExtension;
    private String extension;
    private String filename;

    public InvalidExtensionException(String[] allowedExtension, String extension, String filename) {
        super("文件[" + filename + "]后缀[" + extension + "]不正确，请上传 [" + Arrays.toString(allowedExtension) + "]格式文件");
        this.allowedExtension = allowedExtension;
        this.extension = extension;
        this.filename = filename;
    }

    public String[] getAllowedExtension() {
        return allowedExtension;
    }

    public String getExtension() {
        return extension;
    }

    public String getFilename() {
        return filename;
    }

    // 图片异常
    public static class InvalidImageExtensionException extends InvalidExtensionException {
        private static final long serialVersionUID = 1L;

        public InvalidImageExtensionException(String[] allowedExtension, String extension, String filename) {
            super(allowedExtension, extension, filename);
        }
    }

    // 音频异常
    public static class InvalidMusicExtensionException extends InvalidExtensionException {
        private static final long serialVersionUID = 1L;

        public InvalidMusicExtensionException(String[] allowedExtension, String extension, String filename) {
            super(allowedExtension, extension, filename);
        }
    }

    // 视频异常
    public static class InvalidVideoExtensionException extends InvalidExtensionException {
        private static final long serialVersionUID = 1L;

        public InvalidVideoExtensionException(String[] allowedExtension, String extension, String filename) {
            super(allowedExtension, extension, filename);
        }
    }

    // 压缩异常
    public static class InvalidCompressExtensionException extends InvalidExtensionException {
        private static final long serialVersionUID = 1L;

        public InvalidCompressExtensionException(String[] allowedExtension, String extension, String filename) {
            super(allowedExtension, extension, filename);
        }
    }

    // 文档异常
    public static class InvalidDocumentExtensionException extends InvalidExtensionException {
        private static final long serialVersionUID = 1L;

        public InvalidDocumentExtensionException(String[] allowedExtension, String extension, String filename) {
            super(allowedExtension, extension, filename);
        }
    }
}
