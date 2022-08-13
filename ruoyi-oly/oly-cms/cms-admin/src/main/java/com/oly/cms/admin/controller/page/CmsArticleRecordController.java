package com.oly.cms.admin.controller.page;

import java.util.List;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oly.cms.admin.web.CmsCommonController;
import com.oly.cms.common.domain.entity.CmsArticleCount;
import com.oly.cms.general.model.record.CmsLookRecord;
import com.oly.cms.hand.model.record.CmsCollectRecord;
import com.oly.cms.hand.model.record.CmsLikeRecord;
import com.oly.cms.hand.model.record.CmsNastyRecord;
import com.oly.cms.hand.model.record.CmsScoreRecord;
import com.oly.cms.hand.model.record.CmsShareRecord;
import com.oly.cms.hand.service.impl.CmsArticleRecordServiceImpl;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.enums.OperateTitle;
import com.ruoyi.common.utils.poi.ExcelUtil;

/**
 * 文章统计Controller
 * 
 */
@Controller
@RequestMapping("/cms/articleCount")
public class CmsArticleRecordController extends CmsCommonController {
    private String prefix = acceptPrefix + "articleCount/";

    @Autowired
    private CmsArticleRecordServiceImpl recordService;

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
     * 
     * @param cmsArticleCount
     * @return
     */
    @RequiresPermissions("cms:articleCount:list")
    @PostMapping("/articleCount")
    @ResponseBody
    public TableDataInfo list(CmsArticleCount cmsArticleCount) {
        startPage();
        List<CmsArticleCount> list = recordService.selectCmsArticleCountList(cmsArticleCount);
        return getDataTable(list);
    }

    @RequiresPermissions("cms:articleCount:export")
    @Log(title = OperateTitle.CMS_POST, businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(CmsArticleCount cmsArticleCount) {
        List<CmsArticleCount> list = recordService.selectCmsArticleCountList(cmsArticleCount);
        ExcelUtil<CmsArticleCount> util = new ExcelUtil<CmsArticleCount>(CmsArticleCount.class);
        return util.exportExcel(list, "articleCount");
    }

    /**
     * 
     * @param lookRecord
     * @return
     */
    @RequiresPermissions("cms:articleLook:list")
    @PostMapping("/lookRecord")
    @ResponseBody
    public TableDataInfo lookRecord(CmsLookRecord lookRecord) {
        startPage();
        List<CmsLookRecord> list = recordService.listLookRecord(lookRecord);
        return getDataTable(list);

    }

    /**
     * 
     * @param likeRecord
     * @return
     */
    @RequiresPermissions("cms:articleLike:list")
    @PostMapping("/likeRecord")
    @ResponseBody
    public TableDataInfo likeRecord(CmsLikeRecord likeRecord) {
        startPage();
        List<CmsLikeRecord> list = recordService.listLikeRecord(likeRecord);
        return getDataTable(list);
    }

    /**
     * 
     * @param collectRecord
     * @return
     */
    @RequiresPermissions("cms:articleCollect:list")
    @PostMapping("/collectRecord")
    @ResponseBody
    public TableDataInfo collectRecord(CmsCollectRecord collectRecord) {
        startPage();
        List<CmsCollectRecord> list = recordService.listCollectRecord(collectRecord);
        return getDataTable(list);
    }

    /**
     * 
     * @param shareRecord
     * @return
     */
    @RequiresPermissions("cms:articleShare:list")
    @PostMapping("/shareRecord")
    @ResponseBody
    public TableDataInfo shareRecord(CmsShareRecord shareRecord) {
        startPage();
        List<CmsShareRecord> list = recordService.listShareRecord(shareRecord);
        return getDataTable(list);
    }

    /**
     * 
     * @param nastyRecord
     * @return
     */
    @RequiresPermissions("cms:articleNasty:list")
    @PostMapping("/nastyRecord")
    @ResponseBody
    public TableDataInfo nastyRecord(CmsNastyRecord nastyRecord) {
        startPage();
        List<CmsNastyRecord> list = recordService.listNastyRecord(nastyRecord);
        return getDataTable(list);
    }

    /**
     * 
     * @param scoreRecord
     * @return
     */
    @RequiresPermissions("cms:articleScore:list")
    @PostMapping("/scoreRecord")
    @ResponseBody
    public TableDataInfo scoreRecord(CmsScoreRecord scoreRecord) {
        startPage();
        List<CmsScoreRecord> list = recordService.listScoreRecord(scoreRecord);
        return getDataTable(list);
    }

}
