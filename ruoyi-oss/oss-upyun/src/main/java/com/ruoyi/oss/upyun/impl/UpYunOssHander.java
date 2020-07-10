package com.ruoyi.oss.upyun.impl;

import com.ruoyi.oss.api.OssHandler;
import com.ruoyi.oss.api.OssResult;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

public class UpYunOssHander implements OssHandler {

    
    @Override
    public OssResult ossUpload(MultipartFile file, String fileName)  {
        return null;
    }

    @Override
    public OssResult ossDelete(String filePath) {
        return null;
    }

    @Override
    public OssResult ossList(String path, String accept, int startNum, int maxNum) {
        return null;
    }
}
