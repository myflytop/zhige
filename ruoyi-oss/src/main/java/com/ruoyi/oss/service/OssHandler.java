package com.ruoyi.oss.service;

import java.io.IOException;
import java.util.Objects;

import com.ruoyi.common.enums.OlyStageRoot;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.exception.file.FileNameLengthLimitExceededException;
import com.ruoyi.common.exception.file.FileSizeLimitExceededException;
import com.ruoyi.common.exception.file.InvalidExtensionException;
import com.ruoyi.common.utils.file.FileUploadUtils;
import com.ruoyi.oss.model.OssResult;
import com.ruoyi.oss.utils.OssUtils;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.ArrayUtils;
import org.springframework.web.multipart.MultipartFile;

public interface OssHandler {

  /**
   * 缩略图宽
   */
  final static int THUMB_WIDTH = 256;

  /**
   * 缩略图高
   *
   */
  final static int THUMB_HEIGHT = 256;

  byte getOssType();

  /**
   * 
   * @param file
   * @param maxLength
   * @param maxSize
   * @param chan
   * @param supportType
   * @return
   * @throws IOException
   * @throws FileSizeLimitExceededException
   * @throws InvalidExtensionException
   */
  OssResult ossUpload(MultipartFile file, int maxLength, long maxSize, boolean chan, String[] supportType)
      throws IOException, FileSizeLimitExceededException, InvalidExtensionException;

  /**
   * 指定 文件上传路径 工作目录/文件上传根目录/key key唯一凭证
   * 
   * @param file     文件
   * @param rootPath 指定目录
   * @param fileName 文件名
   * @return
   * @throws IOException
   */
  OssResult ossAppointUpload(MultipartFile file, OlyStageRoot rootPath, String fileName) throws IOException;

  /**
   * 指定 文件上传路径 工作目录/文件上传根目录/key key唯一凭证
   * 
   * @param file     文件
   * @param rootPath 指定目录
   * @return
   * @throws IOException
   */
  OssResult ossAppointUpload(MultipartFile file, OlyStageRoot rootPath) throws IOException;

  /**
   * 删除文件
   * 
   * @param filePath 删除的文件路径/key
   * @return
   */
  OssResult ossDelete(String filePath);

  /**
   * 获取缩略地址
   * 
   * @param fk
   * @return
   */
  String getThumbKey(String fk);

  public static String getKey(String flod, MultipartFile file, boolean chan) throws IOException {
    return FileUploadUtils.getKey(flod, FileUploadUtils.extractFilename(file, chan));
  }

  /**
   * 文件大小检验
   * 
   * @param fileSize
   * @param maxSize
   * @throws FileSizeLimitExceededException
   */
  public static void fileSizeChick(long fileSize, long maxSize) throws FileSizeLimitExceededException {
    if (fileSize > maxSize * 1024 * 1024) {
      throw new FileSizeLimitExceededException(maxSize);
    }
  }

  /**
   * 原文件名长度验证
   * 
   * @param fileName
   * @param maxLength
   * @throws FileNameLengthLimitExceededException
   */
  public static void fileNameLengthChick(String fileName, int maxLength) throws FileNameLengthLimitExceededException {

    int fileNamelength = Objects.requireNonNull(fileName).length();
    if (fileNamelength > maxLength) {
      throw new FileNameLengthLimitExceededException(maxLength);
    }
  }

  public static void check(MultipartFile file, int maxLength, long maxSize, String[] allowedExtension)
      throws InvalidExtensionException {
    String fileName = FilenameUtils.getBaseName(file.getOriginalFilename());
    String prefix = FileUploadUtils.getExtension(file);
    String fileExtension = OssUtils.getFileTypeExtension(prefix);
    if (ArrayUtils.isNotEmpty(allowedExtension) && !ArrayUtils.contains(allowedExtension, fileExtension)) {
      throw new ServiceException("上传文件不被允许");
    } else {
      fileNameLengthChick(fileName, maxLength);
      fileSizeChick(file.getSize(), maxSize);
    }
  }

  public static String pathToUrl(String path) {
    return path.replace("\\", "/");
  }

}
