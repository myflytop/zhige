package com.oly.oss.service.impl;

import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.google.gson.Gson;
import com.oly.oss.domain.OlyOss;
import com.oly.oss.enums.OssEnum;
import com.oly.oss.enums.QnYunProperties;
import com.oly.oss.mapper.OlyOssMapper;
import com.oly.oss.model.OssResult;
import com.oly.oss.service.OssHandler;
import com.oly.oss.utils.FileTypes;
import com.oly.oss.utils.OssUtils;
import com.qiniu.common.QiniuException;
import com.qiniu.common.Zone;
import com.qiniu.http.Response;
import com.qiniu.storage.BucketManager;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.model.DefaultPutRet;
import com.qiniu.storage.persistent.FileRecorder;
import com.qiniu.util.Auth;
import com.qiniu.util.StringMap;
import com.ruoyi.common.enums.OlyStageRoot;
import com.ruoyi.common.exception.file.FileSizeLimitExceededException;
import com.ruoyi.common.exception.file.InvalidExtensionException;
import com.ruoyi.common.utils.ShiroUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.file.FileUploadUtils;
import com.ruoyi.common.utils.file.MimeTypeUtils;
import com.ruoyi.system.domain.SysConfig;
import com.ruoyi.system.service.ISysConfigService;

import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class QiNiuOssHander implements OssHandler {
    private static final Logger log = LoggerFactory.getLogger(OssHandler.class);
    @Autowired
    private ISysConfigService configService;

    @Autowired
    private OlyOssMapper ossMapper;

    public final static byte ossType=1;
    @Override
    public OssResult ossUpload(MultipartFile file) throws IOException, FileSizeLimitExceededException, InvalidExtensionException {

   
            FileUploadUtils.assertAllowed(file, MimeTypeUtils.DEFAULT_ALLOWED_EXTENSION);
      
        OlyOss data = new OlyOss();
    
        String fileName=FilenameUtils.getName(file.getOriginalFilename());
        // file.getInputStream()必须在上传前使用，上传后使用将导致文件缓存失效
        String contentType = FileTypes.getFileHeader(file.getInputStream());
       
            // 二级目录
            String fileType = OssUtils.getStageDir(FileUploadUtils.getExtension(file));
             //获取配置文件
             Map<String,String> mp=getQiNiuConfig();
             Configuration cfg = new Configuration(getQnYunZone(mp.get(QnYunProperties.OSS_ZONE.getValue())));
             String bucket = mp.get(QnYunProperties.OSS_BUCKET.getValue());
             Auth auth = getAuth(mp);
             StringMap putPolicy = new StringMap();
             putPolicy.put("returnBody", "{\"key\":\"$(key)\",\"hash\":\"$(etag)\",\"bucket\":\"$(bucket)\",\"fsize\":$(fsize)}");
             long expireSeconds = 3600;
             String upToken = auth.uploadToken(bucket, null, expireSeconds, putPolicy);
             String localTempDir = Paths.get(System.getenv("java.io.tmpdir"), bucket).toString();
             try {    //设置断点续传文件进度保存目录
                 FileRecorder fileRecorder = new FileRecorder(localTempDir);
                 UploadManager uploadManager = new UploadManager(cfg, fileRecorder);
                 //上传文件
                 Response response = uploadManager.put(file.getInputStream(),OssHandler.getKey(fileType,fileName).replace("\\","/"),upToken,null,null);
                 //获取回调
                 DefaultPutRet putRet = new Gson().fromJson(response.bodyString(),DefaultPutRet.class);
                data.setFk(putRet.key);
                data.setFileName(FilenameUtils.getName(file.getOriginalFilename()));
                data.setFileType(fileType);
                data.setSize(file.getSize());
                data.setCreateBy(ShiroUtils.getUserId().toString());
                data.setDomain(mp.get(QnYunProperties.OSS_DOMAIN.getValue()));
                data.setFileName(fileName);
                data.setFileHeard(contentType);
                data.setOssType(ossType);
                ossMapper.insertOlyOss(data);
                return OssResult.ok("上传成功",data);
 
             } catch (QiniuException e) {
                log.error(e.getMessage());
             }
             return OssResult.ok("上传成功",data);
       
    }

    @Override
    public OssResult ossAppointUpload(MultipartFile file, OlyStageRoot rootPath, String fileName) throws IOException {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public OssResult ossAppointUpload(MultipartFile file, OlyStageRoot rootPath) throws IOException {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public OssResult ossDelete(String key) {
        Map<String,String> mp=getQiNiuConfig();
        Configuration cfg = new Configuration(getQnYunZone(mp.get(QnYunProperties.OSS_ZONE.getValue())));
        //...其他参数参考类注释
        String bucket = mp.get(QnYunProperties.OSS_BUCKET.getValue());

        try {
            Auth auth =  getAuth(mp);
            BucketManager bucketManager = new BucketManager(auth, cfg);
          bucketManager.delete(bucket,key.replace("\\","/"));
          return OssResult.ok("删除成功",null);

        } catch (QiniuException e) {
            log.error(e.getMessage());
        }
        return OssResult.error("删除失败",null);
    }

    @Override
    public List<OlyOss> ossList(OlyOss olyOss) {
       olyOss= olyOss==null?new OlyOss():olyOss;
       olyOss.setOssType(ossType);
        return ossMapper.selectOlyOssList(olyOss);
    }
    
    private Map<String,String> getQiNiuConfig(){
        SysConfig sysConfig=new SysConfig();
        sysConfig.setConfigKey(OssEnum.OSS_PREFIX_QN.getValue()); 
        return  configService.selectConfigValueMap(sysConfig);
    }

    private Auth getAuth(Map<String,String> mp) throws QiniuException {
        String accessKey = mp.get(QnYunProperties.OSS_ACCESS_KEY.getValue());
        String secretKey = mp.get(QnYunProperties.OSS_SECRET_KEY.getValue());
        String bucket = mp.get(QnYunProperties.OSS_BUCKET.getValue());
        String zone=mp.get(QnYunProperties.OSS_ZONE.getValue());
        if (StringUtils.isAnyBlank(accessKey,secretKey,bucket,zone))
        {
            throw new QiniuException(null,"请先七牛配置");
        }
        Auth auth = Auth.create(accessKey, secretKey);
      return  auth;
    }

    private Zone getQnYunZone(String z) {
        Zone zone;
          switch (z) {
              case "z0":
                  zone = Zone.zone0();
                  break;
              case "z1":
                  zone = Zone.zone1();
                  break;
              case "z2":
                  zone = Zone.zone2();
                  break;
              case "na0":
                  zone = Zone.zoneNa0();
                  break;
              case "as0":
                  zone = Zone.zoneAs0();
                  break;
              default:
                  // Default is detecting zone automatically
                  zone = Zone.autoZone();
          }
          return zone;
  }

    @Override
    public String getThumbKey(String fk) {
        return fk+configService.getConfigByKey(QnYunProperties.OSS_STYLE_RULE.getValue());
    }
    
}
