package com.ruoyi.oss.factory;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.PostConstruct;

import com.ruoyi.oss.properties.OssConfigProperties;
import com.ruoyi.oss.service.OssHandler;
import com.ruoyi.oss.service.impl.NativeOssHandler;
import com.ruoyi.oss.service.impl.QiNiuOssHander;
import com.ruoyi.system.config.service.impl.SysConfigServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;

@Component
public class OssFactory {
    @Autowired
    private ApplicationContext applicationContext;
    @Autowired
    private SysConfigServiceImpl configService;
    private Map<String, OssHandler> fileRepoMap = new HashMap<>();

    @PostConstruct
    public void init() {
        fileRepoMap.put("native", applicationContext.getBean(NativeOssHandler.class));
        fileRepoMap.put("qiniu", applicationContext.getBean(QiNiuOssHander.class));

    }

    public OssHandler get() {
        String scheme = configService.selectConfigDefauleValue(OssConfigProperties.OSS_CONFIG_GROUP.getValue(),
                OssConfigProperties.OSS_USED);
        return fileRepoMap.get(scheme);
    }
}
