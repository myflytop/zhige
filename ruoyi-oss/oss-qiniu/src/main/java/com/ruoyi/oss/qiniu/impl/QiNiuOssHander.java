package com.ruoyi.oss.qiniu.impl;

import com.google.gson.Gson;
import com.qiniu.common.QiniuException;
import com.qiniu.common.Zone;
import com.qiniu.http.Response;
import com.qiniu.storage.BucketManager;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;

import com.qiniu.storage.model.DefaultPutRet;
import com.qiniu.storage.model.FileInfo;
import com.qiniu.storage.model.FileListing;
import com.qiniu.storage.persistent.FileRecorder;
import com.qiniu.util.Auth;
import com.qiniu.util.StringMap;
import com.ruoyi.oss.api.OssHandler;
import com.ruoyi.oss.api.OssResult;
import com.ruoyi.oss.api.ResultData;
import com.ruoyi.oss.api.enums.OssEnum;
import com.ruoyi.oss.api.utils.FileTypes;
import com.ruoyi.oss.api.utils.OssUtils;
import com.ruoyi.oss.qiniu.enums.QnYunProperties;
import com.ruoyi.system.domain.SysConfig;
import com.ruoyi.system.service.ISysConfigService;
import com.ruoyi.system.service.impl.SysConfigServiceImpl;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.stream.Collectors;
@Service
public class QiNiuOssHander implements OssHandler {

    @Autowired
    private ISysConfigService configService;

    public Map<String,String> configToMap(){
        SysConfig sysConfig=new SysConfig();
        sysConfig.setConfigKey(OssEnum.OSS_PREFIX_QN.getValue());
      List<SysConfig> sysConfigs= configService.selectConfigList(sysConfig);
        Map<String, String> configMap = sysConfigs.stream().collect(Collectors.toMap(SysConfig::getConfigKey, SysConfig::getConfigValue));
        return  configMap;
    }

    /**
     * 实际key
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
        String contentType= FileTypes.getFileHeader(file.getInputStream());
        //验证文件
        if (OssHandler.checkFile(file,contentType)) {
            //获取后缀
            String suffer = FileTypes.getSuffex(originalBasename, index);
            //获取前缀
            String prefix = FileTypes.getPreifx(originalBasename, index);
            //构造路径路径
            String subDir = OssHandler.getPath();
            //构造文件名
            String baseName = prefix + "_" + StringUtils.remove(UUID.randomUUID().toString(), '-');
            //造文件路径
            String basePath=subDir+ FILE_SEPARATOR+baseName+'.' + suffer;
            Map<String,String> mp=configToMap();
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
                Response response = uploadManager.put(file.getInputStream(),basePath.replace("\\","/"),upToken,null,null);
                //获取回调
                DefaultPutRet putRet = new Gson().fromJson(response.bodyString(),DefaultPutRet.class);
                ResultData da=new ResultData();
                //上传路径/upload/2017/7/xx.png
                da.setFilePath(putRet.key);
                //实际key /upload/2017/7/xx.png
                //这里统一 去除/upload便于删除
                da.setKey(replaceKey(putRet.key));
                da.setDomain(mp.get(QnYunProperties.OSS_DOMAIN.getValue()));
                da.setFileName(originalBasename);
                da.setContentType(contentType);
                return OssResult.ok("上传成功",da);

            } catch (QiniuException e) {
                e.printStackTrace();
            }
        }

        return OssResult.error("验证失败,上传失败  ",null);
    }
    @Override
    public OssResult ossDelete(String filePath) {
        Path path = Paths.get(UPLOAD_SUB_DIR, filePath);
        filePath=path.toString();
        Map<String,String> mp=configToMap();
        Configuration cfg = new Configuration(getQnYunZone(mp.get(QnYunProperties.OSS_ZONE.getValue())));
        //...其他参数参考类注释
        String bucket = mp.get(QnYunProperties.OSS_BUCKET.getValue());

        try {
            Auth auth =  getAuth(mp);
            BucketManager bucketManager = new BucketManager(auth, cfg);

          bucketManager.delete(bucket,filePath.replace("\\","/"));
          return OssResult.ok("删除成功",null);

        } catch (QiniuException e) {
            e.printStackTrace();
        }
        return OssResult.error("删除失败",null);
    }
    @Override
    public OssResult ossList(String path, String accept, int startNum, int maxNum)  {
        Map<String,String> mp=configToMap();
        String bucket = mp.get(QnYunProperties.OSS_BUCKET.getValue());
        Configuration cfg = new Configuration(getQnYunZone(mp.get(QnYunProperties.OSS_ZONE.getValue())));
        Auth auth = null;
        try {
            auth = getAuth(mp);
        } catch (QiniuException e) {
            e.printStackTrace();
        }
        BucketManager bucketManager = new BucketManager(auth, cfg);
        //文件名前缀
        String prefix = FileTypes.endWidth(UPLOAD_SUB_DIR+path);
        //每次迭代的长度限制，最大1000，推荐值 1000
        int limit = 1000;
        //指定目录分隔符，列出所有公共前缀（模拟列出目录效果）。缺省值为空字符串
        String delimiter = "/";
try {
    FileListing fileListing = bucketManager.listFiles(bucket,prefix, null, limit, delimiter);
    List<ResultData> re = new ArrayList<>();
    FileInfo[] items = fileListing.items;
    String[] foldStrings= fileListing.commonPrefixes;
    if (items!=null&&items.length>0) {
        for (FileInfo item : items) {
            ResultData resultData = new ResultData();
            resultData.setDomain(mp.get(QnYunProperties.OSS_DOMAIN.getValue()));
            resultData.setFileName(item.key.substring(item.key.lastIndexOf("/") + 1));
            resultData.setFilePath(item.key);
            resultData.setKey(replaceKey(item.key));
            resultData.setContentType(FileTypes.getFileType(item.key));
            resultData.setFileType(false);
            if (FileTypes.getImg(resultData.getFileName())) {
                resultData.setThumb(true);
                resultData.setThumbPath(item.key + mp.get(QnYunProperties.OSS_STYLE_RULE.getValue()));
            }
            re.add(resultData);
        }
    }
    if(foldStrings!=null&&foldStrings.length>0) {
        for (String fold : foldStrings) {
            ResultData resultData = new ResultData();
            resultData.setDomain(mp.get(QnYunProperties.OSS_STYLE_RULE.getValue()));
            resultData.setFileType(true);
            resultData.setFilePath(fold);
            resultData.setKey(replaceKey(fold));
            resultData.setContentType("dir");
            String str = fold;//注意这里在最后多了一个/分隔符
            String[] strArr = str.split("/");//这里将第二个参数设置为-1
            resultData.setFileName(strArr[strArr.length - 1]);
            re.add(resultData);
        }
    }
  return OssResult.listOk("获取成功",re);
}
catch (Exception e)
{

}
        return OssResult.error("获取失败",null);
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


    private String replaceKey(String key){
        return key.replace(UPLOAD_SUB_DIR,"");
    }
}
