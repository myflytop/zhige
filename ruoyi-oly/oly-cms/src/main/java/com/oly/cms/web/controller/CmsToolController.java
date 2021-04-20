package com.oly.cms.web.controller;

import java.io.File;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.oly.cms.system.service.CmsToolService;
import com.oly.common.constant.OlyPagePrefix;
import com.oly.common.model.properties.OlyWebConfigProetries;
import com.oly.common.utils.site.GenerateMapUtils;
import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.OlyStageRoot;
import com.ruoyi.system.service.impl.SysConfigServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/cms/tool")
public class CmsToolController extends BaseController{

    @Autowired
    private CmsToolService toolService;

    @Autowired
    private SysConfigServiceImpl sysConfigService;
    
    /**
     * 一键生成sateMap
     * @return
     */
    @PostMapping("/siteMapXml")
    @ResponseBody
    public AjaxResult siteMapXml() {
    String basePath=RuoYiConfig.getWorkPath()+File.separator+OlyStageRoot.SITE_DIR.getDir();
    Map<String,List<String>> mnMap=new HashMap<>();
    List<String> em=new ArrayList<>();
    em.add("");
    mnMap.put(OlyPagePrefix.indexPage,em);
    mnMap.put(OlyPagePrefix.catsPage,em);
    mnMap.put(OlyPagePrefix.catPage,toolService.listCatIds(null));
    mnMap.put(OlyPagePrefix.tagsPage,em);
    mnMap.put(OlyPagePrefix.tagPage,toolService.listTagIds(null));
    mnMap.put(OlyPagePrefix.postsPage,em);
    mnMap.put(OlyPagePrefix.postPage,toolService.listPostIds(null));
    mnMap.put(OlyPagePrefix.aboutPage,em);
    mnMap.put(OlyPagePrefix.linksPage,em);
    mnMap.put(OlyPagePrefix.aboutPage,em);
    GenerateMapUtils.generateBaiDuMap(basePath,sysConfigService.selectConfigByKey(OlyWebConfigProetries.INDEX.getValue()),mnMap, "siteMap");
    //主页
    //所有文章
    //分类{单个分类 文章，所有分类}
    //标签{单个标签 文章，所有标签}
    //外链列表
    //自定义页
        return success();
    }

     /**
     *根据时间生成
     * @return
     */
    @PostMapping("/siteMapXmlByByBeginTime")
    @ResponseBody
    public AjaxResult siteMapXmlByBeginTime(String beginTime) {
    String basePath=RuoYiConfig.getWorkPath()+File.separator+OlyStageRoot.SITE_DIR.getDir();
    Map<String,List<String>> mnMap=new HashMap<>();
    List<String> em=new ArrayList<>();
    em.add("");
    mnMap.put(OlyPagePrefix.indexPage,em);
    mnMap.put(OlyPagePrefix.catsPage,em);
    mnMap.put(OlyPagePrefix.catPage,toolService.listCatIds(beginTime));
    mnMap.put(OlyPagePrefix.tagsPage,em);
    mnMap.put(OlyPagePrefix.tagPage,toolService.listTagIds(beginTime));
    mnMap.put(OlyPagePrefix.postsPage,em);
    mnMap.put(OlyPagePrefix.postPage,toolService.listPostIds(beginTime));
    mnMap.put(OlyPagePrefix.aboutPage,em);
    mnMap.put(OlyPagePrefix.linksPage,em);
    mnMap.put(OlyPagePrefix.aboutPage,em);
    GenerateMapUtils.generateBaiDuMap(basePath,sysConfigService.selectConfigByKey(OlyWebConfigProetries.INDEX.getValue()),mnMap, "siteMap");
    //主页
    //所有文章
    //分类{单个分类 文章，所有分类}
    //标签{单个标签 文章，所有标签}
    //外链列表
    //自定义页
        return success();
    }




    

}
