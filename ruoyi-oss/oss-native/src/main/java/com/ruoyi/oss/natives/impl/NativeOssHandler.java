package com.ruoyi.oss.natives.impl;
import com.ruoyi.common.constant.RuoYiConstants;
import com.ruoyi.oss.api.OssHandler;
import com.ruoyi.oss.api.OssResult;
import com.ruoyi.oss.api.ResultData;
import com.ruoyi.oss.api.utils.FileTypes;
import com.ruoyi.oss.api.utils.OssUtils;
import com.ruoyi.oss.natives.enums.NativeProperties;
import com.ruoyi.system.service.ISysConfigService;
import com.ruoyi.system.service.impl.SysConfigServiceImpl;
import net.coobird.thumbnailator.Thumbnails;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
@Service
public class NativeOssHandler implements OssHandler {


    /**
     * 下载请求路径
     */
    final static String DOWNLOAD_URL = "/download";


    @Autowired
    private ISysConfigService configService;

    /**
     *
     * @param file 文件
     * @param fileName 文件名
     * @return
     * @throws IOException
     */
    @Override
    public OssResult ossUpload(MultipartFile file, String fileName) throws IOException {

        //获取全文件名包括后缀
        String originalBasename= OssUtils.getFileName(file.getOriginalFilename());
        int index=originalBasename.lastIndexOf(".");
        String contentType=FileTypes.getFileHeader(file.getInputStream());
        //检测文件是否符合要求
        if (OssHandler.checkFile(file,contentType)) {
            //获取后缀
            String suffer = FileTypes.getSuffex(originalBasename, index);
            //构造时间路径
            String subDir =OssHandler.getDataPath();
            //获取前缀
            String prefix = FileTypes.getPreifx(originalBasename, index);
            //构造文件名
            String baseName = prefix + "_" + StringUtils.remove(UUID.randomUUID().toString(), '-');
            //构造相对路径包括文件
            String subFilePath = subDir + FILE_SEPARATOR+baseName + '.' + suffer;
            // 构造全路径
            Path uploadPath = Paths.get(getWorkPath(),subFilePath);
            try {
                //获取上级目录
                Files.createDirectories(uploadPath.getParent());
                //创建文件
                Files.createFile(uploadPath);
                //上传文件
                file.transferTo(uploadPath);
                String key=subFilePath.replace("\\","/");
                //设置返回结果
                ResultData data = new ResultData();

                data.setFilePath(DOWNLOAD_URL+key);
                //设置域名
                data.setDomain(configService.selectConfigValueByKey(NativeProperties.OSS_DOMAIN.getValue()));
                //文件路径 /2020/2/25/xxxx
                data.setKey(key);
                data.setContentType(contentType);
                if (contentType.startsWith("image")) {   //构造缩略图文件名
                    String thumbnailBasename = baseName + THUMBNAIL_SUFFIX;
                    //构造缩略图路径
                    String thumbnailSubFilePath = subDir + FILE_SEPARATOR + thumbnailBasename + '.' + suffer;
                    //构造缩略图全路径
                    Path thumbnailPath = Paths.get( getWorkPath(),thumbnailSubFilePath);
                    BufferedImage bufferedImage = ImageIO.read(new FileInputStream(uploadPath.toString()));
                    Thumbnails.of(bufferedImage)
                            .size(THUMB_WIDTH, THUMB_HEIGHT)
                            .toFile(thumbnailPath.toString());
                    //设置缩略图返回结果
                    data.setThumbPath(DOWNLOAD_URL+thumbnailSubFilePath);
                }
                return  OssResult.ok("上传成功",data);
            } catch (Exception e) {
                return OssResult.error("上传失败",null);
            } finally {

            }
        }
        return OssResult.error("不支持文件类型",null);
    }

    /**
     *
     * @param filePath 删除的文件路径 相当于key
     * @return
     */
    @Override
    public OssResult ossDelete(String filePath) {

        Path path = Paths.get(getWorkPath(), filePath);
        try {
            Files.deleteIfExists(path);
            if(FileTypes.getImg(filePath)) {
                Path smPath = Paths.get(getWorkPath(), FileTypes.getSmPath(filePath, THUMBNAIL_SUFFIX));
                Files.deleteIfExists(smPath);
            }
        } catch (IOException e) {
         return OssResult.error("删除附件失败",null);
        }
        return OssResult.ok("删除附件成功",null);
    }

    @Override
    public OssResult ossList(String path, String accept, int startNum, int maxNum) {
        //构造基本路径
        String domain=configService.selectConfigValueByKey(NativeProperties.OSS_DOMAIN.getValue());
        Path pah=Paths.get(getWorkPath(),path);
        File file=new File(pah.toUri());
        File[] listFiles = file.listFiles();
        List<ResultData> resultDataList=new ArrayList<>();
        if(listFiles!=null)
        {
            for (File f : listFiles) {
              if(f.getName().indexOf(THUMBNAIL_SUFFIX)==-1)
              {
                  ResultData resultData=new ResultData();
                  resultData.setDomain(domain);
                  resultData.setFileName(f.getName());
                  resultData.setUpdateTime(f.lastModified());
                  resultData.setFileType(f.isDirectory());
                  if(f.isDirectory()){
                      //文件夹类型
                      resultData.setContentType("dir");
                  }
                  else {
                      //获取图标
                      resultData.setContentType(FileTypes.getFileType(FileTypes.getSuffex(f.getName())));
                      resultData.setFilePath(DOWNLOAD_URL+path+"/"+f.getName());
                      // 形如2020/10/xxx
                      resultData.setKey(path+"/"+f.getName());
                      if(FileTypes.getImg(f.getName())){
                      resultData.setThumb(true);
                      resultData.setThumbPath(DOWNLOAD_URL+path+"/"+FileTypes.getSmPath(f.getName(),THUMBNAIL_SUFFIX));
                      }
                  }
                  resultDataList.add(resultData);
              }
              else {
                  continue;
              }
            }

        }
        return OssResult.listOk("获取成功",resultDataList);
    }

    public FileItem createFileItem(String filePath) {
        FileItemFactory factory = new DiskFileItemFactory(16, null);
        String textFieldName = "textField";
        int num = filePath.lastIndexOf(".");
        String extFile = filePath.substring(num);
        FileItem item = factory.createItem(textFieldName, "text/plain", true, "MyFileName.jpg");
        File newfile = new File(filePath);
        int bytesRead = 0;
        byte[] buffer = new byte[8192];
        try {
            FileInputStream fis = new FileInputStream(newfile);
            OutputStream os = item.getOutputStream();
            while ((bytesRead = fis.read(buffer, 0, 8192)) != -1) {
                os.write(buffer, 0, bytesRead);
            }
            os.close();
            fis.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return item;
    }

    /**
     *
     * @return
     */
    private String getWorkPath(){
        return Paths.get(System.getProperties().getProperty("user.home"), RuoYiConstants.workDir+UPLOAD_SUB_DIR).toString();
    }
}
