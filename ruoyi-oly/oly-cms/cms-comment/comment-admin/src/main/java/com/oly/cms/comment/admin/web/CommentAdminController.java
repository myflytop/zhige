package com.oly.cms.comment.admin.web;

import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oly.cms.comment.model.CmsComment;
import com.oly.cms.comment.model.CmsCommentHand;
import com.oly.cms.comment.model.enums.CommentVisibleEnums;
import com.oly.cms.comment.model.vo.CmsCommentVo;
import com.oly.cms.comment.service.ICmsCommentHandService;
import com.oly.cms.comment.service.impl.CmsCommentServiceImpl;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.enums.OperateTitle;
import com.ruoyi.system.config.service.impl.SysConfigServiceImpl;

/**
 * 评论管理
 */
@Controller
@RequestMapping("/cms/comment")
public class CommentAdminController extends BaseController {
    @Autowired
    private CmsCommentServiceImpl cmsCommentService;

    @Autowired
    private ICmsCommentHandService cmsCommentHandService;

    @Autowired
    private SysConfigServiceImpl sysConfigService;

    private final String prefix = "cms/comment";

    @GetMapping
    @RequiresPermissions("cms:comment:view")
    public String comment() {
        return prefix + "/comment";
    }

    @GetMapping("/hand/{commentId}")
    @RequiresPermissions("cms:comment:hand")
    public String hand(@PathVariable("commentId") String commentId, ModelMap mp) {
        mp.put("commentId", commentId);
        return prefix + "/hand";
    }

    @RequiresPermissions("comment:config:view")
    @GetMapping("/commentConfig")
    public String commentConfig(ModelMap mmp) {
        return prefix + "/commentConfig";
    }

    /**
     * 修改保存参数配置
     * 通过key批量保存
     * 默认设置为字符串类型
     * 
     * @param mp
     * @return
     */
    @RequiresPermissions("comment:config:edit")
    @Log(title = OperateTitle.CMS_COMMENT, businessType = BusinessType.UPDATE)
    @PostMapping("/updateByGk")
    @ResponseBody
    public AjaxResult editByGkSaves(@RequestParam Map<String, String> mp) {
        return toAjax(sysConfigService.updatesByMap(mp));
    }

    @RequiresPermissions("cms:comment:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(CmsComment cmsComment) {
        startPage();
        List<CmsCommentVo> list = cmsCommentService.listCmsCommentVo(cmsComment);
        return getDataTable(list);
    }

    @RequiresPermissions("cms:comment:hand")
    @PostMapping("/handList")
    @ResponseBody
    public TableDataInfo hangList(CmsCommentHand cmsCommentHand) {
        startPage();
        List<CmsCommentHand> list = cmsCommentHandService.listCmsCommentHand(cmsCommentHand);
        return getDataTable(list);
    }

    /**
     * @param ids
     * @return
     */
    @PostMapping("/deleteCmsCommentHandByIds")
    @Log(title = OperateTitle.CMS_COMMENT, businessType = BusinessType.DELETE)
    @RequiresPermissions("cms:comment:remove")
    @ResponseBody
    public AjaxResult deleteCmsCommentHandByIds(String ids) {

        return toAjax(cmsCommentHandService.deleteCmsCommentHandByHandIds(ids));
    }

    /**
     * 评论审核
     * 
     * @param ids
     * @return
     */
    @PostMapping("/updateCommentVisible")
    @Log(title = OperateTitle.CMS_COMMENT, businessType = BusinessType.UPDATE)
    @RequiresPermissions("cms:comment:edit")
    @ResponseBody
    public AjaxResult updateCommentVisible(String ids, CommentVisibleEnums visibleEnums) {
        return toAjax(cmsCommentService.updateCmsCommentVisible(ids, visibleEnums));
    }

    /**
     * @param ids
     * @return
     */
    @PostMapping("/deleteCmsCommentByIds")
    @Log(title = OperateTitle.CMS_COMMENT, businessType = BusinessType.DELETE)
    @RequiresPermissions("cms:comment:remove")
    @ResponseBody
    public AjaxResult deleteCmsCommentByIds(String ids) {

        return toAjax(cmsCommentService.deleteCmsCommentByCommentIds(ids));
    }

}
