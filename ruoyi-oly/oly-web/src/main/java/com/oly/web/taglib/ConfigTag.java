package com.oly.web.taglib;

import java.util.Map;
import com.oly.comment.model.properties.OlyCommentProperties;
import com.oly.web.service.cache.BlogConfigCacheService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("configTag")
public class ConfigTag {
    @Autowired
    private BlogConfigCacheService bService;

    /**
     * 获取配置
     * 
     * @param group 组
     * @param key
     * @return
     */
    public String getConfigValue(String group, String key) {
        return bService.getConfigValueByGroupAndKey(group, key);
    }

    /**
     * 根据组获取配置转换为map
     * 
     * @param group
     * @return
     */
    public Map<String, String> getWebConfigByGroup(String group) {
        return bService.getWebConfigByGroup(group);
    }

    /**
     * @param value Enum.XX中的XX
     * @return
     */
    public String getSysConfigDefauleValue(String value) {
        return bService.getSysConfigDefauleValue(OlyCommentProperties.getEnum(value));
    }
}
