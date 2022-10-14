package com.oly.cms.general.taglib;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.oly.cms.common.model.properties.OlyWebConfigProperties;
import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.config.service.ISysConfigService;

@Service("webTag")
public class WebTag {

    @Autowired
    private ISysConfigService configService;

    /**
     * 获取文章支持类型
     * 返回空或者长度为0表示支持所有
     * 
     * @param themeName
     * @return
     */
    public Integer[] getThemeSupportType(String themeName) {
        return Convert.toIntArray(",",
                configService.selectConfigDefaultValue(themeName, OlyWebConfigProperties.ARTICLE_TYPES));
    }

    /**
     * 验证当前类型文章是否支持
     * 
     * @param type      cacType tagType
     * @param themeName
     * @return
     */
    public boolean checkTagSupportTheme(int type, String themeName) {
        if (StringUtils.isEmpty(getThemeSupportType(themeName))) {
            return true;
        }
        return Arrays.asList(getThemeSupportType(themeName)).contains(type);
    }

}
