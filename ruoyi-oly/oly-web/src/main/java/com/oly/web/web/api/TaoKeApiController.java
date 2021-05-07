package com.oly.web.web.api;

import com.oly.web.model.parm.TaokeParm;
import com.oly.web.service.impl.TaokeServiceImpl;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.system.service.impl.SysConfigServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.thymeleaf.spring5.view.ThymeleafViewResolver;
import java.util.HashMap;
import java.util.Map;
@CrossOrigin
@RestController
@RequestMapping("/api/taoke")
public class TaoKeApiController {
    //blog配置前缀
    private final String CONFIG_PREFIX="taoke.config";
    @Autowired
    private SysConfigServiceImpl sysConfigService;

    @Autowired
    private  TaokeServiceImpl taokeService;

    @Autowired
    @Qualifier("thymeleafViewResolver")
    private ThymeleafViewResolver viewResolver;

    /**
     * 刷新淘客全局变量配置
     * @return
     */
    @GetMapping("/taokeConfigRefresh")
    public AjaxResult refreshConfig(){
        Map<String, Object> vars = new HashMap<>();
        vars.put("taokeConfig", sysConfigService.selectConfigMap(CONFIG_PREFIX));
        viewResolver.setStaticVariables(vars);
        return AjaxResult.success();
    }

     /**
     * 刷新淘客全局变量配置
     * @return
     */
    @GetMapping("/list")
    public AjaxResult listTaoByTaoParam(TaokeParm taokeParm){
       
        return AjaxResult.success(taokeService.listTaokeByTaoKe(taokeParm));
    }
}