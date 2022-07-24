package com.ruoyi.oss.service.impl;

import java.awt.image.BufferedImage;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.imageio.ImageIO;

import com.ruoyi.common.enums.OlyStageRoot;
import com.ruoyi.common.exception.file.FileSizeLimitExceededException;
import com.ruoyi.common.exception.file.InvalidExtensionException;
import com.ruoyi.common.utils.ShiroUtils;
import com.ruoyi.common.utils.file.FileUploadUtils;
import com.ruoyi.oss.domain.OlyOss;
import com.ruoyi.oss.mapper.OlyOssMapper;
import com.ruoyi.oss.model.OssResult;
import com.ruoyi.oss.properties.NativeProperties;
import com.ruoyi.oss.properties.OssConfigProperties;
import com.ruoyi.oss.service.OssHandler;
import com.ruoyi.oss.utils.FileTypes;
import com.ruoyi.oss.utils.OssUtils;
import com.ruoyi.system.config.service.ISysConfigService;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import net.coobird.thumbnailator.Thumbnails;

/**
 * 储存在本地
 */
@Service
public class NativeOssHandler implements OssHandler {
    /**
     * 缩略图前缀
     */
    public final static String THUMBNAIL_PREFIX = "thumbnail_";

    // 储存类型
    private final byte ossType = 0;

    @Autowired
    private ISysConfigService configService;

    @Autowired
    private OlyOssMapper ossMapper;

    private static final Logger log = LoggerFactory.getLogger(NativeOssHandler.class);

    @Override
    public OssResult ossUpload(MultipartFile file, int maxLength, long maxSize, boolean chan, String[] supportType)
            throws IOException, FileSizeLimitExceededException, InvalidExtensionException {

        OssHandler.check(file, maxLength, maxSize, supportType);
        // 设置返回结果
        OlyOss data = new OlyOss();
        // 验证支持文件后缀
        // 验证支持类型
        // file.getInputStream()必须在上传前使用，上传后使用将导致文件缓存失效
        String contentType = FileTypes.getFileHeader(file.getInputStream());
        // 二级目录
        String fileType = OssUtils.getFileTypeExtension(FileUploadUtils.getExtension(file));
        String key = OssHandler.getKey(fileType, file, chan);
        FileUploadUtils.upload(OlyStageRoot.UPLOAD_DIR.getRoot(key), file);
        data.setFileName(FilenameUtils.getName(file.getOriginalFilename()));
        data.setFileType(fileType);
        data.setSize(file.getSize());
        data.setCreateBy(ShiroUtils.getUserIdStr());
        data.setFk(OssHandler.pathToUrl(key));
        data.setOssType(ossType);
        data.setFileHeard(contentType);
        if (contentType.startsWith("image")) {
            String thumbnailKey = Paths
                    .get(FilenameUtils.getFullPathNoEndSeparator(key), THUMBNAIL_PREFIX + FilenameUtils.getName(key))
                    .toString();
            String thumbnailPath = OlyStageRoot.UPLOAD_DIR.getRoot(thumbnailKey);
            BufferedImage bufferedImage = ImageIO
                    .read(new FileInputStream(OlyStageRoot.UPLOAD_DIR.getRoot(key).toString()));
            Thumbnails.of(bufferedImage).size(THUMB_WIDTH, THUMB_HEIGHT).toFile(thumbnailPath.toString());
        }
        data.setDomain(configService.selectConfigValueByGk(OssConfigProperties.OSS_CONFIG_GROUP.getValue(),
                NativeProperties.OSS_DOMAIN.getValue()));
        ossMapper.insertOlyOss(data);
        return OssResult.ok("上传成功", data);
    }

    @Override
    public OssResult ossDelete(String key) {
        Path path = Paths.get(OlyStageRoot.UPLOAD_DIR.getRoot(key));
        try {
            Files.deleteIfExists(path);
        } catch (IOException e1) {
            log.error(key + "删除失败,原因本地可能不存在", e1);
        }
        if (FileTypes.getImg(FilenameUtils.getExtension(key))) {
            try {
                Files.deleteIfExists(Paths.get(OlyStageRoot.UPLOAD_DIR.getRoot(""),
                        FilenameUtils.getFullPathNoEndSeparator(key), THUMBNAIL_PREFIX + FilenameUtils.getName(key)));
            } catch (IOException e) {
                log.error(key + "附件删除失败,原因本地可能不存在", e);
            }
        }
        ossMapper.deleteOlyOssByFk(OssHandler.pathToUrl(key));
        return OssResult.ok("删除附件成功", null);
    }

    @Override
    public OssResult ossAppointUpload(MultipartFile file, OlyStageRoot rootPath, String fileName) throws IOException {
        // 直接上传 fileName即为key
        if (StringUtils.isNotEmpty(fileName)) {
            FileUploadUtils.upload(rootPath.getRoot(fileName), file);
        } else {
            // 时间路径
            fileName = OssHandler.getKey("", file, true);
            FileUploadUtils.upload(rootPath.getRoot(fileName), file);
        }
        OlyOss olyOss = new OlyOss();
        olyOss.setDomain(configService.selectConfigValueByGk(OssConfigProperties.OSS_CONFIG_GROUP.getValue(),
                NativeProperties.OSS_DOMAIN.getValue()));
        olyOss.setFk(OssHandler.pathToUrl(fileName));
        return OssResult.ok(fileName, olyOss);
    }

    @Override
    public OssResult ossAppointUpload(MultipartFile file, OlyStageRoot rootPath) throws IOException {
        return ossAppointUpload(file, rootPath, FilenameUtils.getName(file.getOriginalFilename()));
    }

    @Override
    public String getThumbKey(String fk) {
        return Paths.get(FilenameUtils.getFullPathNoEndSeparator(fk),
                NativeOssHandler.THUMBNAIL_PREFIX + FilenameUtils.getName(fk)).toString();
    }

    @Override
    public byte getOssType() {
        return ossType;
    }

}
