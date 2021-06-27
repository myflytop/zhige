package com.oly.oss.service.impl;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.imageio.ImageIO;

import com.oly.oss.domain.OlyOss;
import com.oly.oss.enums.NativeProperties;
import com.oly.oss.mapper.OlyOssMapper;
import com.oly.oss.model.OssResult;
import com.oly.oss.service.OssHandler;
import com.oly.oss.utils.FileTypes;
import com.oly.oss.utils.OssUtils;
import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.enums.OlyStageRoot;
import com.ruoyi.common.exception.file.FileSizeLimitExceededException;
import com.ruoyi.common.exception.file.InvalidExtensionException;
import com.ruoyi.common.utils.ShiroUtils;
import com.ruoyi.common.utils.file.FileUploadUtils;
import com.ruoyi.system.service.ISysConfigService;

import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import net.coobird.thumbnailator.Thumbnails;

@Service
public class NativeOssHandler implements OssHandler {
    private static final Logger log = LoggerFactory.getLogger(OssHandler.class);
    /**
     * 缩略图前缀
     */
    public final static String THUMBNAIL_PREFIX = "thumbnail_";

    public final static byte ossType = 0;

    @Autowired
    private ISysConfigService configService;

    @Autowired
    private OlyOssMapper ossMapper;

    @Override
    public OssResult ossUpload(MultipartFile file)
            throws IOException, FileSizeLimitExceededException, InvalidExtensionException {
        // 设置返回结果
        OlyOss data = new OlyOss();
        String ossRoot = getOssRoot();
        String key = null;
        // 验证支持文件后缀
        // 验证支持类型
        // file.getInputStream()必须在上传前使用，上传后使用将导致文件缓存失效
        String contentType = FileTypes.getFileHeader(file.getInputStream());
        // 二级目录
        String fileType = OssUtils.getStageDir(FileUploadUtils.getExtension(file));
        key = FileUploadUtils.upload(ossRoot, fileType, file, true);
        data.setFileName(FilenameUtils.getName(file.getOriginalFilename()));
        data.setFileType(fileType);
        data.setSize(file.getSize());
        data.setCreateBy(ShiroUtils.getUserId().toString());
        data.setFk(key);
        data.setOssType(ossType);
        data.setFileHeard(contentType);
        if (contentType.startsWith("image")) {
            String thumbnailKey = Paths.get(FilenameUtils.getFullPathNoEndSeparator(key),
                    THUMBNAIL_PREFIX + FileUploadUtils.getFileFullName(key)).toString();
            String thumbnailPath = Paths.get(ossRoot, thumbnailKey).toString();
            BufferedImage bufferedImage = ImageIO.read(new FileInputStream(Paths.get(ossRoot, key).toString()));
            Thumbnails.of(bufferedImage).size(THUMB_WIDTH, THUMB_HEIGHT).toFile(thumbnailPath.toString());
        }
        data.setDomain(configService.selectConfigByKey(NativeProperties.OSS_DOMAIN.getValue()));
        ossMapper.insertOlyOss(data);
        return OssResult.ok("上传成功", data);
    }

    @Override
    public OssResult ossDelete(String key) {
        Path path = Paths.get(getOssRoot(), key);
        try {
            if (FileTypes.getImg(FilenameUtils.getExtension(key))) {
                Files.deleteIfExists(Paths.get(getOssRoot(), FilenameUtils.getFullPathNoEndSeparator(key),
                        THUMBNAIL_PREFIX + FileUploadUtils.getFileFullName(key)));
            }
            Files.deleteIfExists(path);
        } catch (IOException e) {
            return OssResult.ok("删除附件成功", null);
        }
        ossMapper.deleteOlyOssByFk("/" + key.replace("\\", "/"));
        return OssResult.ok("删除附件成功", null);
    }

    @Override
    public List<OlyOss> ossList(OlyOss olyOss) {
        olyOss = olyOss == null ? new OlyOss() : olyOss;
        olyOss.setOssType(ossType);
        return ossMapper.selectOlyOssList(olyOss);
    }

    /**
     * 文件储存根目录
     * 
     * @return
     */
    public String getOssRoot() {

        return RuoYiConfig.getProfile();
    }

    /**
     * fileName 即为key
     */
    @Override
    public OssResult ossAppointUpload(MultipartFile file, OlyStageRoot rootPath, String fileName) throws IOException {
        fileName = "".equals(fileName) ? FileUploadUtils.getTimePath(file, "", false) : fileName;
        File desc = Paths.get(RuoYiConfig.getWorkPath(), rootPath.getDir(), fileName).toFile();
        if (!desc.exists()) {
            if (!desc.getParentFile().exists()) {
                desc.getParentFile().mkdirs();
            }
        }
        OlyOss olyOss = new OlyOss();
        olyOss.setDomain(configService.selectConfigByKey(NativeProperties.OSS_DOMAIN.getValue()));
        olyOss.setFk(fileName);
        // 上传
        file.transferTo(desc);
        return OssResult.ok(fileName, olyOss);
    }

    @Override
    public OssResult ossAppointUpload(MultipartFile file, OlyStageRoot rootPath) throws IOException {
        return ossAppointUpload(file, rootPath, "");
    }

    @Override
    public String getThumbKey(String fk) {
        return Paths.get(FilenameUtils.getFullPathNoEndSeparator(fk),
                NativeOssHandler.THUMBNAIL_PREFIX + FileUploadUtils.getFileFullName(fk)).toString();
    }

}
