package com.ruoyi.oss.api;

import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.oss.api.utils.FileTypes;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;

public interface OssHandler {
    /**
     * 斜杠
     */
    final static String FILE_SEPARATOR= File.separator;
    /**
     * 文件路径工作目录/upload
     */
     final static String UPLOAD_SUB_DIR ="/upload";

    /**
     * 缩略图前缀
     */
   final static String THUMBNAIL_SUFFIX = "-thumbnail";

    /**
     *缩略图宽
     */
   final static int THUMB_WIDTH = 256;

    /**
     * 缩略图高
     *
     */
   final static int THUMB_HEIGHT = 256;


    /**
     * 检查文件类型是否符合
     * 1.是否包含.
     * 2.后缀是否包含在指定后缀列表中
     * 3.根据根据文件头判断
     * @param file
     * @param contentType 头文件 形如 "application/pdf"
     * @return
     * @throws IOException
     */
   static boolean checkFile(MultipartFile file,String contentType) throws IOException {
              String fileName=file.getOriginalFilename();
              int index=fileName.lastIndexOf(".");
              String suffex=FileTypes.getSuffex(fileName,index);
              if(!StringUtils.isNotEmpty(contentType))
              {
                  contentType=FileTypes.getFileHeader(file.getInputStream());
              }
      return FileTypes.includeDot(fileName)&&SupportType.getSupportSuffer().contains(suffex)&&(SupportType.SUPPORT_MEDIA.get(suffex).equals(contentType));
   }

    /**
     *
     * @return 形如 /xxx/2020/7
     */
    static String getPath(){
        // Get current time
        Calendar current = Calendar.getInstance();
        // Get month and day of month
        int year = current.get(Calendar.YEAR);
        //  Get month and day of year
        int month = current.get(Calendar.MONTH) + 1;
        return  UPLOAD_SUB_DIR+ FILE_SEPARATOR+ year + FILE_SEPARATOR + month;
    }


    /**
     *
     * @return 形如 /2020/7
     */
    static String getDataPath(){
        // Get current time
        Calendar current = Calendar.getInstance();
        // Get month and day of month
        int year = current.get(Calendar.YEAR);
        //  Get month and day of year
        int month = current.get(Calendar.MONTH) + 1;
        return  FILE_SEPARATOR+ year + FILE_SEPARATOR + month;
    }

    /**
     *
     * @param file 文件
     * @param fileName 文件名
     * @return
     * @throws IOException
     */
   OssResult ossUpload(MultipartFile file,String fileName ) throws IOException;

    /**
     * 删除文件
     * @param filePath 删除的文件路径
     * @return
     */
   OssResult  ossDelete(String filePath);

    /**
     * 获取文件列表
     * @param path 路径
     * @param accept 接收类型
     * @param startNum 从那里开始
     * @param maxNum  获取多少个
     * @return
     */
   OssResult  ossList(String path,String accept,int startNum,int maxNum);
}
