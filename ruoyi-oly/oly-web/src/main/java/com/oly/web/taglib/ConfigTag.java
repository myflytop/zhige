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

    public String getConfigValue(String group, String key) {

        return bService.getConfigValueByGroupAndKey(group, key);
    }

    public Map<String, String> getWebConfigByGroup(String group) {
        return bService.getWebConfigByGroup(group);
    }

    /**
     *
     * @param value
     * @return
     */
    public String getSysConfigDefauleValue(String value) {
        return bService.getSysConfigDefauleValue(OlyCommentProperties.getEnum(value));
    }
}
