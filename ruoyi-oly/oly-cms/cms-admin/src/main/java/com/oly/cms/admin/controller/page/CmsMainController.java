package com.oly.cms.admin.controller.page;

import java.util.HashMap;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oly.cms.admin.web.CmsCommonController;
import com.oly.cms.comment.model.CmsComment;
import com.oly.cms.comment.model.enums.CommentVisibleEnums;
import com.oly.cms.common.domain.entity.CmsCat;
import com.oly.cms.common.domain.entity.CmsContact;
import com.oly.cms.common.domain.entity.CmsTag;
import com.oly.cms.common.domain.entity.CmsUnion;
import com.oly.cms.common.model.enums.ArticleVisibleEnums;
import com.oly.cms.general.model.record.CmsLogRecord;
import com.ruoyi.common.enums.CommonVisibleEnums;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.ShiroUtils;
import com.oly.cms.admin.model.vo.ArticleVo;
import com.oly.cms.admin.service.ICmsReportService;

@Controller
@RequestMapping("/cms/main")
public class CmsMainController extends CmsCommonController {

    private String prefix = acceptPrefix + "main";
    @Autowired
    private ICmsReportService cmsReportService;

    @GetMapping
    @RequiresPermissions("cms:main:view")
    public String main(ModelMap mm) {
        Map<String, Object> timeMap = new HashMap<>();
        timeMap.put("beginTime", DateUtils.getDate());
        timeMap.put("endTime", DateUtils.getDateDay());
        mm.put("user", ShiroUtils.getSysUser());
        ReportArticle(mm, timeMap);
        ReportLog(mm, timeMap);
        ReportTag(mm, timeMap);
        ReportComment(mm, timeMap);
        ReportContact(mm, timeMap);
        ReportUnion(mm, timeMap);
        return prefix + "/main";
    }

    private void ReportLog(ModelMap mm, Map<String, Object> timeMap) {
        CmsLogRecord cmsLogRecord = new CmsLogRecord();
        mm.put("log", cmsReportService.countCmsLogRecord(cmsLogRecord));
        cmsLogRecord.setParams(timeMap);
        mm.put("logNow", cmsReportService.countCmsLogRecord(cmsLogRecord));
    }

    private void ReportTag(ModelMap mm, Map<String, Object> timeMap) {
        mm.put("tag", cmsReportService.countCmsTag(new CmsTag()));
        mm.put("category", cmsReportService.countCmsCat(new CmsCat()));
    }

    private void ReportComment(ModelMap mm, Map<String, Object> timeMap) {
        CmsComment cmsComment = new CmsComment();
        mm.put("comment", cmsReportService.countCmsComment(cmsComment));
        cmsComment.setParams(timeMap);
        mm.put("commentNow", cmsReportService.countCmsComment(cmsComment));
        cmsComment.setParams(null);
        cmsComment.setFromBy(ShiroUtils.getUserId());
        cmsComment.setVisible(CommentVisibleEnums.PASS.ordinal());
        mm.put("myComment", cmsReportService.countCmsComment(cmsComment));
        cmsComment.setVisible(CommentVisibleEnums.CHECK.ordinal());
        mm.put("myCommentCheck", cmsReportService.countCmsComment(cmsComment));

    }

    private void ReportContact(ModelMap mm, Map<String, Object> timeMap) {
        CmsContact cmsContact = new CmsContact();
        mm.put("contact", cmsReportService.countCmsContact(cmsContact));
        cmsContact.setParams(timeMap);
        mm.put("contactNow", cmsReportService.countCmsContact(cmsContact));
        cmsContact.setParams(null);
        cmsContact.setVisible(CommonVisibleEnums.SHOW.ordinal());
        mm.put("myContact", cmsReportService.countCmsContact(cmsContact));
        cmsContact.setVisible(CommonVisibleEnums.HIDE.ordinal());
        mm.put("myContactCheck", cmsReportService.countCmsContact(cmsContact));
    }

    private void ReportUnion(ModelMap mm, Map<String, Object> timeMap) {
        CmsUnion cmsUnion = new CmsUnion();
        mm.put("union", cmsReportService.countCmsUnion(cmsUnion));
        cmsUnion.setParams(timeMap);
        mm.put("unionNow", cmsReportService.countCmsUnion(cmsUnion));
    }

    private void ReportArticle(ModelMap mm, Map<String, Object> timeMap) {
        ArticleVo artVo = new ArticleVo();
        mm.put("article", cmsReportService.countCmsArticle(artVo));
        artVo.setParams(timeMap);
        mm.put("articleNow", cmsReportService.countCmsArticle(artVo));
        artVo.setParams(null);
        artVo.setCreateBy(ShiroUtils.getUserIdStr());
        artVo.setVisible(ArticleVisibleEnums.PASS.ordinal());
        mm.put("myArticle", cmsReportService.countCmsArticle(artVo));
        artVo.setVisible(ArticleVisibleEnums.CHECK.ordinal());
        mm.put("myArticleCheck", cmsReportService.countCmsArticle(artVo));

    }

}
