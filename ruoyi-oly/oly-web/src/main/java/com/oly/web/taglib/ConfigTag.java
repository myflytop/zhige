package com.oly.web.taglib;

import com.oly.framework.web.service.OlyCommonService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("configTag")
public class ConfigTag {
    @Autowired
    private OlyCommonService commonService;

    public String getWebConfigValueByKey(String key){

        return null;
    }

    public String getTaoConfigValueByKey(String key){

        return null;
    }
    
}
