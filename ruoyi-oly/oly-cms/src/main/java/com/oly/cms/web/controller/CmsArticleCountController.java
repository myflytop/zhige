package com.oly.cms.web.controller;

import java.util.List;

import com.oly.cms.system.model.po.CmsArticleCount;
import com.oly.cms.system.model.po.record.CmsCollectRecord;
import com.oly.cms.system.model.po.record.CmsLikeRecord;
import com.oly.cms.system.model.po.record.CmsLookRecord;
import com.oly.cms.system.model.po.record.CmsNastyRecord;
import com.oly.cms.system.model.po.record.CmsScoreRecord;
import com.oly.cms.system.model.po.record.CmsShareRecord;
import com.oly.cms.system.service.ICmsArticleCountService;
import com.oly.cms.web.CmsCommonController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 文章统计Controller
 * 
 */
@Controller
@RequestMapping("/cms/articleCount")
public class CmsArticleCountController extends CmsCommonController {
    private String prefix = acceptPreifx + "articleCount/";

    @Autowired
    private ICmsArticleCountService cmsArticleCountService;

    /**
     * 统计视图
     * 
     * @param view
     * @return
     */
    @RequiresPermissions("cms:articleCount:view")
    @GetMapping("/{view}")
    public String articleCount(@PathVariable("view") String view) {
        return prefix + view;
    }

    /**
     * 查询文章统计列表
     */
    @RequiresPermissions("cms:articleCount:list")
    @PostMapping("/articleCount")
    @ResponseBody
    public TableDataInfo list(CmsArticleCount cmsArticleCount) {
        startPage();
        List<CmsArticleCount> list = cmsArticleCountService.selectCmsArticleCountList(cmsArticleCount);
        return getDataTable(list);
    }

    /**
     * 导出文章统计列表
     */
    @RequiresPermissions("cms:articleCount:export")
    @Log(title = "文章统计", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(CmsArticleCount cmsArticleCount) {
        List<CmsArticleCount> list = cmsArticleCountService.selectCmsArticleCountList(cmsArticleCount);
        ExcelUtil<CmsArticleCount> util = new ExcelUtil<CmsArticleCount>(CmsArticleCount.class);
        return util.exportExcel(list, "articleCount");
    }

    /**
     * 查询文章统计列表
     */
    @RequiresPermissions("cms:articleCount:list")
    @PostMapping("/lookRecord")
    @ResponseBody
    public TableDataInfo lookRecord(CmsLookRecord lookRecord) {
        startPage();
        List<CmsLookRecord> list = cmsArticleCountService.listLookRecord(lookRecord);
        return getDataTable(list);

    }

    /**
     * 查询文章统计列表
     */
    @RequiresPermissions("cms:articleCount:list")
    @PostMapping("/likeRecord")
    @ResponseBody
    public TableDataInfo likeRecord(CmsLikeRecord likeRecord) {
        startPage();
        List<CmsLikeRecord> list = cmsArticleCountService.listLikeRecord(likeRecord);
        return getDataTable(list);
    }

    /**
     * 查询文章统计列表
     */
    @RequiresPermissions("cms:articleCount:list")
    @PostMapping("/collectRecord")
    @ResponseBody
    public TableDataInfo collectRecord(CmsCollectRecord collectRecord) {
        startPage();
        List<CmsCollectRecord> list = cmsArticleCountService.listCollectRecord(collectRecord);
        return getDataTable(list);
    }

    /**
     * 查询文章统计列表
     */
    @RequiresPermissions("cms:articleCount:list")
    @PostMapping("/shareRecord")
    @ResponseBody
    public TableDataInfo shareRecord(CmsShareRecord shareRecord) {
        startPage();
        List<CmsShareRecord> list = cmsArticleCountService.listShareRecord(shareRecord);
        return getDataTable(list);
    }

    /**
     * 查询文章统计列表
     */
    @RequiresPermissions("cms:articleCount:list")
    @PostMapping("/nastyRecord")
    @ResponseBody
    public TableDataInfo nastyRecord(CmsNastyRecord nastyRecord) {
        startPage();
        List<CmsNastyRecord> list = cmsArticleCountService.listNastyRecord(nastyRecord);
        return getDataTable(list);
    }

    /**
     * 查询文章统计列表
     */
    @RequiresPermissions("cms:articleCount:list")
    @PostMapping("/scoreRecord")
    @ResponseBody
    public TableDataInfo scoreRecord(CmsScoreRecord scoreRecord) {
        startPage();
        List<CmsScoreRecord> list = cmsArticleCountService.listScoreRecord(scoreRecord);
        return getDataTable(list);
    }

}
