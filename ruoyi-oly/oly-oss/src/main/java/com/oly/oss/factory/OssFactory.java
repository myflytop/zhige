package com.oly.oss.factory;

import com.oly.oss.service.OssHandler;
import com.oly.oss.service.impl.NativeOssHandler;
import com.ruoyi.common.utils.StringUtils;

import com.ruoyi.system.service.impl.SysConfigServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.HashMap;
import java.util.Map;

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

    }

    public OssHandler get() {
        String scheme = configService.selectConfigByKey("oly.oss.used");
        if (StringUtils.isBlank(scheme)) {
            scheme = "native";
        }
        return fileRepoMap.get(scheme);
    }
}
