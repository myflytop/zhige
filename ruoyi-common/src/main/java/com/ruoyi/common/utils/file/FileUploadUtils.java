package com.ruoyi.common.utils.file;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

import org.apache.commons.io.FilenameUtils;
import org.springframework.web.multipart.MultipartFile;
import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.exception.file.FileNameLengthLimitExceededException;
import com.ruoyi.common.exception.file.FileSizeLimitExceededException;
import com.ruoyi.common.exception.file.InvalidExtensionException;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.uuid.IdUtils;

/**
 * 文件上传工具类
 * 
 * @author ruoyi
 */
public class FileUploadUtils {
    /**
     * 默认大小 50M
     */
    public static final long DEFAULT_MAX_SIZE = 50 * 1024 * 1024;

    /**
     * 默认的文件名最大长度 100
     */
    public static final int DEFAULT_FILE_NAME_LENGTH = 100;

    /**
     * 默认上传的地址
     */
    private static String defaultBaseDir = RuoYiConfig.getProfile();

    public static void setDefaultBaseDir(String defaultBaseDir) {
        FileUploadUtils.defaultBaseDir = defaultBaseDir;
    }

    public static String getDefaultBaseDir() {
        return defaultBaseDir;
    }

    /**
     * 以默认配置进行文件上传
     *
     * @param file 上传的文件
     * @return 文件名称
     * @throws Exception
     */
    public static final String upload(MultipartFile file) throws IOException {
        try {
            return upload(getDefaultBaseDir(), file, MimeTypeUtils.DEFAULT_ALLOWED_EXTENSION);
        } catch (Exception e) {
            throw new IOException(e.getMessage(), e);
        }
    }

    /**
     * 根据文件路径上传
     *
     * @param baseDir 相对应用的基目录
     * @param file    上传的文件
     * @return 文件名称
     * @throws IOException
     */
    public static final String upload(String baseDir, MultipartFile file) throws IOException {
        try {
            return upload(baseDir, file, MimeTypeUtils.DEFAULT_ALLOWED_EXTENSION);
        } catch (Exception e) {
            throw new IOException(e.getMessage(), e);
        }
    }

    /**
     * 文件上传
     *
     * @param baseDir          相对应用的基目录
     * @param file             上传的文件
     * @param allowedExtension 上传文件类型
     * @return 返回上传成功的文件名
     * @throws FileSizeLimitExceededException       如果超出最大大小
     * @throws FileNameLengthLimitExceededException 文件名太长
     * @throws IOException                          比如读写文件出错时
     * @throws InvalidExtensionException            文件校验异常
     */
    public static final String upload(String baseDir, MultipartFile file, String[] allowedExtension)
            throws FileSizeLimitExceededException, IOException, FileNameLengthLimitExceededException,
            InvalidExtensionException {
        int fileNamelength = getFileFullName(file.getOriginalFilename()).length();
        // 验证文件名长度
        if (fileNamelength > FileUploadUtils.DEFAULT_FILE_NAME_LENGTH) {
            throw new FileNameLengthLimitExceededException(FileUploadUtils.DEFAULT_FILE_NAME_LENGTH);
        }

        // 验证文件是否能上传
        assertAllowed(file, allowedExtension);
        // 返回时间路径
        String fileName = extractFilename(file);
        // 构造路径
        File desc = getAbsoluteFile(baseDir, fileName);
        // 上传
        file.transferTo(desc);
        String pathFileName = getPathFileName(baseDir, fileName);
        return pathFileName;
    }

    /**
     * 
     * @param baseDir     目录
     * @param secondLevel 次级目录
     * @param file        文件
     * @param original    是否使用原文件名
     * @return
     * @throws IOException
     * @throws FileSizeLimitExceededException
     * @throws InvalidExtensionException
     */
    public static final String upload(String baseDir, String secondLevel, MultipartFile file, boolean original)
            throws IOException, FileSizeLimitExceededException, InvalidExtensionException {
        int fileNamelength = getFileFullName(file.getOriginalFilename()).length();
        // 验证文件名长度
        if (fileNamelength > FileUploadUtils.DEFAULT_FILE_NAME_LENGTH) {
            throw new FileNameLengthLimitExceededException(FileUploadUtils.DEFAULT_FILE_NAME_LENGTH);
        }
        baseDir = Paths.get(baseDir, secondLevel).toString();
        // 验证文件是否能上传
        assertAllowed(file, MimeTypeUtils.DEFAULT_ALLOWED_EXTENSION);
        // 返回时间路径
        String fileName = extractFilename(file);
        // 构造路径
        File desc = getAbsoluteFile(baseDir, fileName);
        // 上传
        file.transferTo(desc);
        String pathFileName = getKey(baseDir, fileName);
        return pathFileName;
    }

    /**
     * 返回时间文件名 形如 2018/08/08/xxxxxxx.png
     * 
     * @param file     上传文件
     * @param division 分割符
     * @param original 是否保留原文件名
     * @return
     */
    public static final String extractFilename(MultipartFile file, String division, boolean original) {
        if (StringUtils.isEmpty(division)) {
            division = "_";
        }
        String fileName = file.getOriginalFilename();
        String extension = getExtension(file);
        if (original == true) {
            fileName = DateUtils.datePath() + "/" + IdUtils.fastUUID() + division
                    + getFileBaseName(file.getOriginalFilename()) + "." + extension;
        } else {
            fileName = DateUtils.datePath() + "/" + IdUtils.fastUUID() + "." + extension;
        }
        return fileName;
    }

