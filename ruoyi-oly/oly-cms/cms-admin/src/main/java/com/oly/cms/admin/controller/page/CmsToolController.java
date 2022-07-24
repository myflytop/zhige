package com.oly.cms.admin.controller.page;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.oly.cms.admin.service.CmsToolService;
import com.oly.cms.common.constant.OlyPagePrefix;
import com.oly.cms.common.model.properties.OlyWebConfigProperties;
import com.oly.cms.common.utils.site.GenerateMapUtils;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.OlyStageRoot;
import com.ruoyi.system.config.service.ISysConfigService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 工具控制器
 */
@Controller
@RequestMapping("/cms/tool")
public class CmsToolController extends BaseController {

    @Autowired
    private CmsToolService toolService;

    @Autowired
    private ISysConfigService configService;

    /**
     * 依据主题 一键生成sateMap
     * 
     * @return
     */
    @PostMapping("/siteMapXml/{themeName}")
    @ResponseBody
    public AjaxResult siteMapXml(@PathVariable("themeName") String themeName) {
        String basePath = OlyStageRoot.SITE_DIR.getRoot("");
        Map<String, List<String>> mnMap = new HashMap<>();
        List<String> em = new ArrayList<>();
        em.add("");
        mnMap.put(OlyPagePrefix.indexPage, em);
        mnMap.put(OlyPagePrefix.catsPage, em);
        mnMap.put(OlyPagePrefix.catPage, toolService.listCatIds(null, themeName));
        mnMap.put(OlyPagePrefix.tagsPage, em);
        mnMap.put(OlyPagePrefix.tagPage, toolService.listTagIds(null, themeName));
        mnMap.put(OlyPagePrefix.postPage, toolService.listPostIds(null, themeName));
        mnMap.put(OlyPagePrefix.aboutPage, em);
        mnMap.put(OlyPagePrefix.linksPage, em);
        mnMap.put(OlyPagePrefix.aboutPage, em);
        GenerateMapUtils.generateBaiDuMap(basePath,
                configService.selectConfigDefauleValue(themeName, OlyWebConfigProperties.DOMAIN), mnMap, themeName);
        // 主页
        // 所有文章
        // 分类{单个分类 文章，所有分类}
        // 标签{单个标签 文章，所有标签}
        // 外链列表
        // 自定义页
        return success();
    }

    /**
     * 依据主题 根据时间生成
     * 
     * @return
     */
    @PostMapping("/siteMapXmlByByBeginTime/{themeName}")
    @ResponseBody
    public AjaxResult siteMapXmlByBeginTime(String beginTime, @PathVariable("themeName") String themeName) {
        String basePath = OlyStageRoot.SITE_DIR.getRoot("");
        Map<String, List<String>> mnMap = new HashMap<>();
        List<String> em = new ArrayList<>();
        em.add("");
        mnMap.put(OlyPagePrefix.indexPage, em);
        mnMap.put(OlyPagePrefix.catsPage, em);
        mnMap.put(OlyPagePrefix.catPage, toolService.listCatIds(beginTime, themeName));
        mnMap.put(OlyPagePrefix.tagsPage, em);
        mnMap.put(OlyPagePrefix.tagPage, toolService.listTagIds(beginTime, themeName));
        mnMap.put(OlyPagePrefix.postPage, toolService.listPostIds(beginTime, themeName));
        mnMap.put(OlyPagePrefix.aboutPage, em);
        mnMap.put(OlyPagePrefix.linksPage, em);
        GenerateMapUtils.generateBaiDuMap(basePath,
                configService.selectConfigDefauleValue(themeName, OlyWebConfigProperties.DOMAIN), mnMap, themeName);
        // 主页
        // 所有文章
        // 分类{单个分类 文章，所有分类}
        // 标签{单个标签 文章，所有标签}
        // 外链列表
        // 自定义页
        return success();
    }

}
