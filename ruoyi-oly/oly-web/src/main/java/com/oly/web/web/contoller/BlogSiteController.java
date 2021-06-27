package com.oly.web.web.contoller;

import com.ruoyi.common.enums.OlyStageRoot;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class BlogSiteController {
    
    @GetMapping("siteMap.xml")
    public void getSiteMap(){
    OlyStageRoot.SITE_DIR.getDir();

    }



    
}
