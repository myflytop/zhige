package com.oly.oss.service;

import com.oly.oss.domain.OlyOss;
import com.oly.oss.model.OssResult;
import com.ruoyi.common.enums.OlyStageRoot;
import com.ruoyi.common.exception.file.FileSizeLimitExceededException;
import com.ruoyi.common.exception.file.InvalidExtensionException;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.uuid.IdUtils;

import org.apache.commons.io.FilenameUtils;
import org.springframework.web.multipart.MultipartFile;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

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

  /**
   * 文件上传路径 工作目录/文件上传根目录/key key唯一凭证
   * 
   * @param file 文件
   * @return
   * @throws IOException
   */
  OssResult ossUpload(MultipartFile file) throws IOException, FileSizeLimitExceededException, InvalidExtensionException;

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

  /**
   * 获取文件列表
   * 
   * @return
   */
  List<OlyOss> ossList(OlyOss olyOss);

  public static String getKey(String flod, String fileName) {

    return StringUtils.join("/", flod, "/", DateUtils.datePath(), IdUtils.fastUUID(), ".",
        FilenameUtils.getExtension(fileName));
  }

  public static boolean supportFile(InputStream in) {
    return true;
  }

  public static String encodeKey(String key) {

    try {
      return URLEncoder.encode(key, "UTF-8");
    } catch (UnsupportedEncodingException e) {
      return key;
    }
  }

}
