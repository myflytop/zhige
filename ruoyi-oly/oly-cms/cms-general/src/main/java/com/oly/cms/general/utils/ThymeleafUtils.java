package com.oly.cms.general.utils;

import com.ruoyi.common.utils.StringUtils;

public class ThymeleafUtils {

    public static String[] split(String s) {
        if (StringUtils.isEmpty(s.trim())) {
            return null;
        }
        return s.split(",");
    }

}
