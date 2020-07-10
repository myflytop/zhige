package com.ruoyi.oss.factory;

import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.oss.api.OssHandler;

import com.ruoyi.oss.natives.impl.NativeOssHandler;
import com.ruoyi.oss.qiniu.impl.QiNiuOssHander;
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
        fileRepoMap.put("qiniu", applicationContext.getBean(QiNiuOssHander.class));
    }

    public OssHandler get() {
        String scheme = configService.selectConfigValueByKey("oss_used");
        if (StringUtils.isBlank(scheme)) {
            scheme = "native";
        }
        return fileRepoMap.get(scheme);
    }
}
