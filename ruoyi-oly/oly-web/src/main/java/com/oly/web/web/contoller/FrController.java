package com.oly.web.web.contoller;

import com.oly.web.web.service.FrPageService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 自定义页面
 */
@Controller
@RequestMapping("/fr")
public class FrController  {

    @Autowired
   private FrPageService frPageService;
    
    @GetMapping("/{page}")
    public String view(@PathVariable("page")String page ){
       return frPageService.fr("", page);
    }


    
}