    /**
     * 返回时间文件名 形如 2018/08/08/xxxxxxx.png
     * 
     * @param file
     * @param b
     * @return
     */
    public static final String extractFilename(MultipartFile file) {
        // 获取原文件名 edge 可能包含完整路径
        String fileName = file.getOriginalFilename();
        String extension = getExtension(file);
        fileName = DateUtils.datePath() + "/" + IdUtils.fastUUID() + "." + extension;
        return fileName;
    }

    /**
     * 创建文件
     * 
     * @param uploadDir
     * @param fileName
     * @return
     * @throws IOException
     */
    private static final File getAbsoluteFile(String uploadDir, String fileName) throws IOException {
        File desc = new File(uploadDir + File.separator + fileName);

        if (!desc.exists()) {
            if (!desc.getParentFile().exists()) {
                desc.getParentFile().mkdirs();
            }
        }
        return desc;
    }

    /**
     * 
     * @param uploadDir
     * @param fileName
     * @return
     * @throws IOException
     */
    private static final String getPathFileName(String uploadDir, String fileName) {
        int dirLastIndex = RuoYiConfig.getProfile().length() + 1;
        String currentDir = StringUtils.substring(uploadDir, dirLastIndex);
        String pathFileName = Constants.RESOURCE_PREFIX + "/" + currentDir + "/" + fileName;
        return pathFileName;
    }

    /**
     * 
     * @param uploadDir
     * @param fileName
     * @return
     * @throws IOException
     */
    private static final String getKey(String uploadDir, String fileName) {
        int dirLastIndex = RuoYiConfig.getProfile().length();
        String currentDir = StringUtils.substring(uploadDir, dirLastIndex);
        String pathFileName = Paths.get(currentDir, fileName).toString();
        return pathFileName.replace("\\", "/");
    }

    /**
     * 文件大小校验
     *
     * @param file 上传的文件
     * @return
     * @throws FileSizeLimitExceededException 如果超出最大大小
     * @throws InvalidExtensionException
     */
    public static final void assertAllowed(MultipartFile file, String[] allowedExtension)
            throws FileSizeLimitExceededException, InvalidExtensionException {
        long size = file.getSize();
        if (DEFAULT_MAX_SIZE != -1 && size > DEFAULT_MAX_SIZE) {
            throw new FileSizeLimitExceededException(DEFAULT_MAX_SIZE / 1024 / 1024);
        }

        String fileName = file.getOriginalFilename();
        String extension = getExtension(file);
        if (allowedExtension != null && !isAllowedExtension(extension, allowedExtension)) {
            if (allowedExtension == MimeTypeUtils.IMAGE_EXTENSION) {
                throw new InvalidExtensionException.InvalidImageExtensionException(allowedExtension, extension,
                        fileName);
            } else if (allowedExtension == MimeTypeUtils.FLASH_EXTENSION) {
                throw new InvalidExtensionException.InvalidFlashExtensionException(allowedExtension, extension,
                        fileName);
            } else if (allowedExtension == MimeTypeUtils.MEDIA_EXTENSION) {
                throw new InvalidExtensionException.InvalidMediaExtensionException(allowedExtension, extension,
                        fileName);
            } else if (allowedExtension == MimeTypeUtils.VIDEO_EXTENSION) {
                throw new InvalidExtensionException.InvalidVideoExtensionException(allowedExtension, extension,
                        fileName);
            } else {
                throw new InvalidExtensionException(allowedExtension, extension, fileName);
            }
        }
    }

    /**
     * 判断MIME类型是否是允许的MIME类型
     *
     * @param extension
     * @param allowedExtension
     * @return
     */
    public static final boolean isAllowedExtension(String extension, String[] allowedExtension) {
        for (String str : allowedExtension) {
            if (str.equalsIgnoreCase(extension)) {
                return true;
            }
        }
        return false;
    }

    /**
     * 获取文件名的后缀acu.txt 获取 txt 无后缀 根据文件头返回后缀
     * 
     * @param file 表单文件
     * @return 后缀名
     */
    public static final String getExtension(MultipartFile file) {
        String extension = FilenameUtils.getExtension(file.getOriginalFilename());
        if (StringUtils.isEmpty(extension)) {
            extension = MimeTypeUtils.getExtension(file.getContentType());
        }
        return extension;
    }

    /**
     * 获取完整文件名 如acu.txt
     * 
     * @param originalFilename
     * @return
     */
    public static final String getFileFullName(String originalFilename) {

        return FilenameUtils.getName(originalFilename);
    }

    /**
     * 获取完整文件名1/2/acu.txt 如acu
     * 
     * @param originalFilename
     * @return
     */
    public static final String getFileBaseName(String originalFilename) {

        return FilenameUtils.getBaseName(originalFilename);
    }

    /**
     * 
     * @param file
     * @param division
     * @param original
     * @return
     */
    public static final String getTimePath(MultipartFile file, String division, boolean original) {
        if (StringUtils.isEmpty(division)) {
            division = "_";
        }
        String fileName = file.getOriginalFilename();
        String extension = getExtension(file);
        if (original == true) {
            fileName = DateUtils.dateTime() + division + IdUtils.fastUUID() + division
                    + getFileBaseName(file.getOriginalFilename()) + "." + extension;
        } else {
            fileName = DateUtils.dateTime() + division + IdUtils.fastUUID() + "." + extension;
        }
        return fileName;
    }

}