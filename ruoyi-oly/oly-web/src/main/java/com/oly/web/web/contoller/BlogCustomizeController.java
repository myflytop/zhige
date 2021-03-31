package com.oly.web.web.contoller;

import com.oly.web.web.CommonController;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.system.service.impl.SysConfigServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 自定义页面
 */
@Controller
@RequestMapping("/fr")
public class BlogCustomizeController extends CommonController {

    @Autowired
   private SysConfigServiceImpl  serviceImpl;
    
    @GetMapping("/{page}")
    public String view(String page ){
       return getPrefix(serviceImpl,"/"+ page);
    }


    
}
