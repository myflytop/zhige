package com.oly.cms.general.taglib;

import org.springframework.stereotype.Service;

import com.ruoyi.common.utils.StringUtils;

@Service("commonTag")
public class CommonTag {

    public String[] split(String s) {
        if (StringUtils.isEmpty(s.trim())) {
            return null;
        }
        return s.split(",");
    }
}
